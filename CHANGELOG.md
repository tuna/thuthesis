# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [v6.0.0] - 2020-01-06
### Added
- 新增 `survey`（调研阅读报告）和 `translation`（书面翻译）环境用于本科生的附录，
  其中的参考文献引用独立于论文正文（#343）。
- 新增论文语言选项。
- 增加 `l3build` 测试。

### Changed
- 重新设计 `\thusetup` 的接口。
- 指导教师的姓名和职称用英文逗号分开（#424）。
- 重新设计封面（题名页）。
- `\makecover` 拆分为 `\maketitle`、`\copyrightpage`。
- 中英文摘分别用 `abstract`、`abstract*` 环境生成。
- 附录使用 `\appendix` 命令开始，不再使用 `appendix` 环境。
- 修改 `shuji` 为 `spine`。
- 修改 `acknowledgement` 为 `acknowledgements`。
- 从 travis 切换到 github actions。
- 更改日志从 `thuthesis.dtx` 挪到 `CHANGELOG.md`。
- 整理 Makefile，便于日常使用。

## Removed
- 移除 `secret` 选项。
- 移除 `translationbib` 环境。
- 移除 `tocarialchapter`、`tocarialchapterentry` 和 `tocarialchapterpage` 选项。
- 只保留 xelatex 编译方式。

### Fixed
- 修正本科生的文献引用样式。
- 修正本科生目录章标题的字体。
- 处理 `hyperref` 与 `unicode-math` 的兼容性问题。

## [v5.5.2] - 2019-04-21
### Changed
- 使用 XITS 数学字体。

## [v5.5.1] - 2019-04-16
### Changed
- `\thu@textcircled`: 修复 minipage 中 footnote 编号问题。

## [v5.5.0] - 2019-03-15
### Changed
- 增加选项使用英文模板。
- 使用 `unicode-math` 处理数学字体。
- Windows 的中文字体开启伪粗。
- `\thu@textcircled`: 去掉 `pifootnote` 选项。
- 移除 cfg 文件。
- 修正图表标题与文字之间的距离。
- `\thu@first@titlepage`: 修正博士后封面的格式。
- 增加 `nomencl` 宏包的支持。

## [v5.4.5] - 2018-05-17
### Changed
- `\normalsize`: 调整公式和正文间距。

## [v5.4.4] - 2018-04-22
### Changed
- 删除 `arialtitle`，所有论文格式都一样。
- 让目录中的引用不影响正文中引用序号。
- 参考文献列表的页码使用 hyphen 取代 en dash。
- 参考文献标号左对齐。
- 允许连续两个文献引用使用连接号。

## [v5.4.2] - 2017-12-18
### Changed
- 删除 `\pozhehao`。
- 使用 degree 取代 type 选项。

## [v5.4.1] - 2017-12-04
### Changed
- bst 在 ctan 上不分路径，故加前缀。

## [v5.4.0] - 2017-12-3
### Changed
- 基于 `natbib` 的环境调整距离兼容性更好。
- `\bibliographystyle{<newbib>}` will cause `\bibstyle@newbib` to be called on THE NEXT LATEX RUN (via the aux file).

## [v5.3.2] - 2017-05-01
### Changed
- 定理环境格式设置（环境标题和环境正文字体设置）统一放置到 .cfg 文件中。

## [v5.3.1] - 2016-03-20
### Changed
- 使用 CTeX 默认中文字体配置，支持不同引擎。
- `ctex` 默认加载 `CJKspace`。
- 几乎没人主动安装 Arial 字体。

## [v5.3.0] - 2016-03-11
### Changed
- 更新到研究生院 2016.3 指南。

## [v5.2.3] - 2016-02-13
### Changed
- `\thu@def@fontsize`: 改写字体定义命令。
- 安全注释本科公式部分。

## [v5.2.2] - 2016-02-01
### Changed
- 不希望 `newtx` 修改 `\@makefnmark`。
- 利用 `environ` 的 `\Collect@Body`。
- 目录中标题和页码都是链接。
- `\thu@textcircled`: 脚注编号每页允许至多 9 个。
- 基于 `footmisc` 来设置不同位置 footnote marker 样式。
- `\tableofcontents`: 用 `\patchcmd` 修改 `\@dottedtocline`。
- 用 `environ` 封装的 `\Collect@Body`。

## [v5.2.1] - 2016-01-14
### Changed
- 使用 `newtx` 替换 `txfonts`。
- 使用 `newtx` 字体。
- `denotation`: 利用 `enumitem` 改造环境定义，更直观。
- `acknowledgement`: 用 `acknowledgement` 替换 `ack`。

## [v5.2.0] - 2016-01-11
### Changed
- `\title`: 增加 `\title` 排版翻译标题。
- `translationbib`: 增加翻译文献环境 `translationbib`。
- `\publicationskip`: 增加 `\publicationskip`。

## [v5.1.0] - 2015-12-27
### Changed
- `\thusetup`: 通过 `\thusetup` 统一设置封面信息。
- `\thu@first@titlepage`: 利用 `CJKfilltwosides` 优化封面排版。
- `\thu@first@titlepage`: 修改联合指导教师显示问题。

## [v5.0.0] - 2015-12-21
### Changed
- 使用 `kvoptions` 简化选项 type。
- norggedbottom 选项修改为 raggedbottom。
- 删除 `paralist` 选项。
- 固定字体设置，同时改善与 `ctex` 兼容性。
- 不再将页面尺寸写入 dvi，因为已不支持 dvips， 而该方案会使得在使用 tikzexternalize 时外部 PDF 图片 BBox 不对。
- 用 `geometry` 简化设置。
- `\ps@thu@headings`: 利用 `fancyhdr` 设置页眉页脚。
- 修正定理字样为黑体 (#104)。
- 本科附录图表编号用-不用.（如图A-1，表A-2）。
- 用 `\ctexset` 来设置，替换复杂的 `\@startsection`。
- 修正章节间距问题(#57)
- 硕士博士论文目录只出现到第 3 级标题即可。其他未明确要求。
- `\tableofcontents`: 修正学位论文中目录里节前缩进(#103)
- `\makecover`: 使用 `pdfpages` 宏包支持本硕博论文授权说明扫描版(#36)。
- `acknowledgement`: 使用 pdfpages 宏包支持本硕博论文声明扫描版(#36)。
- `\inlinecite`: 用 `\inlinecite` 替换 `\onlinecite`。为保证兼 容性，`\onlinecite` 会保留。
- `achievements`: 博士后就不提在学期间了，不合适(#100)
- `achievements`: 让简历部分更符合格式指南和示例文件(#122)
- `\shuji`: 扩展 `\shuji[<标题>][<作者>]`。

## [v4.8.1] - 2014-12-09
### Changed
- 按照 CTAN 的要求整理一下文件。

## [v4.8] - 2014-11-25
### Changed
- no need to load `indentfirst` directly since we use `ctex`.
- 内部调用 `ctex` 宏包，自动检测编译引擎。
- dvips method is deprecated. We ask their users to load it manually.
- reset baselinestretch after ctex's change.
- 好几年累积的一些更新，最重要的是切换到 CTeX。
- v4.7曾经想发布，但是一直没有做，于是就被跳过了，算是造一个段子吧。
- 增加 noraggedbottom 选项。
- 添加 nocap 选项，恢复默认标题样式，模板会进一步定制。
- no need to load amssymb since we use txfonts.
- 在 CJK 模式下用 `CJKspace` 保留中英文间空格。

## [v4.7] - 2012-06-12
### Changed
- 去掉 `hypernat` 依赖，`hyperref` 和 `natbib` 可以很好配合了。
- 修改本科生页脚间距与样例基本一致。
- `\ps@thu@headings`: 本科页码用小五号字。
- 修正本科生作者信息名称。
- 本科生关键字也用分号分割了。
- `\thu@first@titlepage`: 硕士中文封面不再需要英文标题。
- `\thu@first@titlepage`: 本科生题目下划线长度自动适应字数。
- `\thu@doctor@engcover`: 硕士生新增英文封面。
- `\makecover`: 硕士论文也需要英文封面。
- `\thu@makeabstract`: Bachelor sample uses Keywords w/o space `-_-`

## [v4.6] - 2011-10-22
### Changed
- 增加博士后文档部分。
- 使用手册更新。
- 增加 postdoctor 选项。
- 增加博士后相关指令。
- 增加博士后相关配置。
- `\thu@first@titlepage`: 增加博士后封面。
- `\makecover`: 博士后报告无授权说明。
- `resume`: 支持可选参数，自己定义简历章节标题。

## [v4.5.2] - 2010-09-19
### Changed
- 研究生页面边距由 3.2cm 改为 3cm。
- 本科论文日期具体到日。
- `\makecover`: 本科封面和授权说明之间不要空白页。
- `\thu@makeabstract`: 本科论文摘要亦无需右开。
- `acknowledgement`: 研究生论文的致谢和声明终于分开了。

## [v4.5.1] - 2009-01-06
### Changed
- 太好了，不用处理 `longtable` 的 `\caption` 了。
- `\listoftables*`: 更优雅的插图/表格索引，避免跟 `caption` 包冲 突。`\thu@listof` 相应修改。

## [v4.5] - 2009-01-04
### Changed
- 加入 XeTeX 支持，需要 `xeCJK`。
- 彻底转向 UTF-8，并支持 XeLaTeX。
- 增加 xetex, pdftex 选项。
- `\shuji`: 简化代码，同时支持 XeLaTeX。

## [v4.4.4] - 2008-06-12
### Changed
- 修复了一个从 v4.3 升级到 v4.4 过程中的丢失公式索引的 bug，原修改代码保留备忘。

## [v4.4.3] - 2008-06-09
### Changed
- `\thu@first@titlepage`: 修改本科生论文封面格式以符合新样例。
- `\thu@first@titlepage`: 修改本科生论文封面日期格式以符合新样例。

## [v4.4.2] - 2008-06-07
### Changed
- 本科生格式终于也开始用空格作为关键字分隔符了。
- 本科生签名之间距离改为 `\hskip1em`。
- `\thu@authorization@mk`: 修改本科生的授权部分，按照 2008 年的新样例。
- `\thu@makeabstract`: 本科生格式中文关键词采用首行缩进且无悬挂缩进。
- `\thu@makeabstract`: Bachelor English abstract format requires indent and no hang-indent.

## [v4.4] - 2008-06-18
### Changed
- 修复网址断字。
- `\backmatter`: 本科正文后的页码延续前面的阿拉伯数字，不再用罗马数 字。
- `\backmatter`: 本科取消了所有页眉。
- 本科论文终于去掉了**公式**二字。
- 调整段前距为 -20bp 而不是原来的 -24bp。
- 修改本科生模板的二级节标题为小四而不是半小四。
- 调整段前距为 -12bp 而不是原来的 -16bp。
- 调整段前距为 -12bp 而不是原来的 -16bp。
- `\tableofcontents`: 本科生目录字号改回`\xiaosi[<1.8>]`。
- `\tableofcontents`: 本科生目录缩进要求不同。
- `\tableofcontents`: 本科章目录项一直用黑体 (Arial)。

## [v4.3] - 2008-03-11
### Changed
- 子图引用时加括号。

## [v4.2] - 2008-03-07
### Changed
- `\eqref` 加括号。
- 调整证明环境的编号和结尾的方块。
- `\thu@doctor@engcover`: 博士英文封面补充联合导师。

## [v4.0] - 2007-11-08
### Changed
- `\tableofcontents`: 本科研究生目录字号行距都不同。
- **内部**密级前面终究还是不要五角星了。
- `\thu@authorization@mk`: 研究生的授权部分调整了一下，不知道老师为什么总爱修改 那些无关紧要的格式，郁闷。感谢 PMHT@newsmth 的认真比对。

## [v3.1] - 2007-10-09
### Changed
- 本科的目录又不要 arial 字体了。
- replace `mathptmx` with `txfonts`.
- 英文摘要标题要搞特殊化。
- 博士论文目录只出现到第 3 级标题即可。
- `\thu@def@term`: 重新定义摘要为环境，long 选项不需要了。
- 重新定义摘要成为环境。
- 增强的关键词命令。
- 去掉配置文件中的 `\hfill`。
- **内部**密级前面要五角星了。
- `\thu@first@titlepage`: 重新放置封面表格的提示元素。
- `\thu@makeabstract`: 研究生关键词不再沉底。

## [v3.0] - 2007-05-13
### Changed
- 不用专门为本科论文生成“**提交**”版本了。
- 没有了综合论文训练页面，很多本科论文专用命令就消失了。
- 删除 submit 选项。
- 本科公式又要取消全文统一编号了。
- `\tableofcontents`: 缩小目录中标题与页码之间**点**之间的距离。
- `\makecover`: 本科论文评语取消。
- `\makecover`: 本科论文授权图片扫描取消。
- `\makecover`: 本科综合论文训练在电子版中取消。
- `\thu@makeabstract`: **Key words** but not **Keywords**. What are you doing?
- `acknowledgement`: 本科论文声明部分图片扫描取消。

## [v2.6.4] - 2006-10-23
### Changed
- 增加 `neverdecrease` 选项。
- `\thu@makeabstract`: **Keywords** but not **Key words**.
- `\listoftables*`: 增加 `\listoffigures*`，`\listoftables*`。
- `\listofequations*`: 增加 `\listofequations*`。
- 调整参考文献标签宽度，使得条目增多时仍能对齐。

## [v2.6.3] - 2006-07-01
### Changed
- `\thu@makeabstract`: 为本科正确设置目录及以后的页码。
- `acknowledgement`: 重画双虚线，自适应页面宽度。

## [v2.6.2] - 2006-06-20
### Changed
- 改正 groupmembers 的拼写错误。
- 去掉 `paralist` 的 `newitem` 和 `newenum` 选项，因为默认是打开的。
- `\thu@def@fontsize`: 引入此命令重新定义字号。
- 根据不同论文格式显示不同公式编号，并自动加入索引。
- 增加问题和猜想两个数学环境。
- `\thu@def@term`: 引入 `\thu@def@term` 定义封面命令。
- `\thu@first@titlepage`: 如果本科生没有辅导教师则不显示。
- `\thu@makeabstract`: 取消最后一列的空白。
- `\thu@makeabstract`: 取消 tabular 环境，用 `\hangindent` 实现关键词 悬挂缩进，英文摘要同。
- `\thu@makeabstract`: 取消最后一列的空白。
- `\equcaption`: 此命令配合 `amsmath` 命令基本可以满足所有 公式需要。

## [v2.6.1] - 2006-06-16
### Changed
- 取消 `thubib.bst` 中 inbook 类 volume 后的页 码。

## [v2.6] - 2006-06-09
### Changed
- 增加 dvipdfm 选项。
- 增加 `longtable`。
- 去除 hyperref 选项，等待全局传递。
- 脚注改成 1.5 倍行距，漂亮。
- 增加 `\floatsep`，`\@fptop`，`\@fpsep` 和 `\@fpbot`。
- `\thu@first@titlepage`: 本科生题目加长，最多 24 个字。

## [v2.5.3] - 2006-06-08
### Changed
- submit 选项的一个笔误。
- `\backmatter`: 第一章永远右开。
- 不管 caption 出现在什么位置，`\aboveskip` 总是出现在标题和浮动体之间的距离。
- 增加对 `longtable` 的处理。
- `\thu@makeabstract`: `\pagenumber` 会自动设置页码为 1。
- `\equcaption`: 取消 `\equcaption` 的参数

## [v2.5.2] - 2006-06-01
### Changed
- 更改默认列表距离。
- 上一个版本忘了把研究生的公式编号排除。
- `\thu@chapter*`: 定义自己的 `\thu@chapter*`。
- `\tableofcontents`: 用 `\thu@chapter*` 改写目录命令。
- `\thu@first@titlepage`: 研究生论文标题中英文用 arial 字体。
- `\thu@makeabstract`: 在研究生论文中，摘要不出现在目录中，但是要在书签中出现。
- `acknowledgement`: 研究生致谢右开。
- `acknowledgement`: 研究生致谢题目是致谢，目录是致谢与声明。
- `resume`: 研究生的个人介绍要右开。

## [v2.5.1] - 2006-05-28
### Changed
- 如果选项设置了 dvips，但是用 PDFLaTeX 编译，报错。
- 根据教务处的新要求调整附录部分。
- 参考文献中杂志文章如果没有卷号，那么页码直接跟在 年份后面，并用句点分割。在 `thubib.bst` 中增加 output.year 函数。
- 如果没有设置格式选项，报错。
- submit 只能由本科用。
- 研究生院目录要 times，而教务处要 arial。
- 本科 openright，研究生 openany。
- `\backmatter`: 本科正文之后页码即用罗马数字，研究生不变。
- `\thu@textcircled`: 脚注编号使用 `\textcircled` 命令，每页允许至多 99 个。
- 本科公式编号前添加**公式**二字。需要修 `amsmath` 极其深的一个命令。
- 教务处居然要本科论文公式全文编号！
- 增加 `subfigure` 和 `subtable` 的 caption 配置。
- 重新定义表格默认字体。
- 让 `\chapter*` 自动 `\markboth`。
- `\tableofcontents`: 减小目录项中的导引小点跟页码之间的留白。
- 硕士封面的冒号前居然有点小距离！
- `\thu@first@titlepage`: 本科封面标题调整微小的空隙。
- `\thu@first@titlepage`: 本科封面标题第二行的横线上移一点。
- `\thu@makeabstract`: 教务处又不要正文前的页眉了。
- `\thu@makeabstract`: 不管是哪种论文格式，摘要都要右开。
- `\thu@makeabstract`: 研究生封面英文摘要连续。
- `\listofequations*`: 公式索引项 numwidth 增加。
- `resume`: 教务处和研究生院非要搞的不一样！

## [v2.5] - 2006-05-20
### Changed
- 对本科论文进行大幅度的重写，因为教务处修改了格式要求。
- 重新整理代码，使其布局更易读。
- 增加本科论文的提交选项 submit。
- `\ps@thu@headings`: 本科的奇偶页眉不同。
- `\ps@thu@headings`: 增加 empty 页面样式。
- 修正 minipage 中的脚注。
- 标题上下间距重调，以前没有考虑 `\intextsep` 的影响。
- 增加索引名称定义。
- 取消 `titlesec` 宏包，用基本 LaTeX 命令格式化标题。
- `\tableofcontents`: 取消 `titletoc` 宏包，用 `\dottedtocline` 调整 目录。
- 院系和专业分别改名用 department 和 major，代替原来 的 affil 和 subject。
- `\makecover`: 本科论文评语位置调整。
- `\makecover`: 综合论文训练在授权说明之后。
- `acknowledgement`: 本科论文要求致谢声明分页，但是研究生的不分。
- `\listoftables*`: 增加插图、表格和公式索引。
- `\listoftables*`: 为了让索引中能出现**图 xxx**，不得不修改 LaTeX内部命令 `\@caption`。
- `\equcaption`: 将公式编号写入临时文件以便生成公式列表。
- `\listofequations*`: 增加公式索引命令。
- 参考文献序号靠左，而不是靠右。
- 不用 `\CJKcaption`，在导言区直接引入配置文件。

## [v2.4.2] - 2006-04-18
### Changed
- 去掉参考文献第二个作者后面烦人的逗号。

## [v2.4.1] - 2006-04-17
### Changed
- 2.4 忘了把关键词的 tabular 改成 thu@tabular。
- 参考文献最后一个作者前是逗号而不是 and。

## [v2.4] - 2006-04-15
### Changed
- Fill more pdf info. with `\hypersetup`.
- 自动隐藏密级为内部时后面的五角星。
- 增加“注释 (Remark)”环境。
- 压缩 item 之间的距离。
- `thubib.bst` 文献标题取消自动小写。
- 中文参考文献取消 In: Proceedings。
- 英文文参考文献调整 In: editor, Proceedings。
- 参考文献为学位论文时，加方括号，作者后面为实心点。
- 中文参考文献作者超过三个加等。
- 中文参考文献需要在 bib 中指定 `lang="chinese"`。
- 学位论文不在需要 type 字段。
- 为摘要等条目增加书签。
- 章节的编号用黑体，也就是自动打开 `arialtitle` 选项。
- 添加模板名称命令。
- 把页面尺寸写入 dvi，避免有的用户通 过 dvips 不指定页面类型而得到古怪的结果。
- 表格内容为 11 磅。
- 图表标题左对齐，取消原先漂亮的 hang 模式。
- `\thu@makeabstract`: It is **Key words**, but not **Key Words**.
- `denotation`: 为主要符号表环境增加一个可选参数，调节符号列的宽度。
- `acknowledgement`: 调整**致谢**等中间的距离。
- 参考文献间距调小一点，label 长度增加一点，以便让超过 100 的参考文献更好地对齐。

## [v2.3] - 2006-04-09
### Changed
- Fix a great bug: `\PassOptionsToClass` and `\LoadClass` rather than `\PassOptionToPackage` and `\LoadPackage`.
- Reorganize the codes in cover, make the pagestyle more readable.
- Add gbk2uni into the document.
- Support `openright` and openany.
- Adjust `\hypersetup` to remove color and box.
- Adjust margins again.
- Adjust references formats.
- Redefine frontmatter and mainmatter to fit our case.
- Add assumption environment.
- Change the brace in the cover.

## [v2.2] - 2006-03-26
### Changed
- Adjust margins. How bad it is to simulate MS WORD!.
- Add bachelor training overview details supporting.
- CJK support in preamble.
- Adjust hyperref to avoid boxes around links.

## [v2.1] - 2006-03-03
### Changed
- Add support to bachelor thesis.
- Remove `fancyhdr` and `geometry`.
- Redefine footnote marks.
- Replace `thubib.bst` with `chinesebst.bst`.
- Merge the modification of `ntheorem`.
- Remove `footmisc` and refine the document.
- Work very hard on the document.
- Add `\checklab` code to reduce “unresolved labels“ warning
- `\ps@thu@headings`: 彻底放弃 fancyhdr，定义自己的样式。
- 让脚注它悬挂起来，而且中文中用上标，脚注中用正体。
- `\thu@first@titlepage`: 增加本科部分。
- `\makecover`: 分成几个小模块来搞，不然这个 macro 太大了，看不过来。

## [v2.0e] - 2005-12-18
### Changed
- `denotation`: 主要符号表定义为一个 list，用起来方便。

## [v2.0] - 2005-12-20
### Changed
- `\ps@thu@headings`: 以前的太乱了，重新整理过清晰多了。
- `\tableofcontents`: 附录的目录项需要调整一下。以及公式编号方式等等。
- 增加了封面密级，增加博士封面支持
- `\thu@first@titlepage`: 封面的培养单位，学科等内容字距自动调整。
- `acknowledgement`: 将致谢定义为一个环境更合适，里面也不用像以前段首需 要自己缩进。
- `resume`: 最后决定将 resume 定义为环境。这样与前面的主要符号 表、致谢等对应。

## [v1.5] - 2005-12-16
### Changed
- `acknowledgement`: 在那些不显示编号的章节前面先执行一次 `\cleardoublepage`，使新开章节的页码到达正确的状态。否则会因为 `\addcontentsline` 在 chapter 之前而导致目录页码错误。
- `resume`: 增加个人简历章节的命令，去掉主文件中需要重新 定义 `\cleardoublepage` 和自己写 `\markboth`，`\addcontentsline` 的部分。

## [v1.4rc1] - 2005-12-14
### Changed
- I do not know why `\thu@authorizationaddon` does not work now for v1.3, while it's fine in v1.2. Temporarily, I remove the directive :(. There might be better solution. Other changes: add `config` option to subfig to be compatible with subfigure. add `courier` package for tt font.
- I have to put all chinese chars into cfg, otherwise they would not appear.

## [v1.4] - 2005-12-05
### Changed
- Fix the problem of **chinese**, which is because both CJK and everysel redefine the `\selectfont`. So, a not so good workaround is to merge them up. Add `shuji.tex` example. Add `\pozhehao` command.

## [v1.3] - 2005-11-14
### Changed
- Replace `subfigure` with `subfig`, replace `caption2` with `caption`, add details about using figure are in the example.

## [v1.2] - 2005-11-04
### Changed
- Remove `fancyref`; Remove `ucite` and implement `\onlinecite`; use package `arial` or `helvet` selectively.

## [v1.1] - 2005-11-03
### Changed
- Initial version, migrate from the old “Bao--Pan“ version. Make the template a class instead of package.

## [v1.0] - 2005-07-06
### Changed
- Please refer to “Bao--Pan“ version.

[Unreleased]: https://github.com/xueruini/thuthesis/compare/v6.0.0...HEAD
[v6.0.0]: https://github.com/xueruini/thuthesis/compare/v5.5.2...v6.0.0
[v5.5.2]: https://github.com/xueruini/thuthesis/compare/v5.5.1...v5.5.2
[v5.5.1]: https://github.com/xueruini/thuthesis/compare/v5.5.0...v5.5.1
[v5.5.0]: https://github.com/xueruini/thuthesis/compare/v5.4.5...v5.5.0
[v5.4.5]: https://github.com/xueruini/thuthesis/compare/v5.4.4...v5.4.5
[v5.4.4]: https://github.com/xueruini/thuthesis/compare/v5.4.2...v5.4.4
[v5.4.2]: https://github.com/xueruini/thuthesis/compare/v5.4.1...v5.4.2
[v5.4.1]: https://github.com/xueruini/thuthesis/compare/v5.4.0...v5.4.1
[v5.4.0]: https://github.com/xueruini/thuthesis/compare/v5.3.2...v5.4.0
[v5.3.2]: https://github.com/xueruini/thuthesis/compare/v5.3.1...v5.3.2
[v5.3.1]: https://github.com/xueruini/thuthesis/compare/v5.3.0...v5.3.1
[v5.3.0]: https://github.com/xueruini/thuthesis/compare/v5.2.3...v5.3.0
[v5.2.3]: https://github.com/xueruini/thuthesis/compare/v5.2.2...v5.2.3
[v5.2.2]: https://github.com/xueruini/thuthesis/compare/v5.2.1...v5.2.2
[v5.2.1]: https://github.com/xueruini/thuthesis/compare/v5.2.0...v5.2.1
[v5.2.0]: https://github.com/xueruini/thuthesis/compare/v5.1.0...v5.2.0
[v5.1.0]: https://github.com/xueruini/thuthesis/compare/v5.0.0...v5.1.0
[v5.0.0]: https://github.com/xueruini/thuthesis/compare/v4.8.1...v5.0.0
[v4.8.1]: https://github.com/xueruini/thuthesis/compare/v4.8...v4.8.1
[v4.8]: https://github.com/xueruini/thuthesis/compare/v4.7...v4.8
[v4.7]: https://github.com/xueruini/thuthesis/compare/v4.6...v4.7
[v4.6]: https://github.com/xueruini/thuthesis/compare/v4.5.2...v4.6
[v4.5.2]: https://github.com/xueruini/thuthesis/compare/v4.5.1...v4.5.2
[v4.5.1]: https://github.com/xueruini/thuthesis/compare/v4.5...v4.5.1
[v4.5]: https://github.com/xueruini/thuthesis/compare/v4.4.4...v4.5
[v4.4.4]: https://github.com/xueruini/thuthesis/compare/v4.4.3...v4.4.4
[v4.4.3]: https://github.com/xueruini/thuthesis/compare/v4.4.2...v4.4.3
[v4.4.2]: https://github.com/xueruini/thuthesis/compare/v4.4...v4.4.2
[v4.4]: https://github.com/xueruini/thuthesis/compare/v4.3...v4.4
[v4.3]: https://github.com/xueruini/thuthesis/compare/v4.2...v4.3
[v4.2]: https://github.com/xueruini/thuthesis/compare/v4.0...v4.2
[v4.0]: https://github.com/xueruini/thuthesis/compare/v3.1...v4.0
[v3.1]: https://github.com/xueruini/thuthesis/compare/v3.0...v3.1
[v3.0]: https://github.com/xueruini/thuthesis/compare/v2.6.4...v3.0
[v2.6.4]: https://github.com/xueruini/thuthesis/compare/v2.6.3...v2.6.4
[v2.6.3]: https://github.com/xueruini/thuthesis/compare/v2.6.2...v2.6.3
[v2.6.2]: https://github.com/xueruini/thuthesis/compare/v2.6.1...v2.6.2
[v2.6.1]: https://github.com/xueruini/thuthesis/compare/v2.6...v2.6.1
[v2.6]: https://github.com/xueruini/thuthesis/compare/v2.5.3...v2.6
[v2.5.3]: https://github.com/xueruini/thuthesis/compare/v2.5.2...v2.5.3
[v2.5.2]: https://github.com/xueruini/thuthesis/compare/v2.5.1...v2.5.2
[v2.5.1]: https://github.com/xueruini/thuthesis/compare/v2.5...v2.5.1
[v2.5]: https://github.com/xueruini/thuthesis/compare/v2.4.2...v2.5
[v2.4.2]: https://github.com/xueruini/thuthesis/compare/v2.4.1...v2.4.2
[v2.4.1]: https://github.com/xueruini/thuthesis/compare/v2.4...v2.4.1
[v2.4]: https://github.com/xueruini/thuthesis/compare/v2.3...v2.4
[v2.3]: https://github.com/xueruini/thuthesis/compare/v2.2...v2.3
[v2.2]: https://github.com/xueruini/thuthesis/compare/v2.1...v2.2
[v2.1]: https://github.com/xueruini/thuthesis/compare/v2.0e...v2.1
[v2.0e]: https://github.com/xueruini/thuthesis/compare/v2.0...v2.0e
[v2.0]: https://github.com/xueruini/thuthesis/compare/v1.5...v2.0
[v1.5]: https://github.com/xueruini/thuthesis/compare/v1.4rc1...v1.5
[v1.4rc1]: https://github.com/xueruini/thuthesis/compare/v1.4...v1.4rc1
[v1.4]: https://github.com/xueruini/thuthesis/compare/v1.3...v1.4
[v1.3]: https://github.com/xueruini/thuthesis/compare/v1.2...v1.3
[v1.2]: https://github.com/xueruini/thuthesis/compare/v1.1...v1.2
[v1.1]: https://github.com/xueruini/thuthesis/compare/v1.0...v1.1
[v1.0]: https://github.com/xueruini/thuthesis/releases/tag/v1.0
