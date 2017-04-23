%% Copyright (C) 2010-2012 by Gerry
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%
%% http://www.latex-project.org/lppl.txt
%%
%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{bnuthesis}
[2017/3/20 1.53 Beijing Normal University.Zhuhai Thesis Template]
\newif\ifbnu@UTF
\newif\ifbnu@GBK
\DeclareOption{utf}{\bnu@UTFtrue\bnu@GBKfalse}
\DeclareOption{gbk}{\bnu@GBKtrue\bnu@UTFfalse}
\hyphenation{bnu-Thesis}
\def\bnuthesis{\textsc{BNUThesis}}
\def\version{1.51}
\newif\ifbnu@bachelor\bnu@bachelorfalse
\newif\ifbnu@master\bnu@masterfalse
\newif\ifbnu@doctor\bnu@doctorfalse
\newif\ifbnu@secret\bnu@secretfalse
\newif\ifbnu@twoside\bnu@twosidefalse
\DeclareOption{bachelor}{\bnu@bachelortrue}
\DeclareOption{master}{\bnu@mastertrue}
\DeclareOption{doctor}{\bnu@doctortrue}
\DeclareOption{secret}{\bnu@secrettrue}
\DeclareOption{twoside}{\bnu@twosidetrue}
\newif\ifbnu@dvips
\newif\ifbnu@dvipdfm
\newif\ifbnu@xetex
\newif\ifbnu@pdftex
\DeclareOption{dvips}{\bnu@dvipstrue}
\DeclareOption{dvipdfm}{\bnu@dvipdfmtrue}
\DeclareOption{pdftex}{\bnu@pdftextrue}
\DeclareOption{xetex}{\bnu@xetextrue}
\newif\ifbnu@arial
\DeclareOption{arial}{\bnu@arialtrue}
\newif\ifbnu@arialtoc
\DeclareOption{arialtoc}{\bnu@arialtoctrue}
\newif\ifbnu@arialtitle
\DeclareOption{arialtitle}{\bnu@arialtitletrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{utf,arialtitle}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,openany]{book}
\ifbnu@bachelor\relax\else
  \ifbnu@master\relax\else
    \ifbnu@doctor\relax\else
      \ClassError{bnuthesis}%
                 {You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi
\RequirePackage{ifpdf,ifxetex}
\ifbnu@xetex\RequireXeTeX\fi
\def\RequirePDFTeX{%
  \ifpdf\else
    \ClassError{bnuthesis}%
               {pdflatex is required to compile this document!}{}
  \fi}
\ifbnu@pdftex\RequirePDFTeX\fi
\def\bnu@checkoption#1#2{%
  \@for\reserved@a:=#2\do{%
    \csname ifbnu@\reserved@a\endcsname
      \ClassError{bnuthesis}%
                 {Please remove `\reserved@a' option when you run #1.}{}
    \fi}}
\ifpdf\bnu@checkoption{pdflatex}{dvips,dvipdfm,xetex}\bnu@pdftextrue\fi % force the option to be true
\ifxetex\bnu@checkoption{xelatex}{dvips,dvipdfm,pdftex}\bnu@xetextrue\fi
\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{txfonts}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{indentfirst}
\RequirePackage[neverdecrease]{paralist}
\ifbnu@xetex
  %\RequirePackage{mathptmx} % fontspec conflicts with txfonts now, so we have to load other times-math fonts. % not compatible with CTeX 2.9.2
  \RequirePackage{xltxtra}
  \RequirePackage[CJKnumber,BoldFont,normalindentfirst]{xeCJK}
  \punctstyle{quanjiao}
  % todo: minor fix of CJKnumb
  \def\CJK@null{\kern\CJKnullspace\hskip \f@size \p@\kern\CJKnullspace}
  \defaultfontfeatures{Mapping=tex-text} % use TeX --
  %\newcommand{\fontsong}{Adobe Song Std}
  %\newcommand{\fonthei}{Adobe Heiti Std}
  %\newcommand{\fontkai}{Adobe Kaiti Std}
  %\newcommand{\fontfs}{Adobe Fangsong Std}
  %\newcommand{\fontli}{Adobe Kaiti Std}
  %\newcommand{\fontyou}{Adobe Kaiti Std}
  \newcommand{\fontsong}{STSongti-SC-Regular}
  \newcommand{\fonthei}{STHeitiSC-Light}
  \newcommand{\fontkai}{STKaitiSC-Regular}
  \newcommand{\fontfs}{STFangsong}
  \newcommand{\fontli}{STKaiti}
  \newcommand{\fontyou}{STKaiti}

  \setCJKmainfont[BoldFont={\fonthei}, ItalicFont={\fontkai}]{\fontsong}
  \setCJKsansfont{\fonthei}
  \setCJKmonofont{\fontkai}
  \setCJKfamilyfont{song}{\fontsong}
  \setCJKfamilyfont{hei}{\fonthei}
  \setCJKfamilyfont{fs}{\fontfs}
  \setCJKfamilyfont{kai}{\fontkai}
  \setCJKfamilyfont{li}{\fontli}
  \setCJKfamilyfont{you}{\fontyou}
  
  % \setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
% \setCJKsansfont{SimHei}
% \setCJKmonofont{FangSong}
% \setCJKfamilyfont{zhsong}{SimSun}
% \setCJKfamilyfont{zhhei}{SimHei}
% \setCJKfamilyfont{zhkai}{KaiTi}
% \setCJKfamilyfont{zhfs}{FangSong}
% \setCJKfamilyfont{zhli}{LiSu}
% \setCJKfamilyfont{zhyou}{YouYuan}
% \newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
% \newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
% \newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
% \newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
% \newcommand*{\lishu}{\CJKfamily{zhli}}    % 隶书
% \newcommand*{\youyuan}{\CJKfamily{zhyou}} % 幼圆

  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
\else
  \RequirePackage{CJKutf8}
  \RequirePackage{CJKnumb}
  \ifbnu@GBK % CJKpunct 在 UTF 下工作的不好。
    \IfFileExists{CJKpunct.sty}%
                 {\RequirePackage{CJKpunct}}%
                 {\ClassWarning{bnuthesis}{no CJKpunct.sty availiable!}}
  \fi
  \RequirePackage{CJKspace}
  \ifbnu@arial
    \IfFileExists{arial.sty}%
                 {\RequirePackage{arial}}%
                 {\ClassWarning{bnuthesis}{no arial.sty availiable!}}
  \fi
\fi
\ifbnu@dvips\else
  \ifbnu@xetex\else
    \RequirePackage{ccmap}
  \fi
\fi
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[numbers,super,sort&compress]{natbib}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi
\hypersetup{%
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfpagelabels,
  pdfborder=0 0 0}
\ifbnu@dvips
  \RequirePackage{breakurl}
\fi
\urlstyle{same}
%\RequirePackage{hypernat}
\newcommand{\clpage}{%
\ifbnu@twoside\cleardoublepage\else\clearpage\fi}

\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bnu@headings}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \ifbnu@bachelor\pagestyle{bnu@headings}\else\pagestyle{bnu@headings}\fi}
\renewcommand\backmatter{%
  \clpage
  \@mainmattertrue}
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\def\songti{\song}
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\def\fangsong{\fs}
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\def\kaishu{\kai}
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\heiti{\hei}
\newcommand{\li}{\CJKfamily{li}}        % 隶书
\def\lishu{\li}
\newcommand{\you}{\CJKfamily{you}}      % 幼圆
\def\youyuan{\you}
\newlength\bnu@linespace
\newcommand{\bnu@choosefont}[2]{%
   \setlength{\bnu@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\bnu@linespace}\selectfont}
\def\bnu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \bnu@choosefont{##1}{#2}}}

\bnu@define@fontsize{yuanchu}{48bp}
\bnu@define@fontsize{chuhao}{42bp}
\bnu@define@fontsize{xiaochu}{36bp}
\bnu@define@fontsize{yihao}{26bp}
\bnu@define@fontsize{xiaoyi}{24bp}
\bnu@define@fontsize{erhao}{22bp}
\bnu@define@fontsize{xiaoer}{18bp}
\bnu@define@fontsize{sanhao}{16bp}
\bnu@define@fontsize{xiaosan}{15bp}
\bnu@define@fontsize{sihao}{14bp}
\bnu@define@fontsize{banxiaosi}{13bp}
\bnu@define@fontsize{xiaosi}{12bp}
\bnu@define@fontsize{dawu}{11bp}
\bnu@define@fontsize{wuhao}{10.5bp}
\bnu@define@fontsize{xiaowu}{9bp}
\bnu@define@fontsize{liuhao}{7.5bp}
\bnu@define@fontsize{xiaoliu}{6.5bp}
\bnu@define@fontsize{qihao}{5.5bp}
\bnu@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
      \@percentchar\@percentchar BeginPaperSize: a4
      ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0cm}
\setlength\marginparsep{0cm}
\addtolength{\textwidth}{-4.5cm}
\addtolength{\textheight}{-7.5cm}

\setlength{\hoffset}{-1in} %清空默认页边距	
\ifbnu@twoside
  \setlength{\oddsidemargin}{2cm} %奇数页左边距
  \setlength{\evensidemargin}{2cm} %偶数页左边距
\else
  \setlength{\oddsidemargin}{2cm} %奇数页左边距
  \setlength{\evensidemargin}{\oddsidemargin} %偶数页左边距
\fi
\setlength{\headheight}{1.2cm}
\setlength{\topskip}{0pt}
\setlength{\skip\footins}{15pt}
\setlength{\topmargin}{0pt}
\setlength{\footskip}{1.6cm}
\setlength{\headsep}{0cm}

% 页眉页脚
\let\bnu@cleardoublepage\cleardoublepage
\newcommand{\bnu@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\bnu@cleardoublepage}}
\let\cleardoublepage\bnu@clearemptydoublepage
\def\ps@bnu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@bnu@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}
\def\ps@bnu@headings{%
  \def\@oddhead{\vbox to\headheight{%
     %%%%\hb@xt@\textwidth{\hfill\wuhao\song\leftmark\hfill}%  % 章节标题
      %\hb@xt@\textwidth{\hfill\wuhao\song\bnu@ctitle\hfill}%　% 论文标题
	  \hb@xt@\textwidth{\hfill\wuhao\song\bnu@schoolename\bnu@cdepartment\hfill}%　% 学院名称
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@evenhead{\vbox to\headheight{%
      %%% \hb@xt@\textwidth{\wuhao\song\hfill\leftmark\hfill}%　　章节标题
      %\hb@xt@\textwidth{\wuhao\song\hfill\bnu@ctitle\hfill}%　　　论文标题
	  \hb@xt@\textwidth{\hfill\wuhao\song\bnu@schoolename\bnu@cdepartment\hfill}%　% 学院名称
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}
  \let\@evenfoot=\@oddfoot}
\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\  ~~#1}{}}
\newlength\CJK@twochars
\ifxetex
  \def\CJK@spaceChar{\hskip \f@size \p@}
\else
  \ifbnu@UTF
    \def\CJK@spaceChar{\CJKchar{"080}{"080}}
  \fi
  \ifbnu@GBK
    \def\CJK@spaceChar{\CJKchar{"0A1}{"0A1}}
  \fi
\fi
\def\CJKindent{%
  \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
  \parindent\CJK@twochars}
\setlength{\parskip}{0pt \@plus2pt \@minus0pt}
\def\bnu@item@space{%
  \let\itemize\compactitem
  \let\enditemize\endcompactitem
  \let\enumerate\compactenum
  \let\endenumerate\endcompactenum
  \let\description\compactdesc
  \let\enddescription\endcompactdesc}
\newcommand*\MakePerPage[2][\@ne]{%
  \expandafter\def\csname c@pchk@#2\endcsname{\c@pchk@{#2}{#1}}%
  \newcounter{pcabs@#2}%
  \@addtoreset{pchk@#2}{#2}}
\def\new@pagectr#1{\@newl@bel{pchk@#1}}
\def\c@pchk@#1#2{\z@=\z@
  \begingroup
  \expandafter\let\expandafter\next\csname pchk@#1@\arabic{pcabs@#1}\endcsname
  \addtocounter{pcabs@#1}\@ne
  \expandafter\ifx\csname pchk@#1@\arabic{pcabs@#1}\endcsname\next
  \else \setcounter{#1}{#2}\fi
  \protected@edef\next{%
    \string\new@pagectr{#1}{\arabic{pcabs@#1}}{\noexpand\thepage}}%
  \protected@write\@auxout{}{\next}%
  \endgroup\global\z@}
%\MakePerPage{footnote}
\RequirePackage[perpage]{footmisc}
\def\bnu@textcircled#1{%
  \ifnum \value{#1} <10 \textcircled{\xiaoliu\arabic{#1}}
  \else\ifnum \value{#1} <100 \textcircled{\qihao\arabic{#1}}\fi
  \fi}
\renewcommand{\thefootnote}{\bnu@textcircled{footnote}}
\renewcommand{\thempfootnote}{\bnu@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\bnu@footnotesize\footnotesize
\renewcommand\footnotesize{\bnu@footnotesize\xiaowu[1.5]}
\def\@makefnmark{\textsuperscript{\hbox{\normalfont\@thefnmark}}}
\long\def\@makefntext#1{
    \bgroup
      \setbox\@tempboxa\hbox{%
        \hb@xt@ 2em{\@thefnmark\hss}}
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      #1
    \par\egroup}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\bnu@make@df@tag@@\make@df@tag@@@}
\def\bnu@make@df@tag@@#1{\gdef\df@tag{\bnu@maketag{#1}\def\@currentlabel{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\bnu@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\gdef\@endtrivlist#1{%  % from \endtrivlist
  \if@inlabel \indent\fi
  \if@newlist \@noitemerr\fi
  \ifhmode
    \ifdim\lastskip >\z@ #1\unskip \par
      \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
    \ifdim\lastskip >\z@
       \@tempskipa\lastskip \vskip -\lastskip
      \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
      \vskip\@tempskipa
    \fi
    \@endparenv
  \fi #1}
\theorembodyfont{\song\rmfamily}
\theoremheaderfont{\hei\rmfamily}
\setlength{\floatsep}{12bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\bnu@tabular{\dawu[1.5]\old@tabular}
\DeclareCaptionLabelFormat{bnu}{{\dawu[1.5]\song #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{bnu}{\hspace{1em}}
\DeclareCaptionFont{bnu}{\dawu[1.5]}
\captionsetup{labelformat=bnu,labelsep=bnu,font=bnu}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[subfloat]{labelformat=simple,font=bnu,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\bnu@LT@array\LT@array
\def\LT@array{\dawu[1.5]\bnu@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\ifbnu@arialtitle
  \def\bnu@title@font{\sffamily}
\fi
\renewcommand\chapter{\clpage\phantomsection%
                    \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
 					\thispagestyle{bnu@headings}%
                    \global\@topnum\z@%
                    \@afterindenttrue%
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
     \refstepcounter{chapter}%
     \addcontentsline{toc}{chapter}{\@chapapp \hspace{1em} #1}
   \else
     \addcontentsline{toc}{chapter}{#1}%
   \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}}
\def\@makechapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
    \csname bnu@title@font\endcsname\sanhao[1]
    \ifnum \c@secnumdepth >\m@ne
      \@chapapp\hskip1em
    \fi
    #1\par\nobreak
    \vskip 24bp}}
\def\@schapter#1{%
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
   \csname bnu@title@font\endcsname\sanhao[1]
     \def\@tempa{#1}
     \def\@tempb{\eabstractname}
     \ifx\@tempa\@tempb\bfseries\fi
   \interlinepenalty\@M
   #1\par\nobreak
   \vskip 24bp}}
\newcounter{bnu@bookmark}
\def\bnu@chapter*{%
  \@ifnextchar [ % ]
    {\bnu@@chapter}
    {\bnu@@chapter@}}
\def\bnu@@chapter@#1{\bnu@@chapter[#1]{#1}}
\def\bnu@@chapter[#1]#2{%
  \@ifnextchar [ % ]
    {\bnu@@@chapter[#1]{#2}}
    {\bnu@@@chapter[#1]{#2}[]}}
\def\bnu@@@chapter[#1]#2[#3]{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection
  \def\@tmpa{#1}
  \def\@tmpb{#3}
  \ifx\@tmpa\@empty
    \addtocounter{bnu@bookmark}\@ne
    \pdfbookmark[0]{#2}{bnuchapter.\thebnu@bookmark}
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \chapter*{#2}
  \ifx\@tmpb\@empty
    \@mkboth{#2}{#2}
  \else
    \@mkboth{#3}{#3}
  \fi}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                     { -24bp\@plus -1ex \@minus -.2ex}%
                     {6bp \@plus .2ex}%
                     {\hei\csname bnu@title@font\endcsname\sihao[1.429]}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                        {-16bp\@plus -1ex \@minus -.2ex}%
                        {6bp \@plus .2ex}%
                        {\hei\csname bnu@title@font\endcsname\banxiaosi[1.538]}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                           {-16bp\@plus -1ex \@minus -.2ex}%
                           {6bp \@plus .2ex}%
                           {\hei\csname bnu@title@font\endcsname\xiaosi[1.667]}}
\setcounter{secnumdepth}{3}
\ifbnu@doctor
  \setcounter{tocdepth}{3} % 目录索引深度
\else
  \setcounter{tocdepth}{3}
\fi
\renewcommand\tableofcontents{%
  \bnu@chapter*[]{\contentsname}
  \xiaosi[1.5]\@starttoc{toc}\normalsize}
\ifbnu@arialtoc
  \def\bnu@toc@font{\sffamily}
\fi
%\def\@pnumwidth{2em} % 这个参数没用了
\def\@tocrmarg{2em}
\def\@dotsep{1} % 目录点间的距离
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\csname bnu@toc@font \endcsname #4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{$\cdot$}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #5}%
    \par}%
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 4bp \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\ifbnu@bachelor\sffamily\else\csname bnu@toc@font\endcsname\fi\heiti #1} % numberline is called here, and it uses \@tempdima
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak{\normalfont\normalcolor #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{1em}{2.3em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{3.3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3em}{4.3em}}
\def\bnu@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname bnu@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\bnu@define@term{secretlevel}
\bnu@define@term{secretyear}
\bnu@define@term{ctitle}
\bnu@define@term{cdegree}
\newcommand\cdepartment[2][]{\def\bnu@cdepartment@short{#1}\def\bnu@cdepartment{#2}}
\def\caffil{\cdepartment} % todo: for compatibility
\def\bnu@cdepartment@short{}
\def\bnu@cdepartment{}
\bnu@define@term{cmajor}
\def\csubject{\cmajor} % todo: for compatibility
\bnu@define@term{cauthor}
\bnu@define@term{csupervisor}
\bnu@define@term{cassosupervisor}
\bnu@define@term{ccosupervisor}
\bnu@define@term{cnum}
\bnu@define@term{cdate}
\bnu@define@term{etitle}
\bnu@define@term{edegree}
\bnu@define@term{edepartment}
\def\eaffil{\edepartment} % todo: for compability
\bnu@define@term{emajor}
\def\esubject{\emajor} % todo: for compability
\bnu@define@term{eauthor}
\bnu@define@term{esupervisor}
\bnu@define@term{eassosupervisor}
\bnu@define@term{ecosupervisor}
\bnu@define@term{edate}
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\bnu@@cabstract}[1]{\long\gdef\bnu@cabstract{#1}}
\newenvironment{cabstract}{\collect@body\bnu@@cabstract}{}
\newcommand{\bnu@@eabstract}[1]{\long\gdef\bnu@eabstract{#1}}
\newenvironment{eabstract}{\collect@body\bnu@@eabstract}{}
\def\bnu@parse@keywords#1{
  \expandafter\gdef\csname bnu@#1\endcsname{} % todo: need or not?
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname bnu@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname bnu@#1\endcsname{\ignorespaces\csname bnu@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname bnu@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\bnu@parse@keywords{ckeywords}
\bnu@parse@keywords{ekeywords}
\newlength{\bnu@title@width}
\def\bnu@put@title#1{\makebox{\hb@xt@ \bnu@title@width{#1}}}
\newcommand{\bnu@first@titlepage}{
  \begin{center}
    \vspace*{-1.8cm}
    \parbox[b][2.4cm][t]{\textwidth}{%
      \ifbnu@secret\hfill{\sihao\bnu@secret@title}\else\rule{1cm}{0cm}\fi}
    \vskip-1.2cm
    %\includegraphics[width=0.5\textwidth]{\bnu@textlogo}
	  {\erhao[2.0] \ziju{4bp} \textbf{\kai{\bnu@schoolename}}}
	  \vskip-0.8cm
      \parbox[t][7cm][t]{\paperwidth-8cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
      \vskip0.2cm
      \ifbnu@bachelor
      	{\xiaochu[2.0] \ziju{4bp} \bf \bnu@bachelor@subtitle}
      \fi
      \ifbnu@master
      	{\xiaochu[1.2] \ziju{4bp} \bf \bnu@master@subtitle}
      \fi
      \ifbnu@doctor
      	{\xiaochu[1.2] \ziju{4bp} \bf \bnu@doctor@subtitle}
      \fi
      \par\vskip2.4cm
		  {\textbf{\xiaosan[2] \bnu@thesistitle \sanhao[2]\kai{\bnu@ctitle}}}
      \end{center}}
	  \par\vskip2.4cm
	  \hspace{0.7cm}
      \parbox[t][10.0cm][t]{0.6\textwidth}{\xiaosan[2.0] \hei
		  \bnu@collagetitle		\bnu@title@sep  { \kai {\bnu@cdepartment}}\\
		  \bnu@cmajortitle		\bnu@title@sep  { \kai {\bnu@cmajor}}\\
		  \bnu@cnumtitle		\bnu@title@sep  { \kai {\bnu@cnum}}\\
		  \bnu@cauthortitle		\bnu@title@sep  { \kai {\bnu@cauthor}}\\
		  \bnu@csupervisortitle \bnu@title@sep  { \kai {\bnu@csupervisor}}\\
		  \bnu@csupervisorstitutetitle \bnu@title@sep { \kai{\bnu@cdepartment}}\\
		}
%        \parbox[t][7.8cm][t]{0.6\textwidth}{{\sihao[2.0] \song \bf
%         \begin{center}\fs
%           \setlength{\bnu@title@width}{7em}
%           \setlength{\extrarowheight}{4pt}
%           \ifxetex % todo: ugly codes
%             \begin{tabular}{p{\bnu@title@width}@{\extracolsep{8pt}}l}
%           \else
%             \begin{tabular}{p{\bnu@title@width}@{\extracolsep{4pt}}l}
%           \fi
%               \bnu@cauthortitle      \bnu@title@sep & \bnu@cauthor\\
%               \bnu@csupervisortitle   \bnu@title@sep & \bnu@csupervisor\\
%               \bnu@cdepartmenttitle   \bnu@title@sep & \bnu@cdepartment\\
%               \bnu@cmajortitle        \bnu@title@sep & \bnu@cmajor\\
%               \bnu@cdatetitle        \bnu@title@sep & \bnu@cdate\\
%             \end{tabular}
%         \end{center}}}

     \begin{center}
       %{\xiaosan \ziju{0bp} \fs \bnu@org}
		{\xiaosan \song \textbf \bnu@today}
     \end{center}
    \end{center}} % end of titlepage

\newcommand\bnu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newcommand{\bnu@authorization@mk}{%
  \vspace*{-0.1cm}
  \begin{center}\sanhao \bf{\song \bnu@declaretitle}\end{center}
  \vskip35pt
  \begin{center}\sihao \bf{\song \bnu@writedeclaretitle}\end{center}
  \vskip5pt \xiaosi[1.8]  \bnu@declaration\par
  \vskip25pt  \begin{flushright}\bnu@declsign\par\end{flushright}
  \vskip4cm
  \begin{center}\sihao \bf{\song \bnu@authtitle}\end{center}
  \vskip5pt \xiaosi[1.8]  \bnu@authorization\par
  \vskip25pt \begin{flushright}\xiaosi[1.8] \bnu@authsign\par \end{flushright}
  \begin{flushright} \xiaosi[1.8]  \bnu@frontdate\par \end{flushright}

  \vskip1cm
  %\begin{flushright}\bnu@declsign\par\end{flushright}
    %\begingroup
      %\parindent0pt\xiaosi
      %\hspace*{2em}\bnu@authorsig\bnu@underline[9.5em]\relax\hfill%
                     %\bnu@frontdate\bnu@underline[9.5em]\relax\hspace*{3cm}\\[18pt]
      %\hspace*{2em}\bnu@teachersig\bnu@underline[9.5em]\relax\hfill%
                     %\bnu@frontdate\bnu@underline[9.5em]\relax\hspace*{3cm}
    %\endgroup
  }
\newcommand{\makecover}{
  \phantomsection
  \pdfbookmark[-1]{\bnu@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \bnu@first@titlepage
    \clpage\bnu@authorization@mk
  \end{titlepage}
  \normalsize
  \bnu@makeabstract
  \let\@tabular\bnu@tabular}
\newcommand{\bnu@makeabstract}{%
  \cleardoublepage % always openright for Abstract

  \bnu@chapter*[\cabstractname]{} % no tocline
  \pagestyle{bnu@headings}
  \pagenumbering{Roman}
  \begin{center}
  	\sanhao[1.5] \bf \bnu@ctitle \par
  	\vskip16bp  	
  	\xiaosan[1.5] \hei \bf \cabstractname
  \end{center}
  \vskip16bp
  \xiaosi[1.6] \song \par \bnu@cabstract
  \vskip12bp
  \setbox0=\hbox{{\sihao \hei\bnu@ckeywords@title}}
  \noindent\hangindent\wd0\hangafter1
    \box0 \xiaosi \song \bnu@ckeywords

  \bnu@chapter*[\eabstractname]{} % no tocline
  \begin{center}
  	\sanhao[1.6] \bf \bnu@etitle \par
  	\vskip16bp  	
  	\xiaosan[1.6] \hei \bf \eabstractname
  \end{center}
  \vskip16bp  	
  \xiaosi[1.6] \song \par \bnu@eabstract
  \vskip12bp
  \setbox0=\hbox{\textbf \bnu@ekeywords@title}
  \noindent\hangindent\wd0\hangafter1
    \box0\bnu@ekeywords}
\newenvironment{denotation}[1][2.5cm]{
  \bnu@chapter*[]{\bnu@denotation@name} % no tocline
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}
\newenvironment{ack}{%
    \bnu@chapter*[\bnu@acklongname]{\bnu@ackname}[\bnu@acklongname]
  }{ \vskip12bp  \sihao[1.5] \hei \rightline{\bnu@cauthor \hspace{1.5em}} \par \rightline{\bnu@cdate}}

\def\bnu@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\bnu@listof#1{% #1: float type
  \@ifstar
    {\bnu@chapter*[]{\csname list#1name\endcsname}\bnu@starttoc{#1}}
    {\bnu@chapter*{\csname list#1name\endcsname}\bnu@starttoc{#1}}}
\renewcommand\listoffigures{\bnu@listof{figure}}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\bnu@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\bnu@listof{equation}}
\let\l@equation\l@figure
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\def\bnudot{\ifbnu@bachelor\else\unskip.\fi}
\def\bnumasterbib{\ifbnu@doctor [M]\else [Master Thesis]\fi}
\def\bnuphdbib{\ifbnu@doctor [D]\else [Doctor Thesis]\fi}
% 定义参考文献编号格式
\def\bibleftdelim{[}
\def\bibrightdelim{]}
\def\@biblabel#1{\bibleftdelim #1\bibrightdelim}
\renewenvironment{thebibliography}[1]{%
   \bnu@chapter*{\bibname}%
   \xiaosi[1.5]
   \list{\@biblabel{\@arabic\c@enumiv .}}%
		{\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{0cm}
         \setlength{\labelsep}{0.5em} % 标号和列表项之间的距离
         \setlength{\itemindent}{1em}  % 项内首行缩进
         \setlength{\leftmargin}{0.5cm} % 左缩进
         \setlength{\listparindent}{2em} % 段落间距
         \addtolength{\itemsep}{-0.7em} % 项间距
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}

\let\bnu@appendix\appendix
\renewenvironment{appendix}{%
  \bnu@appendix
  \renewcommand \thechapter { \@arabic\c@chapter} %% 附录用阿拉伯数字编码
%%  \renewcommand \thechapter { \@Alph\c@chapter} %% 附录用大写字母编码
  \gdef\@chapapp{\appendixname~\thechapter}
  \renewcommand\theequation{\ifnum \c@chapter>\z@ \appendixequation\thechapter-\fi\@arabic\c@equation}
  \renewcommand\thetable{\@arabic\c@table}
  \renewcommand\thefigure{\@arabic\c@figure}
  }{}

\newenvironment{paper}{%
  % \cleardoublepage
  \bnu@chapter*{\bnu@paper@title}}{}
%\newcommand{\paperitem}[1]{\vspace{2.5em}{\sihao\hei\centerline{#1}}\par}
\newcommand{\shuji}[1][\bnu@ctitle]{
  \newpage\thispagestyle{empty}\ziju{0.4em}\fs\xiaosan
  \hfill\rotatebox{-90}{\hb@xt@ \textheight{#1\hfill\bnu@cauthor}}}
\iffalse
\newcommand{\bs}{\symbol{'134}}%Print backslash
\newcommand{\cih}[1]{%
  \index{commands!#1@\texttt{\bs#1}}%
  \index{#1@\texttt{\hspace*{-1.2ex}\bs #1}}}
\newcommand{\ci}[1]{\cih{#1}\texttt{\bs#1}}
\newcommand{\pai}[1]{%
  \index{packages!#1@\textsf{#1}}%
  \index{#1@\textsf{#1}}%
  \textsf{#1}}
\newcommand{\ei}[1]{%
  \index{environments!\texttt{#1}}%
  \index{#1@\texttt{#1}}%
  \texttt{#1}}
\newcommand{\wi}[1]{\index{#1}#1}
\fi
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}
\def\bnu@active@cjk{
  % Activate all >128 characters.
  \count@=128
  \@whilenum\count@<254 \do{%
    \advance\count@ by 1
    \lccode`\~=\count@
    \catcode\count@=\active
    \lowercase{\def~{\kern1ex}}}}
\AtEndOfClass{\ifxetex\else\bnu@active@cjk\fi\input{bnuthesis.cfg}}
\def\bnu@fixselectfont{%
  \ifx\@EverySelectfont@EveryHook\@undefined\else% everysel package is loaded
    \DeclareRobustCommand{\selectfont}{%
       \ifx\f@linespread\baselinestretch \else
          \set@fontsize\baselinestretch\f@size\f@baselineskip \fi
       \xdef\font@name{%
          \csname\curr@fontshape/\f@size\endcsname}%
       \pickup@font
       \font@name
       % CJK addition:
       \CJK@bold@false
       \csname \curr@fontshape\endcsname
       % everysel addition:
       \@EverySelectfont@EveryHook
       \@EverySelectfont@AtNextHook
       \gdef\@EverySelectfont@AtNextHook{}%
       % end additions
       \size@update
       \enc@update}
  \fi}
\def\bnu@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\bnu@ctitle},
    pdfauthor={\bnu@cauthor},
    pdfsubject={\bnu@cdegree},
    pdfkeywords={\bnu@ckeywords},
    pdfcreator={\bnu@cauthor},
    pdfproducer={\bnuthesis}}}
\ifxetex
  \AtBeginDocument{\CJKindent}
\else
  \def\bnu@beginCJK{%
    \bnu@fixselectfont%
    \begin{CJK*}{UTF8}{song}\CJKindent}
  \def\bnu@endCJK{\clearpage\end{CJK*}}
  \let\bnu@begindocumenthook\@begindocumenthook
  \let\bnu@enddocumenthook\@enddocumenthook
  \def\AtBeginDocument{\g@addto@macro\bnu@begindocumenthook}
  \def\AtEndDocument{\g@addto@macro\bnu@enddocumenthook}
  \def\@begindocumenthook{\bnu@begindocumenthook\bnu@beginCJK}
  \def\@enddocumenthook{\bnu@endCJK\bnu@enddocumenthook}
\fi
\AtEndOfClass{\sloppy\bnu@item@space}
\endinput
%%
%% End of file `bnuthesis.cls'.
