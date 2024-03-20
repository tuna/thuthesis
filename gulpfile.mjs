import minimist from 'minimist';
import path from 'path';
import log from 'fancy-log';
import color from 'ansi-colors';
import zip from 'gulp-zip';
import gulp from 'gulp';
import { deleteSync } from 'del';

const argv = minimist(process.argv.slice(2));

const packageName = 'thuthesis';

const config = {
    template: {
        files: [
                "LICENSE",
                'README.md',
                'CHANGELOG.md',
                'thuthesis.dtx',
                'thuthesis.ins',
                'tsinghua-name-bachelor.pdf',
                'thuthesis-*.bst',
                'thuthesis-*.bbx',
                'thuthesis-*.cbx',
                'Makefile',
                'latexmkrc',
                'thuthesis.pdf',
	],
        // generated should not be included for ctan archive
        generated: ['thuthesis.cls']
    },

    example: {
        files: [
		'thuthesis-example.tex',
        'thuthesis-example.pdf',
        'thusetup.tex',
        'data/*.tex',
        'figures/*.*',
        'ref/*.bib',
	],
	// preference for vscode
	pref: [
		'.vscode/*.*',
	]
    },

    dist: {
        root: './dist',
        files: [],
        build: '',
        zip: ''
    },
};

function usage() {
    log('Usage:');
    log('\t make dist version=x.y.z');
}

function _default(callback) {
    usage();
    callback();
}

function bootstrap(callback) {
    if (!argv.hasOwnProperty('version')) {
        usage();
        process.exit(1);
    }

    callback();
}

function cleanup(callback) {
    deleteSync([path.join(config.dist.root, config.dist.build)]);
    log(color.green.bold(`🍺 ${config.dist.zip} generated`));
    callback();
}

function copy(callback) {
    const src = config.dist.files;
    const dest = path.join(config.dist.root, config.dist.build);

    return gulp.src(src, {
        cwdbase: true,
	dot: true
    })
        .pipe(gulp.dest(dest));
}

function compress(callback) {
    const src = path.join(config.dist.build, '**/*');

    return gulp.src(src, {
        cwd: config.dist.root,
        cwdbase: true,
        dot: true
    })
        .pipe(zip(config.dist.zip))
        .pipe(gulp.dest(config.dist.root));
}

function init_self(callback) {
    config.dist.files = [...config.template.files, ...config.example.files, ...config.example.pref, ...config.template.generated];
    config.dist.build = `${packageName}-${argv.version}`;
    config.dist.zip = `${config.dist.build}.zip`;

    log(`Removing old ${config.dist.build}...`);
    deleteSync([path.join(config.dist.root, config.dist.build),
              path.join(config.dist.root, config.dist.zip)]);

    callback();
}

const build_self = gulp.series(init_self, copy, compress, cleanup);
const build = gulp.series(bootstrap, build_self);

export { build };
export default _default;
