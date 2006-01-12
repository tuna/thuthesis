REM 我不会写bat，这个是凑出来的
REM 不要见怪 ^_^

REM 生成 thuthesis.cls 和 thuthesis.cpx
latex thuthesis.ins  

REM 生成示例文档 main.pdf 
latex main
bibtex main
latex main
gbk2uni main
latex main
dvips -Ppdf -G0 -ta4 main.dvi
ps2pdf main.ps

REM 生成书脊 shuji.pdf
pdflatex shuji


REM 生成说明文档 thuthesis.pdf
latex thuthesis.dtx
makeindex -s gind.ist -o thuthesis.ind thuthesis.idx
makeindex -s gglo.ist -o thuthesis.gls thuthesis.glo
latex thuthesis.dtx
gbk2uni thuthesis.out
latex thuthesis.dtx 
dvips -Ppdf -G0 thuthesis.dvi
ps2pdf thuthesis.ps
