[![Actions Status](https://github.com/tuna/thuthesis/workflows/Test/badge.svg)](https://github.com/tuna/thuthesis/actions)
[![GitHub downloads](https://img.shields.io/github/downloads/tuna/thuthesis/total)](https://github.com/tuna/thuthesis/releases)
[![GitHub commits](https://img.shields.io/github/commits-since/tuna/thuthesis/latest)](https://github.com/tuna/thuthesis/commits/master)
[![GitHub release](https://img.shields.io/github/v/release/tuna/thuthesis)](https://github.com/tuna/thuthesis/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/thuthesis)](https://www.ctan.org/pkg/thuthesis)


# ThuThesis

> Scroll down for the English version of README.

**ThuThesis** 是 **T**sing**h**ua **U**niversity **Thesis** LaTeX Template 的缩写。

此宏包旨在建立一个简单易用的清华大学学位论文 LaTeX 模板，包括本科综合论文训练、硕士论文、博士论文以及博士后出站报告。

**由于模板升级频繁，在开始使用和提问前，请确保您已经认真完整地阅读了使用说明文档和示例代码。**

## 版权

本项目采用 [LaTeX项目公共许可证 v1.3c](https://www.latex-project.org/lppl/lppl-1-3c/) 授权，任何违反该许可证使用 ThuThesis 的行为将被记录在 [耻辱柱](https://github.com/tuna/thuthesis/issues/754) 页面中，以示警告。

本项目分发的 `thu-fig-logo.pdf` 与 `thu-text-logo.pdf` 为载有清华大学校徽与校名的图形文件，用于制作制作本科生综合论文训练封面。这些图形从 [清华大学视觉形象系统](https://vi.tsinghua.edu.cn/) 获取，除裁剪周边空白外，项目维护者未进行任何其他修改。
请注意：相关图形与文字都是清华大学的注册商标，除此模板外，请勿用于任何其他用途。

## 下载

推荐下载**发布版**模板，里面包括具体使用说明以及示例文档：

* 模板使用说明（`thuthesis.pdf`）
* 示例文档（`thuthesis-example.pdf`）

在开始书写前，建议将 `thuthesis-example.tex` 复制或重命名为其他有意义的名称。

### 下载途径

* 发布版：
  * 仅下载：
    * [CTAN](https://www.ctan.org/pkg/thuthesis)：可能滞后正式发布少许时间。
    * [GitHub Releases](https://github.com/tuna/thuthesis/releases)：最新版的及时发布途径。
    * [TUNA 镜像站](https://mirrors.tuna.tsinghua.edu.cn/github-release/tuna/thuthesis/)：GitHub Releases 的镜像。
  * 在线编辑：
    * [TeXPage 模板](https://www.texpage.com/template/72b580ca-51fa-4ecc-82b3-0509bc1d6a07)（提供 Windows 中文字体）
    * [Overleaf 模板](https://www.overleaf.com/latex/templates/thuthesis-tsinghua-university-thesis-latex-template/cfwgcxtvkbsx) （[Overleaf 降低了免费账户的编译时间](https://www.overleaf.com/blog/changes-to-free-compile-timeouts-and-servers)， 使用本模板的项目会因为规模较大[容易超时](https://github.com/tuna/thuthesis/issues/984)）
* 开发版：[GitHub](https://github.com/tuna/thuthesis)

### 注意事项

* GitHub 仓库的开发版仅供开发者与需要尚未发布的功能的有经验的 TeX 用户使用，不提供任何保证。
* **任何在其他途径分发的 ThuThesis（包含其变体或衍生物）均不是官方版本，请谨慎使用。**

## 更新日志

每个版本的详细更新日志，请见 [CHANGELOG.md](CHANGELOG.md)。使用文档中也包含了这一内容。

## 升级

### 自动更新

通过 TeX 发行版工具（如 `tlmgr`）自动从 [CTAN](https://www.ctan.org/pkg/thuthesis) 更新。

### 手动更新

#### 发布版

下载发布版的 zip 包，使用其中的 `thuthesis.cls` 等文件覆盖原有的即可，无须额外操作。

#### 开发版

有两种获得开发版编译结果的方式：

1. 从 GitHub 上对应 commit 的名为 `Test` 的 workflow 中下载 `thuthesis-snapshot-release` 并解压，其中的 `dist` 文件夹包含了编译后的开发版代码。
2. 从 GitHub clone 项目源码或者下载源码 zip 包，执行 `xetex thuthesis.ins`。

## 提问

按推荐顺序排序：

* 先到 [FAQ](https://github.com/tuna/thuthesis/wiki/FAQ) 看看常见问题；
* 在 [GitHub Discussions](https://github.com/tuna/thuthesis/discussions) 搜索已有讨论，如果没有则提出新问题；
* 如果认为模板存在问题，可在 Issues 中使用相应的模板提出。
* 入门问题可以参考[wiki/新手指南](https://github.com/tuna/thuthesis/wiki/新手指南)学习

## Makefile的用法

```shell
make [{thesis|doc|clean|cleanall|distclean}]
```

### 目标
* `make thesis`    生成论文 `thuthesis-example.pdf`；
* `make doc`       生成模板使用说明书 `thuthesis.pdf`；
* `make clean`     删除示例文件的中间文件（不含 `thuthesis-example.pdf`）；
* `make cleanall`  删除示例文件的中间文件和 `thuthesis-example.pdf`；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDF。

---

# ThuThesis

**ThuThesis** is an abbreviation of **T**sing**h**ua **U**niversity **Thesis** LaTeX Template.

This package establishes a simple and easy-to-use LaTeX template for Tsinghua dissertations, including general undergraduate research papers, masters theses, doctoral dissertations, and postdoctoral reports. An English translation of this README follows the Chinese below.

**This template is subject to frequent changes. Please make sure you have read the usage documentation and example code completely and carefully before using and asking questions.**

## Copyright

This project is licensed under the [The LaTeX project public license v1.3c](https://www.latex-project.org/lppl/lppl-1-3c/). Any use of ThuThesis that violates this license will be recorded in the [Hall of Shame](https://github.com/tuna/thuthesis/issues/754).

The distributed `thu-fig-logo.pdf` and `thu-text-logo.pdf` files in this project contain the graphical emblem and name of Tsinghua University, and are used for creating undergraduate thesis covers only.
These graphics were obtained from the [Tsinghua University Visual Identity System](https://vi.tsinghua.edu.cn). No modifications were made by the project maintainers except cropping the white space. 
Note: Both the relevant graphics and text are registered trademarks of Tsinghua University. You must not use them for any other purposes except within this template.

## Downloads

**Published versions** are recommended. Specific usage documentation and examples can be found in the archive. At present, these documents are **only available in Chinese**:

* Template usage documentation (`thuthesis.pdf`)
* Template example (`thuthesis-example.pdf`)

Before you start writing, it is recommended to copy or rename `thuthesis-example.tex` to another meaningful name.

### Download Methods

* Published versions:
  * Download only:
    * [CTAN](https://www.ctan.org/pkg/thuthesis)
    * [GitHub Releases](https://github.com/tuna/thuthesis/releases)
    * [TUNA Mirrors](https://mirrors.tuna.tsinghua.edu.cn/github-release/tuna/thuthesis/): mirror of GitHub Releases
  * Online editor:
    * [TeXPage template](https://www.texpage.com/template/72b580ca-51fa-4ecc-82b3-0509bc1d6a07) (providing Chinese fonts of Windows)
    * [Overleaf template](https://www.overleaf.com/latex/templates/thuthesis-tsinghua-university-thesis-latex-template/cfwgcxtvkbsx) ([free compile time was reduced](https://www.overleaf.com/blog/changes-to-free-compile-timeouts-and-servers); projects using this template will be relatively large, and thus [likely to time-out](https://github.com/tuna/thuthesis/issues/984))
* Developer versions: [GitHub](https://github.com/tuna/thuthesis)

### Notes

* The development version in the GitHub repository is intended for developers and experienced TeX users who require unreleased features, and no guarantees are provided.
* **ThuThesis (including its variants / derivatives) distributed in any other way is NOT an official version. Use at your own risk.**

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for detailed changes in each release. They are also included in the usage documentation.

## Updates

### Automatic

Get the most up-to-date published version with your TeX distribution from [CTAN](https://www.ctan.org/pkg/thuthesis).

### Manual

#### Published versions

Download the published zip files, extract `thuthesis.cls` and other files (if needed) and override the existing ones in your thesis.

#### Development versions

There are two ways to obtain the compiled development version:

1. Download the `thuthesis-snapshot-release` from the `Test` workflow of the corresponding commit on GitHub and extract it. The `dist` folder contains the compiled template of development version.
2. Clone the project source code from GitHub or download the source code tarball, and run `xetex thuthesis.ins`.

## Reporting Issues

Please follow the procedure below:

* Check the [FAQ](https://github.com/tuna/thuthesis/wiki/FAQ).
* Search [GitHub Discussions](https://github.com/tuna/thuthesis/discussions) and create if not existed.
* Create an issue (with specified template) if you believe there is a bug.
* Beginners may go to [wiki/新手指南](https://github.com/tuna/thuthesis/wiki/新手指南) for basic information.

## Makefile Usage

```shell
make [{all|thesis|doc|clean|cleanall|distclean}]
```

### Targets
* `make thesis`    generate thesis `thuthesis-example.pdf`;
* `make doc`       generate template documentation thuthesis.pdf;
* `make clean`     delete all examples' files (excluding thuthesis-example.pdf);
* `make cleanall`  delete all examples' files and thuthesis-example.pdf;
* `make distclean` delete all examples' and templates' files and PDFs.
