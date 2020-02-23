[![Actions Status](https://github.com/xueruini/thuthesis/workflows/Test/badge.svg)](https://github.com/xueruini/thuthesis/actions)
[![Join the chat at https://gitter.im/thuthesis/Lobby](https://badges.gitter.im/thuthesis/Lobby.svg)](https://gitter.im/thuthesis/Lobby)
[![GitHub downloads](https://img.shields.io/github/downloads/xueruini/thuthesis/total)](https://github.com/xueruini/thuthesis/releases)
[![GitHub commits](https://img.shields.io/github/commits-since/xueruini/thuthesis/latest)](https://github.com/xueruini/thuthesis/commits/master)
[![GitHub release](https://img.shields.io/github/v/release/xueruini/thuthesis)](https://github.com/xueruini/thuthesis/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/thuthesis)](https://www.ctan.org/pkg/thuthesis)

# What's ThuThesis?
**ThuThesis** is an abbreviation of **T**sing**h**ua **U**niversity **Thesis** LaTeX Template.

This package establishes a simple and easy-to-use LaTeX template for Tsinghua dissertations, including general undergraduate research papers, masters theses, doctoral dissertations, and postdoctoral reports. An English translation of this README follows the Chinese below.


# ThuThesis 是什么？
**ThuThesis** 是 **T**sing**h**ua **U**niversity **Thesis** LaTeX Template 的缩写。

此宏包旨在建立一个简单易用的清华大学学位论文 LaTeX 模板，包括本科综合论文训练、硕士论文、博士论文以及博士后出站报告。

# 文档
请[下载](https://github.com/xueruini/thuthesis/releases)模板，里面包括具体使用说明以及示例文档：

* 模板使用说明 (thuthesis.pdf)
* 示例文档 (main.pdf)

# 下载
* 发行版：[CTAN](https://www.ctan.org/pkg/thuthesis)
* 开发版：[GitHub](https://github.com/xueruini/thuthesis)

# 升级
## 自动更新
通过 TeX 发行版工具自动从 [CTAN](https://www.ctan.org/pkg/thuthesis) 更新。

## 手动更新
从 [GitHub](https://github.com/xueruini/thuthesis) 下载放入论文目录，执行命令（Windows 用户在文件夹空白处按 `Shift + 鼠标右键`，点击“在此处打开命令行窗口”）：

```shell
xetex thuthesis.ins
```

即可得到 `thuthesis.cls` 等模板文件。

# 提问
按推荐顺序排序：

* 先到 [FAQ](https://github.com/xueruini/thuthesis/wiki/FAQ) 看看常见问题
* [GitHub Issues](https://github.com/xueruini/thuthesis/issues)

# Makefile的用法

```shell
make [{all|thesis|spine|doc|clean|cleanall|distclean}]
```

## 目标
* `make thesis`    生成论文 main.pdf；
* `make spine`     生成书脊 spine.pdf；
* `make doc`       生成模板使用说明书 thuthesis.pdf；
* `make all`       生成论文和书籍，相当于 `make thesis && make spine`；
* `make clean`     删除示例文件的中间文件（不含 main.pdf）；
* `make cleanall`  删除示例文件的中间文件和 main.pdf；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDF。

---

# Documentation
Download and unzip the template. Specific usage documentation and examples can be found in the files below. At present, these documents are <b>only available in Chinese</b>:
* Template usage (thuthesis.pdf)
* Template example (main.pdf)

# Downloads
* Published version: [CTAN](https://www.ctan.org/pkg/thuthesis)
* Developer version: [GitHub](https://github.com/xueruini/thuthesis)

# Updates
## Automatic
Get the most up-to-date published version with your TeX distribution from [CTAN](https://www.ctan.org/pkg/thuthesis).

## Manual
Download the package from [GitHub](https://github.com/xueruini/thuthesis) to the root directory of your thesis, then execute the command (Windows users `Shift + right click` white area in the file window and click "Open command line window here" from the popup menu):

```shell
xetex thuthesis.ins
```

You'll get `thuthesis.cls` along with other template files.

# Reporting Issues
Please follow the procedure below:

* Check the [FAQ](https://github.com/xueruini/thuthesis/wiki/FAQ)
* [GitHub Issues](https://github.com/xueruini/thuthesis/issues)

# Makefile Usage

```shell
make [{all|thesis|spine|doc|clean|cleanall|distclean}]
```

## Targets
* `make thesis`    generate thesis main.pdf;
* `make spine`     generate book spine for printing spine.pdf;
* `make doc`       generate template documentation thuthesis.pdf;
* `make all`       generate thesis and spine, same as `make thesis && make spine`;
* `make clean`     delete all examples' files (excluding main.pdf);
* `make cleanall`  delete all examples' files and main.pdf;
* `make distclean` delete all examples' and templates' files and PDFs.
