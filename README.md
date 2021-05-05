[![Actions Status](https://github.com/tuna/thuthesis/workflows/Test/badge.svg)](https://github.com/tuna/thuthesis/actions)
[![GitHub downloads](https://img.shields.io/github/downloads/tuna/thuthesis/total)](https://github.com/tuna/thuthesis/releases)
[![GitHub commits](https://img.shields.io/github/commits-since/tuna/thuthesis/latest)](https://github.com/tuna/thuthesis/commits/master)
[![GitHub release](https://img.shields.io/github/v/release/tuna/thuthesis)](https://github.com/tuna/thuthesis/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/thuthesis)](https://www.ctan.org/pkg/thuthesis)


# ThuThesis

Scroll down for the English version of README.

**ThuThesis** 是 **T**sing**h**ua **U**niversity **Thesis** LaTeX Template 的缩写。

此宏包旨在建立一个简单易用的清华大学学位论文 LaTeX 模板，包括本科综合论文训练、硕士论文、博士论文以及博士后出站报告。

**由于模板升级频繁，在开始使用和提问前，请确保您已经认真完整地阅读了使用说明文档和示例代码。**

**由于模板升级频繁，在开始使用和提问前，请确保您已经认真完整地阅读了使用说明文档和示例代码。**

**由于模板升级频繁，在开始使用和提问前，请确保您已经认真完整地阅读了使用说明文档和示例代码。**

## 下载

推荐下载**发布版**模板，里面包括具体使用说明以及示例文档：

* 模板使用说明（thuthesis.pdf）
* 示例文档（thuthesis-example.pdf）

开发版中不提供预生成的 `cls` 文件和文档，仅包含源码。其仅供开发者与需要尚未发布的功能的有经验的 TeX 用户使用，不提供任何保证。

下载途径：

* 发布版：
  * [CTAN](https://www.ctan.org/pkg/thuthesis)：可能滞后正式发布少许时间。
  * [GitHub Releases](https://github.com/tuna/thuthesis/releases)：最新版的及时发布途径。
  * [TUNA 镜像站](https://mirrors.tuna.tsinghua.edu.cn/github-release/tuna/thuthesis/)：GitHub Releases 的镜像。
  * [Overleaf](https://www.overleaf.com/latex/templates/thuthesis-tsinghua-university-thesis-latex-template/wddqnwbyhtnk)：Overleaf 的模板。
* 开发版：[GitHub](https://github.com/tuna/thuthesis)

## 更新日志

每个版本的详细更新日志，请见 [CHANGELOG.md](CHANGELOG.md)。使用文档中也包含了这一内容。

## 升级
### 自动更新
通过 TeX 发行版工具（如 `tlmgr`）自动从 [CTAN](https://www.ctan.org/pkg/thuthesis) 更新。

### 手动更新

#### 发布版

下载发布版的的 zip 包，使用其中的 `thuthesis.cls` 等文件覆盖原有的即可，无须额外操作。

#### 开发版

从 GitHub clone 项目源码或者下载源码 zip 包，执行命令（Windows 用户在文件夹空白处按 `Shift + 鼠标右键`，点击“在此处打开命令行窗口”）：

```shell
xetex thuthesis.ins
```

即可得到 `thuthesis.cls` 等模板文件。

## 提问
按推荐顺序排序：

* 先到 [FAQ](https://github.com/tuna/thuthesis/wiki/FAQ) 看看常见问题
* [GitHub Issues](https://github.com/tuna/thuthesis/issues)

## Makefile的用法

```shell
make [{all|thesis|spine|doc|clean|cleanall|distclean}]
```

### 目标
* `make thesis`    生成论文 thuthesis-example.pdf；
* `make spine`     生成书脊 spine.pdf；
* `make doc`       生成模板使用说明书 thuthesis.pdf；
* `make all`       生成论文和书脊，相当于 `make thesis && make spine`；
* `make clean`     删除示例文件的中间文件（不含 thuthesis-example.pdf）；
* `make cleanall`  删除示例文件的中间文件和 thuthesis-example.pdf；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDF。

---

# ThuThesis

**ThuThesis** is an abbreviation of **T**sing**h**ua **U**niversity **Thesis** LaTeX Template.

This package establishes a simple and easy-to-use LaTeX template for Tsinghua dissertations, including general undergraduate research papers, masters theses, doctoral dissertations, and postdoctoral reports. An English translation of this README follows the Chinese below.

**This template is subject to frequent changes. Please make sure you have read the usage documentation and example code completely and carefully before using and asking questions.**

## Downloads

**Published versions** are recommended. Specific usage documentation and examples can be found in the archive. At present, these documents are <b>only available in Chinese</b>:
* Template usage documentation (thuthesis.pdf)
* Template example (thuthesis-example.pdf)

Developer versions contain only source code but no pre-compiled `cls` file and documentations. They are only for the usage of developers and experienced TeX users in need of unpublished features. No warranties are provided.

* Published versions：
  * [CTAN](https://www.ctan.org/pkg/thuthesis)
  * [GitHub Releases](https://github.com/tuna/thuthesis/releases)
  * [TUNA Mirrors](https://mirrors.tuna.tsinghua.edu.cn/github-release/tuna/thuthesis/): mirror of GitHub Releases
  * [Overleaf Template](https://www.overleaf.com/latex/templates/thuthesis-tsinghua-university-thesis-latex-template/wddqnwbyhtnk)
* Developer versions: [GitHub](https://github.com/tuna/thuthesis)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for detailed changes in each release. They are also included in the usage documentation.

## Updates
### Automatic
Get the most up-to-date published version with your TeX distribution from [CTAN](https://www.ctan.org/pkg/thuthesis).

### Manual

#### Published versions

Download the published zip files, extract `thuthesis.cls` and other files (if needed) and override the existing ones in your thesis.

#### Developer versions

Download the source code package and unzip to the root directory of your thesis (or clone this project), then execute the command (Windows users `Shift + right click` white area in the file window and click "Open command line window here" from the popup menu):

```shell
xetex thuthesis.ins
```

You'll get `thuthesis.cls` along with other template files.

## Reporting Issues
Please follow the procedure below:

* Check the [FAQ](https://github.com/tuna/thuthesis/wiki/FAQ)
* [GitHub Issues](https://github.com/tuna/thuthesis/issues)

## Makefile Usage

```shell
make [{all|thesis|spine|doc|clean|cleanall|distclean}]
```

### Targets
* `make thesis`    generate thesis thuthesis-example.pdf;
* `make spine`     generate book spine for printing spine.pdf;
* `make doc`       generate template documentation thuthesis.pdf;
* `make all`       generate thesis and spine, same as `make thesis && make spine`;
* `make clean`     delete all examples' files (excluding thuthesis-example.pdf);
* `make cleanall`  delete all examples' files and thuthesis-example.pdf;
* `make distclean` delete all examples' and templates' files and PDFs.
