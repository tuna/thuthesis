'use strict';

const path = require('path');
const gulp = require('gulp');
const lazypipe = require('lazypipe');
const util = require('gulp-util');
const del = require('del');
const gulpif = require('gulp-if');
const rename = require('gulp-rename');
const zip = require('gulp-zip');

const packageName = 'thuthesis';

const config = {
    template: {
        files: ['thuthesis.ins',
                'thuthesis.dtx',
                'thuthesis.bst',
                'thuthesis.sty',
                'ctex-fontset-thuthesis.def',
                'zhfonts.py',
                'Makefile',
                'README.md',
                'thuthesis.pdf'],
        generated: ['thuthesis.cls',
                    'thuthesis.cfg']
    },

    example: {
        files: ['main.tex',
                'shuji.tex',
                'main.pdf',
                'shuji.pdf',
                'data/*.tex',
                'figures/*.*', // TODO: better pattern
                'ref/*.bib']
    },

    dist: {
        root: './dist',
        zip: ''
    },

    isCTAN: false
};

function usage() {
    util.log('Usage:');
    util.log('\t make dist version=[x.y.z | ctan]');
    util.log('\t gulp build --version=[x.y.z | ctan]');
}

gulp.task('default', function(callback) {
    usage()

    callback();
});

gulp.task('bootstrap', function(callback) {
    if (!util.env.hasOwnProperty('version')) {
        usage();

        process.exit(1);
    }

    const version = util.env.version.toString().toLowerCase();
    config.isCTAN = version === 'ctan';

    util.log(util.colors.bgRed.white.bold('Ensure all files are generated.'));

    if (config.isCTAN) {
        config.dist.zip = `${packageName}.zip`;
    } else {
        config.template.files.push(...config.template.generated);
        config.dist.zip = `${packageName}-${version}.zip`;
    }

    util.log(`Removing ${config.dist.zip}...`);
    del.sync([path.join(config.dist.root, config.dist.zip)]);

    callback();
});

function readmeFilter() {
    const pattern = new RegExp('README.md', 'i');

    return lazypipe().pipe(function() {
        return gulpif(pattern, rename({
            extname: ''
        }))
    })();
}

gulp.task('build', ['bootstrap'], function(callback) {
    const src = [...config.template.files, ...config.example.files];

    return gulp.src(src, {
        cwdbase: true
    })
        .pipe(readmeFilter())
        .pipe(zip(config.dist.zip))
        .pipe(gulp.dest(config.dist.root));
})
