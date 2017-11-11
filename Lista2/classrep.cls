\NeedsTeXFormat{LaTeX2e}
\LoadClass[11pt,a4paper,authortitle]{mwart}
\usepackage[OT4]{polski}
\usepackage[top=2.7cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage{url,enumerate}
\usepackage{array,multirow}
\usepackage{multicol}
\usepackage{algpseudocode,algorithm,mathtools,listings}
\usepackage{booktabs,siunitx}
\usepackage{graphicx}
\usepackage{subfig,caption}

\usepackage[usenames,dvipsnames]{xcolor}

%%
%% Julia definition (c) 2014 Jubobs
%%
\lstdefinelanguage{Julia}%
  {morekeywords={abstract,break,case,catch,const,continue,do,else,elseif,%
      end,export,false,for,function,immutable,import,importall,if,in,%
      macro,module,otherwise,quote,return,switch,true,try,type,typealias,%
      using,while},%
   sensitive=true,%
   alsoother={},%
   morecomment=[l]\#,%
   morecomment=[n]{\#=}{=\#},%
   morestring=[s]{"}{"},%
   morestring=[m]{'}{'},%
}[keywords,comments,strings]%

\lstset{%
    language         = Julia,
    basicstyle       = \ttfamily,
    keywordstyle     = \bfseries\color{blue},
    stringstyle      = \color{magenta},
    commentstyle     = \color{ForestGreen},
    showstringspaces = false,
}

\makeatletter

\def\studycycle#1{\gdef\@studycycle{#1}}
\def\@studycycle{\ClassError{classrep}{No \noexpand\studycycle given}{}}
\def\coursesemester#1{\gdef\@coursesemester{#1}}
\def\@coursesemester{\ClassError{classrep}{No \noexpand\coursesemester given}{}}
\def\coursename#1{\gdef\@coursename{#1}}
\def\@coursename{\ClassError{classrep}{No \noexpand\coursename given}{}}
\def\courseyear#1{\gdef\@courseyear{#1}}
\def\@courseyear{\ClassError{classrep}{No \noexpand\courseyear given}{}}
\def\coursegroup#1{\gdef\@coursegroup{#1}}
\def\@coursegroup{\ClassError{classrep}{No \noexpand\coursegroup given}{}}
\def\courseteacher#1{\gdef\@courseteacher{#1}}
\def\@courseteacher{\ClassError{classrep}{No \noexpand\courseteacher given}{}}

\newcommand\studentinfo[3][]{#2&#3&\texttt{#1}}

\newcommand\coursesemesterfield{semestr}
\newcommand\courseteacherfield{Prowadz\k{a}cy}

\newcommand\@typesetauthors{%
    {\normalsize
      \begin{tabular}[t]{lrl}%
        \large\strut\ignorespaces\@author
      \end{tabular}\par}%
}
\renewcommand{\and}{\\ \large\strut}

\newcommand\@typesettitle{{\LARGE \@title \par}}

\renewcommand{\@maketitle}{%
  \newpage
  \null
  \noindent\strut\@studycycle\hfill\coursesemesterfield\ \@coursesemester
  \hrule{\hspace{\textwidth}}\\
  {\large\noindent\textbf{\@coursename\hfill\@courseyear}}\\
  \noindent\strut\courseteacherfield: \@courseteacher \hfill\@coursegroup
  \hrule{\hspace{\textwidth}}\\
  \vskip \baselineskip
  \vskip 6\baselineskip
  \begin{center}%
  \let \footnote \thanks
    \large
    \if@authorfirst\else
      \@typesettitle%
    \vskip \baselineskip \fi
    \@typesetauthors
    \if@authorfirst
      \vskip \baselineskip
    \@typesettitle\fi
  \end{center}%
  \par
  \vskip 1\baselineskip
  }


\makeatother