@rem -*- mode: conf -*-
@rem ----------------------------------------------------------------------
@rem START OF FILE
@rem ----------------------------------------------------------------------
@rem 
@rem Filename: msmake.cmd
@rem Author: Fred Qi
@rem Created: 2006-05-20 14:09:57(+0800)
@rem Version: 
@rem 
@rem ----------------------------------------------------------------------
@rem COMMENTARY
@rem ----------------------------------------------------------------------
@rem
@rem 使用说明：
@rem
@rem 1.配置thuthesis宏包
@rem msmake setup
@rem 　　在当前目录下生成thuthesis宏包及说明文档thuthesis.pdf
@rem
@rem 2.生成示例文档
@rem msmake [shuji|main|all|other]
@rem 　　在当前目录下生成示例文档，或其中的一部分，或其他用户指定文档
@rem 如果当前目录下无thuthesis.cls，将自动根据thuthesis.ins生成。
@rem 　　- shuji	仅生成书脊
@rem 　　- main		仅生成main.pdf
@rem 　　- all		生成书脊和main.pdf，默认选项
@rem 　　- other	用户指定的tex文件名，由该tex文件产生pdf文档
@rem
@rem 3.清理目录
@rem msmake clean [other]
@rem 　　清理当前目录下由thuthesis宏包生成的文件，具体包括
@rem 宏包及其说明文档thuthesis.{cls,cfg,dvi,ps,pdf}
@rem 示例文档shuji.pdf, main.{dvi,ps,pdf,aux,etc.}
@rem 如果用户指定其他文件名，不删除main.*，而删除
@rem other.{dvi,ps,pdf,lo?,aux,bbl,blg,out* toc thm}
@rem
@rem 4.辅助图形图像文件格式转换命令：
@rem msmake epspdf [param] 
@rem	 将当前目录下所有eps文件用epstopdf转为pdf格式
@rem msmake bmpeps [param]
@rem	 将当前目录下所有bmp,jpg,png文件用bmeps转为eps格式
@rem 以上两个命令中，[param]可以由用户指定转换程序所用的参数。
@rem 
@rem ----------------------------------------------------------------------
@rem CHANGE LOG
@rem ----------------------------------------------------------------------
@rem Last-Updated: 2006-05-26 11:47:40(+0800) [by Fred Qi@lab]
@rem     Update #: 312
@rem ----------------------------------------------------------------------
@rem 2006-05-20 16:53:38(+0800)    Fred Qi@lab
@rem    msmake.cmd initial. prepaired for thuthesis 2.5
@rem 
@rem 
@rem 
@rem ----------------------------------------------------------------------
@rem ----------------------------------------------------------------------

@echo off
set thupkg=thuthesis
set tmpfile=_clstemptest_
set ltxparam=-quiet -c-style-errors
if /i {%1}=={clean} goto clean
if /i {%1}=={epspdf} goto epspdf
if /i {%1}=={bmpeps} goto bmpeps
if /i {%1}=={setup} goto setup
goto testcls
:clean
@rem =============================================
@rem 清除文档生成过程中产生的临时文件
@rem =============================================
echo 删除thuthesis宏包相关文件
del /f /q %thupkg%.cls %thupkg%.cfg 
echo 删除thuthesis宏包的说明文档
del /f /q %thupkg%.dvi %thupkg%.ps %thupkg%.pdf
echo 删除shuji.pdf
del /f /q shuji.pdf shuji.ps shuji.dvi
echo 删除示例文档main.pdf及生成该文档过程中产生的文件
if {%2}=={} (set targ=main) else (set targ=%2)
del /f %targ%.dvi %targ%.ps %targ%.pdf
del /f %targ%.lo? %targ%.aux %targ%.bbl %targ%.blg
del /f %targ%.out* %targ%.toc %targ%.thm
del /f data\*.aux
echo 删除其它临时文件
del /f /q *.log *.aux *.glo *.idx *.ilg *.ind *.out *.thm *.toc *.lot *.loe *.out.bak
goto end
@rem =============================================
@rem 将当前目录下的eps文件转换为pdf格式
@rem 需要用到epstopdf
@rem =============================================
:epspdf
if /i {%2}=={} (
  set conv=call epstopdf %%i
) else (
  set conv=call epstopdf %2 %%i
)
@echo on
for %%i in (*.eps) do %conv%
@echo off
goto end
@rem =============================================
@rem 将当前目录下的bmp,jpg,png图形转换为eps格式
@rem 需要用到bmeps
@rem =============================================
:bmpeps
if /i {%2}=={} (set param=-c) else (set param=%2)
set conv=call bmeps %param% %%i %%~ni.eps
@echo on
for %%i in (*.bmp *.jpg *.png) do %conv%
@echo off
goto end
:testcls
@rem =============================================
echo 正在测试是否需要生成thuthesis宏包...
@rem =============================================
if not exist %thupkg%.cls goto presetup
if not exist %thupkg%.cfg goto presetup
goto choose
@rem -----------------------------
@rem this section of code is NOT used.
echo \documentclass{%thupkg%}>%tmpfile%.tex
echo \begin{document}>>%tmpfile%.tex
echo \end{document}>>%tmpfile%.tex
call latex %ltxparam% %tmpfile%.tex>nul
IF ERRORLEVEL 1 (goto presetup) else goto choose
@rem NOT used code block end.
@rem -----------------------------
:presetup
@rem del /f /q %tmpfile%.*
echo 您没有安装或配置好thuthesis宏包，
echo 本程序试图重新生成并配置thuthesis宏包...
:setup
@rem =============================================
@rem 生成thuthesis宏包及说明文档
@rem =============================================
if not exist %thupkg%.ins goto clserr4
if exist %thupkg%.cls del /f /q %thupkg%.cls
if exist %thupkg%.cfg del /f /q %thupkg%.cfg
echo 正在生成%thupkg%宏包...
call latex %ltxparam% %thupkg%.ins
@rem IF errorlevel 1 goto clserr3
echo 成功生成thuthesis宏包
@rem ----------------------------------------------
if not exist %thupkg%.dtx goto clserr2
echo 正在生成%thupkg%宏包的说明文档...
call latex %ltxparam% %thupkg%.dtx
if errorlevel 1 goto clserr1
call makeindex -s gind.ist -o %thupkg%.ind %thupkg%.idx
if errorlevel 1 goto clserr1
call makeindex -s gglo.ist -o %thupkg%.gls %thupkg%.glo
if errorlevel 1 goto clserr1
call latex %ltxparam% %thupkg%.dtx
if errorlevel 1 goto clserr1
call gbk2uni %thupkg%.out
if errorlevel 1 goto clserr1
call latex %ltxparam% %thupkg%.dtx
if errorlevel 1 goto clserr1
call dvips -Ppdf -G0 %thupkg%.dvi
if errorlevel 1 goto clserr1
call ps2pdf %thupkg%.ps
if errorlevel 1 goto clserr1
echo 成功生成thuthesis说明文档thuthesis.pdf
@rem 清理说明文档生成过程中产生的临时文件
del /f /q %thupkg%.log
del /f /q %thupkg%.aux
del /f /q %thupkg%.glo
del /f /q %thupkg%.gls
del /f /q %thupkg%.idx
del /f /q %thupkg%.out
del /f /q %thupkg%.out.bak
del /f /q %thupkg%.ind
del /f /q %thupkg%.ilg
del /f /q %thupkg%.toc
@rem del /f /q %thupkg%.dvi
@rem del /f /q %thupkg%.ps
goto choose
@rem ----------------------------------------------
:clserr2
echo 没有找到thuthesis.dtx文件
:clserr1
echo 无法生成说明文档thuthesis.pdf
goto end
:clserr4
echo 没有找到thuthesis.ins文件
:clserr3
echo 无法生成thuthesis宏包
goto end
:choose
if /i {%1}=={setup} goto end
set ltx=latex %ltxparam%
if /i {%1}=={shuji} goto shuji
if /i {%1}=={main} goto main
if /i {%1}=={all} goto all
if /i {%1}=={} (goto all) else goto other
:dvips
@rem =============================================
@rem 使用latex->dvips->ps2pdf生成示例文档main.pdf
@rem =============================================
:other
set targ=%2
goto latex
:all
:shuji
set targ=shuji
set errmsg=pdflatex
call pdflatex shuji.tex
if errorlevel 1 goto error
@rem set errmsg=dvipdfmx
@rem dvipdfmx shuji.dvi
@rem if errorlevel 1 goto error
del /f /q %targ%.aux
del /f /q %targ%.log
del /f /q %targ%.out
del /f /q %targ%.thm
@rem del /f /q %targ%.dvi
if /i {%1}=={shuji} goto end
:main
set targ=main
goto latex
:pdf
@rem =============================================
@rem 使用pdflatex生成示例文档main.pdf
@rem =============================================
@echo 未实现的功能。
goto end
:latex
@rem =============================================
@rem 生成示例文档
@rem =============================================
set errmsg=%ltx%
call %ltx% %targ%
if errorlevel 1 goto error
set errmsg=bibtex
call bibtex -quiet %targ%
if errorlevel 1 goto error
set errmsg=latex
call %ltx% %targ%
if errorlevel 1 goto error
set errmsg=gbk2uni
call gbk2uni %targ%
if errorlevel 1 goto error
set errmsg=latex
call %ltx% %targ%
if errorlevel 1 goto error
if {%1}=={pdf} goto end
set errmsg=dvips
call dvips -Ppdf -G0 -ta4 %targ%.dvi
if errorlevel 1 goto error
set errmsg=ps2pdf
call ps2pdf %targ%.ps
if errorlevel 1 goto error
goto end
@rem =============================================
@rem 示例文件生成过程中出错处理
@rem =============================================
:error
echo 使用%errmsg%生成%targ%.pdf的过程中出错
:end
@rem =============================================
@rem 执行结束
@rem =============================================
@rem ----------------------------------------------------------------------
@rem END OF FILE
@rem ----------------------------------------------------------------------
