# What's ThuThesis?
ThuThesis is a LaTeX thesis template package for Tsinghua University supporting from bachelor, master, doctor dissertations to post-doc report. Since the users of this package are supposed to be Chinese or those understand Chinese, the following of this file and all other documents are written in Chinese only.

# ThuThesis是什么？
ThuThesis为 <b>T</b>sing<b>h</b>ua <b>U</b>niversity <b>Thesis</b> LaTeX Template之缩写。

此宏包旨在建立一个简单易用的清华大学学位论文LaTeX模板，包括本科综合论文训练、硕士论文、博士论文、博士哲学论文以及博士后出站报告。现在支持本科、硕士、博士论文、博士后出站报告格式，对其它格式（还有么？）的支持会陆续加入。

# 文档
请下载模板，里面包括具体使用说明以及示例文档：

* 模板使用说明 (thuthesis.pdf)
* 示例文档 (main.pdf)

# 下载

* 发行版：[CTAN](http://www.ctan.org/pkg/thuthesis)
* 开发版：[GitHub](https://github.com/xueruini/thuthesis)

# 升级
## 自动更新
通过TeX发行版工具自动从[CTAN](http://www.ctan.org/pkg/thuthesis)更新。

## 手动更新
从 [GitHub](https://github.com/xueruini/thuthesis)下载放入论文目录，执行命令：

    $ latex thuthsis.ins

# 提问
按推荐顺序排序：

* [Github Issues](http://github.com/xueruini/thuthesis/issues)
* [TeX@newsmth](http://www.newsmth.net/nForum/#!board/TeX)
* [ThuThesis@Google Groups](http://groups.google.com/group/thuthesis)

---

# Makefile的用法

    make [{all|thesis|shuji|doc|clean|distclean}] \
         [METHOD={xelatex|pdflatex|dvipdfmx}] \
         [TEXI2DVI=<tex2dvi>]

## 目标
* `make all`       等于 `make thesis && make shuji && make doc`；
* `make cls`       生成模板文件；
* `make thesis`    生成论文 main.pdf；
* `make shuji`     生成书脊 shuji.pdf；
* `make doc`       生成使用说明书 thuthesis.pdf；
* `make clean`     删除 pdf 外的所有中间文件和目标文件；
* `make distclean` 表示清除包括 pdf 在内的所有中间文件和目标文件。

## 参数
* **METHOD**：指定生成 pdf 的方式，缺省采用 xelatex。
  * METHOD=xelatex  表示使用 xelatex 引擎编译生成 pdf；
  * METHOD=pdflatex 表示使用 pdflatex 引擎编译生成 pdf；
  * METHOD=dvipdfmx 表示使用 texi2dvi -> dvipdfmx 的方式生成 pdf。
  * METHOD=latexmk  表示使用 latexmk 的方式生成 pdf。
* **TEXI2DVI**： `texi2dvi` 实用工具的文件名，该工具的作用是自动重复运行latex 若
        干遍，直至所有交叉引用都正确为止。在有的发行版中该工具的文件名不叫
        `texi2dvi`，譬如 CTeX 下的这个工具就叫 `texify`。遇到这种情况可以在命令
        行通过 `TEXI2DVI=texify` 命令指定使用其它的 `texi2dvi` 工具。

