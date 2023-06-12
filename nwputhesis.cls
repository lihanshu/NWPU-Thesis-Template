\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwputhesis}
[2023/6/12 v0.6 Standard LaTeX Template for NWPU thesis]
% Loading Class
\LoadClass[12pt,fontset=none]{ctexart}
% Loading Package
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
    \ClassError{nwputhesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
        Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% 空格&空行
\RequirePackage{color}
\newcommand{\myspace}[1]{\par\vspace{#1\baselineskip}}
\newcommand{\makespace}{
    \newpage
    \textcolor{white}{11}\\
    \textcolor{white}{11}
}
% 首行缩进
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\RequirePackage{enumitem}
% 页眉设置
\RequirePackage{fancyhdr}
\setlength{\headheight}{27pt}
\setlength{\headsep}{7pt}
\renewcommand{\headrulewidth}{1pt} %线宽
\chead{\includegraphics[scale=0.15]{./picture/nwpuheader.png}}
\rhead{}
\lhead{}
\fancypagestyle{cover}{
    \thispagestyle{empty}
    \fancyfoot{} % 页脚清空
}
\fancypagestyle{noncover}{
    \fancyfoot[C]{\zihao{-5}\thepage} % 页脚清空
}
% 字体设置
\RequirePackage{xeCJK}
\setmainfont{Times New Roman}
\setCJKmainfont{simsun.ttc}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily{\blackti}{simhei.ttf}
\setCJKmonofont{simsun.ttc}[AutoFakeSlant,AutoFakeBold]
% 行间距设置
\RequirePackage{setspace}
\linespread{1.3541667}
\iffalse
    {\linespread{2.0} \selectfont% 两倍行距的文字
    }
\fi
% 页面设置 
\RequirePackage[a4paper]{geometry}
\geometry{
    left=31.8mm,
    right=31.8mm,
    top=25.4mm,
    bottom=25.4mm,
}
% 章节标题定制
\RequirePackage{titlesec}
\titleformat{\section}{\centering\fontsize{16.0600pt}{1.25}\blackti}{第\chinese{section}章}{1em}{\blackti}
\titleformat{\subsection}{\fontsize{14.0525pt}{1.25}\blackti}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\fontsize{12.0450pt}{1.25}\blackti}{\thesubsubsection}{1em}{}
% 目录定制   
\RequirePackage{titletoc}
\ctexset{
    section = {
      name={第, 章},number={\chinese{section}}
     },
}
\titlecontents{section}[0pt]{\vspace{2mm}\bf}
{\thecontentslabel\hskip.5em}{}{~\titlerule*[0.6pc]{$\cdot$}~\contentspage}
\titlecontents{subsection}[20pt]{}
{\thecontentslabel\hskip.5em}{}{~\titlerule*[0.6pc]{$\cdot$}~\contentspage}
\titlecontents{subsubsection}[30pt]{}
{\thecontentslabel\hskip.5em}{}{~\titlerule*[0.6pc]{$\cdot$}~\contentspage}
% 参考文献
\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}
% \RequirePackage{balance} % 参考文献对齐
\makeatletter
%\renewcommand\@biblabel[1]{lquad\quad[#1]} %参考文献标号右对齐
\renewcommand\@biblabel[1]{[#1]\hfill}%参考文献标号左对齐
\makeatother

% 超链接
\RequirePackage{hyperref}
\hypersetup{hidelinks}
\hypersetup{pdfborder={0 0 0}}
% 公式
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\numberwithin{equation}{section}
\renewcommand\theequation{\arabic{section}-\arabic{equation}}
% 表格和图片
\RequirePackage{array}
\RequirePackage{float}
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{tablefootnote} % 表格脚注
\RequirePackage{multirow} % 跨行
\RequirePackage{booktabs} % 三线表
\RequirePackage{longtable}% 跨页表格
\RequirePackage{graphicx}
% 表格和图片标题
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{chngcntr} % 清零控制
\counterwithin{equation}{section}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\captionsetup{labelsep=space,justification=centering}
\DeclareCaptionFont{wuhaohei}{\fontsize{10.5bp}{1.25}\blackti}
\DeclareCaptionFont{wuhao}{\fontsize{10.5bp}{1.25}}
\captionsetup[table]{font = {wuhaohei}}
\captionsetup[figure]{font = {wuhao}}
%\captionsetup[subfigure]{font = {wuhao}}
\renewcommand{\thefigure}{\thesection{}-\arabic{figure}}
\renewcommand {\thetable} {\thesection{}-\arabic{table}}
% 算法伪代码
\RequirePackage{algorithm,algorithmic}
\makeatletter
\newenvironment{breakablealgorithm}
{% \begin{breakablealgorithm}
		\begin{center}
			\refstepcounter{algorithm}% New algorithm
			\hrule height.8pt depth0pt \kern2pt% \@fs@pre for \@fs@ruled
			\renewcommand{\caption}[2][\relax]{% Make a new \caption
				{\raggedright\textbf{\ALG@name~\thealgorithm} ##2\par}%
				\ifx\relax##1\relax % #1 is \relax
				\addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
				\else % #1 is not \relax
				\addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
				\fi
				\kern2pt\hrule\kern2pt
			}
		}{% \end{breakablealgorithm}
		\kern2pt\hrule\relax% \@fs@post for \@fs@ruled
	\end{center}
}
\makeatother

% Cover
\renewcommand{\maketitle}{\par
    \begingroup
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \endgroup
}
\def\maketitle{
    \pagestyle{cover}
    \begin{figure}[h!]
        \centering
        \vspace{2.30cm} %设置与上面正文的距离`
        %\setlength{\abovecaptionskip}{0.0cm}   
        %\setlength{\belowcaptionskip}{0.0cm} 
        \includegraphics[width=10cm]{picture/nwpulogo.png}
        \vspace{1.30cm}
    \end{figure}
    \begin{center}
        {\fontsize{42.1575pt}{1.25}\textbf{本科毕业设计（论文）}}
    \end{center}

    \begin{center}
        \vspace{3.5cm}
        \fontsize{20pt}{\baselineskip}\selectfont
        {\fontsize{16.0600pt}{1.25}\blackti 题目：\underline{ \textcolor{white}{111111}论文题目 \textcolor{white}{111111}}}
        \vspace{1.5cm}

        {\fontsize{14.0525pt}{1.25} 专业名称\underline{ \textcolor{white}{11111} 名\quad 称\textcolor{white}{111111}}}
        \vspace{1.5cm}

        {\fontsize{14.0525pt}{1.25} 学生姓名\underline{ \textcolor{white}{11111}姓\quad 名\textcolor{white}{111111}}}
        \vspace{1.5cm}

        {\fontsize{14.0525pt}{1.25} 指导教师\underline{ \textcolor{white}{11111}姓\quad 名\textcolor{white}{111111}}}
        \vspace{1.5cm}

        {\fontsize{14.0525pt}{1.25} 毕业时间\underline{ \textcolor{white}{1111}{\large 2023}年{\large 7}月\textcolor{white}{,,111}}}
        % {\fontsize{20pt}{1.25} 专业名称\underline{ \textcolor{white}{11111111} \textcolor{white}{11111111}}}
        \vspace{1.5cm}
    \end{center}}

% abstract
\newcommand{\makeabstract}{
    \pagestyle{noncover}
    \setcounter{page}{1}
    \pagenumbering{Roman}
    \textcolor{white}{11}\\
    \textcolor{white}{11}
    \begin{center}
        { \blackti \fontsize{16.0600pt}{1.25}摘 \, 要}
    \end{center}
    \textcolor{white}{11}
}

\newcommand{\makeEnabstract}{
    \newpage
    \textcolor{white}{11}\\
    \textcolor{white}{11}
    \begin{center}
        { \textbf{\fontsize{16.0600pt}{1.25}ABSTRACT}}
    \end{center}
    \textcolor{white}{11}}


% content
\newcommand{\makecontent}{
    \newpage
    \textcolor{white}{11}\\
    \textcolor{white}{11}
    \tableofcontents}

% text
\newcommand{\maketext}{
    \newpage
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \textcolor{white}{1}}

% 表格和图片目录
\renewcommand{\listfigurename}{图\quad 目\quad 录}
\renewcommand{\listtablename}{表\quad 目\quad 录}
\newcommand{\makefigcontent}{    \newpage
    \textcolor{white}{11}

    \textcolor{white}{11}
\listoffigures}
\newcommand{\maketabcontent}{    \newpage
    \textcolor{white}{11}

    \textcolor{white}{11}
\listoftables}
\titlecontents{figure}[20pt]{}{\figurename~\thecontentslabel\quad}{}{~\titlerule*[0.6pc]{$\cdot$}~\contentspage}
\titlecontents{table}[20pt]{}{\tablename~\thecontentslabel\quad}{}{~\titlerule*[0.6pc]{$\cdot$}~\contentspage}
