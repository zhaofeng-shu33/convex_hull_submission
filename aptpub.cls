\def\filename{aptpub.cls}
\def\fileversion{10}
\def\filedate{22 December 2015}
%% This is aptpub.cls, public version
%% Copyright (C) 2001 Applied Probability Trust.
%% Written by Stephen Webb.
%% Updated by emma Talib, David Cruickshank and by Maria Kelly
%% All rights reserved.
%% Copying of this file is authorized only if
%% you make absolutely no changes to your copy.
%%
\typeout{\filename\space v\fileversion, (C) Copyright Applied Probability Trust, \filedate}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aptpub}[2001/03/09]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[twoside]{article}
\RequirePackage{ifthen,calc}
\RequirePackage{amsbsy,amsfonts,amssymb,amsmath}
\RequirePackage{theorem}
%%
% The following sorts out the dimensions of the page
%%
\normalsize
\evensidemargin=0pt
\oddsidemargin=0pt
\hoffset=6pt
\voffset=30pt
\textwidth 375pt
\setlength{\textheight}{569.6788pt}
\headheight 11pt
\headsep 19pt
\footskip 24pt
\parindent 12pt
\topskip 10pt
\abovedisplayskip=10pt plus 2pt minus 8pt
\belowdisplayskip=10pt plus 2pt minus 8pt
\belowdisplayshortskip=5pt plus 3pt minus4pt
%
\renewcommand{\baselinestretch}{1.5}
%
%%
% The following are for list structures
%%
\renewenvironment{itemize}
                 {\begin{list}{$\bullet$}
                  {\setlength{\topsep}{6pt plus 2pt minus2pt}
                  \setlength{\partopsep}{0pt}
                  \setlength{\itemsep}{3pt}
                  \setlength{\parsep}{0pt}}
                 }{\end{list}}
%
\setlength{\topsep}{6pt plus 2pt minus2pt}
\setlength{\partopsep}{0pt}
\setlength{\itemsep}{3pt}
\setlength{\parsep}{0pt}
%%
% The page styles . . .
%%
% . . . for the first page
%%
\def\ps@firstpg{\let\@mkboth\@gobbletwo
\def\@evenhead{\hfil\crnotice{}}
\def\@oddhead{\hfil\crnotice{}}
\def\@evenfoot{{\small\textrm\hfil\thepage\hfil}}
\def\@oddfoot{{\small\textrm\hfil\thepage\hfil}}}
%%
% . . . and for subsequent pages
%%
\def\ps@myheadings{\let\@mkboth\@gobbletwo
\def\@evenhead{{\small\textrm\thepage}\hfill{\small\textrm{\uppercase{\authornamesa}}}}
\def\@oddhead{{\small\textit{\shorttitlea}}\hfill{\small\textrm\thepage}}
\def\@evenfoot{\rm\hfill}
\def\@oddfoot{\rm\hfill}}
%%
\pagestyle{myheadings}
%%
\newcommand{\shorttitlea}{Short title}
\newcommand{\shorttitle}[1]{\renewcommand{\shorttitlea}{#1}}
\newcommand{\authornamesa}{AUTHOR NAMES}
\newcommand{\authornames}[1]{\renewcommand{\authornamesa}{#1}}
%%
% Elements belonging to the title page
%%
\renewcommand\thefootnote{}
\renewcommand\footnoterule{\flushleft\raisebox{2pt}{\rule{42.68pt}{0.4pt}}}
\skip\footins=17.07pt
%
\newcommand{\crnotice}{\hfill{{\small\emph{Applied\ Probability\ Trust}\ (\today)}}}
%
\renewcommand{\today}
             {\number\day \space \ifcase\month\or
              January\or February\or March\or April\or May\or June\or
              July\or August\or September\or October\or November\or December
              \fi \space \number\year
             }

%%
% The title
%%
\renewcommand{\title}[1]
             {\thispagestyle{firstpg}
              \vspace*{9pt}
              \noindent\fontsize{11}{13}\selectfont\textbf{\uppercase{#1}}}


%%
% Submission/acceptance date:
%%
\newcommand{\recd}[2]{\footnotetext[0]{\hspace*{-14.5pt}Received #1; revision received #2.}}



%%
% The author/institution:
%%
\newcommand{\authorone}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{*}$ \textit{#1}}\par}
\newcommand{\authortwo}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{**}$ \textit{#1}}\par}
\newcommand{\authorthree}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{***}$ \textit{#1}}\par}
\newcommand{\authorfour}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{****}$ \textit{#1}}\par}
\newcommand{\authorfive}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{*****}$ \textit{#1}}\par}
\newcommand{\authoronetwo}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{*~**}$ \textit{#1}}\par}
\newcommand{\authoronethree}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{*~***}$ \textit{#1}}\par}
\newcommand{\authoronefour}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{*~****}$ \textit{#1}}\par}
\newcommand{\authoronefive}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{*~*****}$ \textit{#1}}\par}
\newcommand{\authortwothree}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{**~***}$ \textit{#1}}\par}
\newcommand{\authortwofour}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{**~****}$ \textit{#1}}\par}
\newcommand{\authortwofive}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{**~*****}$ \textit{#1}}\par}
\newcommand{\authorthreefour}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{***~****}$ \textit{#1}}\par}
\newcommand{\authorthreefive}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{***~*****}$ \textit{#1}}\par}
\newcommand{\authorfourfive}[2][]{\noindent\hspace*{9pt}{\small\textrm{\uppercase{#2}},$^{****~*****}$ \textit{#1}}\par}

%%
% The address
%%
\newcommand{\addressone}[1]{\footnote{\hspace*{-14pt}$^{*}\,$Postal address: #1}\par}
\newcommand{\addresstwo}[1]{\footnote{\hspace*{-14pt}$^{**}\,$Postal address: #1}\par}
\newcommand{\addressthree}[1]{\footnote{\hspace*{-14pt}$^{***}\,$Postal address: #1}\par}
\newcommand{\addressfour}[1]{\footnote{\hspace*{-14pt}$^{****}\,$Postal address: #1}\par}
\newcommand{\addressfive}[1]{\footnote{\hspace*{-14pt}$^{*****}\,$Postal address: #1}\par}
%%
% The 'current' address (in case they've moved)
%%
\newcommand{\curaddone}[1]{\footnote{\hspace*{-14pt}$^{*}\,$Current address: #1}\par}
\newcommand{\curaddtwo}[1]{\footnote{\hspace*{-14pt}$^{**}\,$Current address: #1}\par}
\newcommand{\curaddthree}[1]{\footnote{\hspace*{-14pt}$^{***}\,$Current address: #1}\par}
\newcommand{\curaddfour}[1]{\footnote{\hspace*{-14pt}$^{****}\,$Current address: #1}\par}
\newcommand{\curaddfive}[1]{\footnote{\hspace*{-14pt}$^{*****}\,$Current address: #1}\par}
%%
%  Email address
%%
\newcommand{\email}[1]{\begin{footnotesize}Email address: #1\end{footnotesize}}
\newcommand{\emailone}[1]{\footnote{\hspace*{-14pt}$^{*}\,$Email address: #1}\par}
\newcommand{\emailtwo}[1]{\footnote{\hspace*{-14pt}$^{**}\,$Email address: #1}\par}
\newcommand{\emailthree}[1]{\footnote{\hspace*{-14pt}$^{***}\,$Email address: #1}\par}
\newcommand{\emailfour}[1]{\footnote{\hspace*{-14pt}$^{****}\,$Email address: #1}\par}
\newcommand{\emailfive}[1]{\footnote{\hspace*{-14pt}$^{*****}\,$Email address: #1}\par}

\newcommand{\authoronenoaffil}[1]{\hspace*{9pt}{\small\textrm{\uppercase{#1}}\,$^{*}$}\par}
\newcommand{\authortwonoaffil}[1]{\hspace*{9pt}{\small\textrm{\uppercase{#1}}\,$^{**}$}\par}
\newcommand{\authornone}[2][]{\hspace*{9pt}{\small\textrm{\uppercase{#2}}, \textit{#1}}\par}
\newcommand{\authornonesame}[1]{\hspace*{9pt}{\small\textrm{\uppercase{#1}} \textsc{and}}\par}
\newcommand{\authornonenoaffil}[1]{\hspace*{9pt}{\small\textrm{\uppercase{#1}}}\par}

%%
\renewcommand{\author}{\authorone}
\newcommand{\address}{\addressone}
%%
% The abstract environment
%%
\renewenvironment{abstract}
                 {\vspace{6pt}
                  \begin{center}
                  \begin{minipage}{315.83pt}
                  \small
                  \begin{center}
                  {\bf Abstract}
                  \end{center}
                  \noindent\ignorespaces
                 }
                 {\end{minipage}\end{center}}
%%
% Keywords
%%
\newcommand{\keywords}[1]
           {\begin{center}
            \begin{minipage}{315.83pt}
            \small
            \noindent \emph{Keywords:}~{\textrm{#1}}
            \end{minipage}
            \end{center}
            \normalsize
           }
%%
% AMS classes
%%
\newcommand{\amsprimary}[1]
           {\begin{center}
            \begin{minipage}{315.83pt}
            \small
            \noindent 2020 Mathematics Subject Classification:~Primary {\uppercase{#1}}
            \end{minipage}
            \end{center}
            \par\normalsize
           }
%%
\newcommand{\ams}[2]
           {\begin{center}
            \begin{minipage}{315.83pt}
            \small
            \noindent 2020 Mathematics Subject Classification:~Primary {\uppercase{#1}}\\
            \phantom{2020 Mathematics Subject Classification:~}Secondary {\uppercase{#2}}
            \end{minipage}
            \end{center}
            \par\normalsize
           }
%%
\newcommand\msc[2]{\ams{#1}{#2}}
\newcommand\mscprimary[1]{\amsprimary{#1}}
%%
% The section headings
%%
\renewcommand{\section}{\makeatletter
\renewcommand{\@seccntformat}[1]{{\csname the##1\endcsname.}\hspace{0.45em}}
\makeatother
\@startsection
{section}%                                            the name
{1}%                                                  the level
{0pt}%                                                the indent
{\baselineskip}%                                      the beforeskip
{0.5\baselineskip}%                                   the afterskip
{\centering\normalsize\bfseries\mathversion{bold}}}%  the style
%%
\renewcommand{\subsection}{\makeatletter
\renewcommand{\@seccntformat}[1]{{\csname the##1\endcsname.}\hspace{0.45em}}
\makeatother
\@startsection
{subsection}%                                         the name
{2}%                                                  the level
{0pt}%                                                the indent
{0.5\baselineskip}%                                   the beforeskip
{0.25\baselineskip}%                                  the afterskip
{\normalsize\bfseries\mathversion{bold}}}%            the style
%%
\renewcommand{\subsubsection}{\makeatletter
\renewcommand{\@seccntformat}[1]{{\rm{\csname the##1\endcsname.}}\hspace{0.45em}}
\makeatother
\@startsection
{subsubsection}%                   the name
{3}%                               the level
{0pt}%                             the indent
{0.5\baselineskip}%                the beforeskip
{-0.25\baselineskip}%              the afterskip
{\normalsize\itshape}}%            the style
%%
%%
% Appendices
%%
\renewcommand{\appendix}{\setcounter{section}{0}\renewcommand{\thesection}{\Alph{section}}
\renewcommand{\section}{\makeatletter
\renewcommand{\@seccntformat}[1]{{\appendixname\ \csname thesection\endcsname.}\hspace{0.45em}}
\makeatother
\@startsection
{section}%                                            the name
{1}%                                                  the level
{0pt}%                                                the indent
{\baselineskip}%                                      the beforeskip
{0.5\baselineskip}%                                   the afterskip
{\centering\normalsize\bfseries\mathversion{bold}}}%  the style
}
%%
% The Acknowledgements and declaration section
%%
\newcommand\ack{\section*{Acknowledgement}}
\newcommand\Ack{\section*{Acknowledgement}}
\newcommand\acks{\section*{Acknowledgements}}
\newcommand\Acks{\section*{Acknowledgements}}


\newcommand\competing{\section*{Competing interests}}
\newcommand\Competing{\section*{Competing interests}}


\newcommand\data{\section*{Data}}
\newcommand\Data{\section*{Data}}


\newcommand\fund{\section*{Funding information}}
\newcommand\Fund{\section*{Funding information}}


\newcommand\supp{\section*{Supplementary material}}
\newcommand\Supp{\section*{Supplementary material}}

%%
% The following are commands to print a ruled space, indicating
% the position of a figure.
%%
\newcounter{figno}
\newcommand{\Fig}[1]
           {\setcounter{figno}{\value{figure}+1}
            \begin{figure}
            \begin{center}
            \begin{picture}(150,150)
            \put(0,0){\framebox(150,150){Figure \thefigno}}
            \end{picture}
            \end{center}
            \caption{\small#1}
            \end{figure}
           }
%%
\newcommand{\hFig}[1]
           {\setcounter{figno}{\value{figure}+1}
            \begin{figure}[h]
            \begin{center}
            \begin{picture}(150,150)
            \put(0,0){\framebox(150,150){Figure \thefigno}}
            \end{picture}
            \end{center}
            \caption{\small#1}
            \end{figure}
           }
%%
% The following commands refer to table captions.
%%
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.9}
\setlength{\textfloatsep}{10pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\def\fnum@figure{\small{\sc\figurename}~\thefigure}
\def\fnum@table{\small{\sc\tablename}~\thetable}
%%
% The following commands are to do with theorem-like environments.
%%
% This bit defines the style
%%
\gdef\th@plain{\normalfont\itshape
  \def\@begintheorem##1##2{%
        \item[\hskip\labelsep \theorem@headerfont ##1\ {\bf ##2.}] }%
\def\@opargbegintheorem##1##2##3{%
   \item[\hskip\labelsep \theorem@headerfont ##1\ ##2.]{\upshape(}\emph{##3.}{\upshape)} }
}
%%
% These are the various available environments
%%
% For Theorem 1, Lemma 1, Corollary 1, Propostion 1,...
%%
\newtheorem{theorem}{\noindent Theorem}
\newtheorem{lemma}{\noindent Lemma}
\newtheorem{corollary}{\noindent Corollary}
\newtheorem{proposition}{\noindent Proposition}
\newtheorem{conjecture}{\noindent Conjecture}
\newtheorem{assertion}{\noindent Assertion}
\newtheorem{assumption}{\noindent Assumption}
\newtheorem{condition}{\noindent Condition}
%%
% For Theorem 1.1, Lemma 1.1, Corollary 1.1, Propostion 2.1,...
%%
\newtheorem{thm}{\noindent Theorem}[section]
\newtheorem{lem}{\noindent Lemma}[section]
\newtheorem{cor}{\noindent Corollary}[section]
\newtheorem{prop}{\noindent Proposition}[section]
\newtheorem{conj}{\noindent Conjecture}[section]
\newtheorem{assert}{\noindent Assertion}[section]
\newtheorem{assumpt}{\noindent Assumption}[section]
\newtheorem{cond}{\noindent Condition}[section]
%%
\theoremheaderfont{\normalfont\bfseries}
\theorembodyfont{\itshape}%%%%%%%%%%%%%%%%%%%5
\setlength{\theorempreskipamount}{6pt plus 2pt}
\setlength{\theorempostskipamount}{6pt plus 2pt}
%%
% For Example 1, Definition 1, ...
%%
{\theorembodyfont{\rmfamily} \newtheorem{example}{\noindent Example}}
{\theorembodyfont{\rmfamily} \newtheorem{definition}{\noindent Definition}}
{\theorembodyfont{\rmfamily} \newtheorem{problem}{\noindent Problem}}
{\theorembodyfont{\rmfamily} \newtheorem{observation}{\noindent Observation}}
{\theorembodyfont{\rmfamily} \newtheorem{result}{\noindent Result}}
{\theorembodyfont{\rmfamily} \newtheorem{remark}{\noindent Remark}}
{\theorembodyfont{\rmfamily} \newtheorem{remarks}[remark]{\noindent Remarks}}
{\theorembodyfont{\rmfamily} \newtheorem{note}{\noindent Note}}
{\theorembodyfont{\rmfamily} \newtheorem{notes}[note]{\noindent Notes}}
%%
% For Example 1.1, Definition 1.1, ...
%%
{\theorembodyfont{\rmfamily} \newtheorem{ex}{\noindent Example}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{defn}{\noindent Definition}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{prob}{\noindent Problem}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{obs}{\noindent Observation}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{res}{\noindent Result}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{rem}{\noindent Remark}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{rems}[rem]{\noindent Remarks}}
{\theorembodyfont{\rmfamily} \newtheorem{nte}{\noindent Note}[section]}
{\theorembodyfont{\rmfamily} \newtheorem{ntes}[nte]{\noindent Notes}}
%%
% For unnumbered Example, Definition, Remark,...
%%
\newenvironment{exnn}{\addvspace{\medskipamount}\noindent\textbf{Example.}}{\medbreak}
\newenvironment{defnn}{\addvspace{\medskipamount}\noindent\textbf{Definition.}}{\medbreak}
\newenvironment{probnn}{\addvspace{\medskipamount}\noindent\textbf{Problem.}}{\medbreak}
\newenvironment{obsnn}{\addvspace{\medskipamount}\noindent\textbf{Observation.}}{\medbreak}
\newenvironment{resnn}{\addvspace{\medskipamount}\noindent\textbf{Result.}}{\medbreak}
\newenvironment{remnn}{\addvspace{\medskipamount}\noindent\textbf{Remark.}}{\medbreak}
\newenvironment{remsnn}{\addvspace{\medskipamount}\noindent\textbf{Remarks.}}{\medbreak}
\newenvironment{notenn}{\addvspace{\medskipamount}\noindent\textbf{Note.}}{\medbreak}
\newenvironment{notesnn}{\addvspace{\medskipamount}\noindent\textbf{Notes.}}{\medbreak}
%%
% The proof environment
%%
\newenvironment{proof}[1][Proof]
               {\par \normalfont \topsep6\p@\@plus2\p@\relax
                \trivlist
                \item[\hspace{17pt}\itshape #1{.}]\ignorespaces
               }{\hfill\ensuremath{\square}\endtrivlist}
%%
% Various useful definitions
%%
\def\var{\mathop{\rm var}\nolimits}    %variance
\def\cov{\mathop{\rm cov}\nolimits}    %covariance
\def\corr{\mathop{\rm corr}\nolimits}  %correlation
%
\newcommand{\rd}{\mathrm{d}} %differential d
\DeclareMathOperator\sd{d\!} %differential d preceeded by a thin space, when needed
\newcommand{\ri}{\mathrm{i}} %imaginary i
\newcommand{\re}{\mathrm{e}} %exponential e
\DeclareMathOperator\sP{P}   %probability, treated as an operator
\newcommand{\rP}{\mathrm{P}} %probability, when spacing isn't a worry
\DeclareMathOperator\sE{E}   %expectation, treated as an operator
\newcommand{\rE}{\mathrm{E}} %expectation, when spacing isn't a worry
%
\newcommand{\trans}{^\top}   %matrix transpose
%
\newcommand{\cvgpr}{\xrightarrow{\text{\upshape\tiny P}}}   %convergence in probability
\newcommand{\cvgwk}{\xrightarrow{\text{\upshape\tiny W}}}   %weak convergence
\newcommand{\cvgdist}{\xrightarrow{\text{\upshape\tiny D}}} %convergence in distribution
\newcommand{\eqdist}{\stackrel{\text{\upshape\tiny D}}{=}}  %equality in distribution
%
\hyphenpenalty=1000
%
\chardef\ii="10
%%
% The name--date reference list style
%%
\newenvironment{harvreferences}
               {\section*{References}
                \begin{footnotesize}
                \begin{list}{}{\setlength{\itemsep}{0pt}
                               \setlength{\parsep}{0pt}
                               \setlength{\labelwidth}{0pt}
                               \setlength{\leftmargin}{12pt}
                               \setlength{\labelsep}{0pt}}
                \setlength{\itemindent}{-12pt}
               }{\end{list}\end{footnotesize}}
%%
% bold italic font for use in vectors etc
%%
\DeclareMathAlphabet{\bi}{OT1}{ptm}{b}{it}
%
\newcommand{\balpha}{\boldsymbol{\alpha}}
\newcommand{\bbeta}{\boldsymbol{\beta}}
\newcommand{\bgamma}{\boldsymbol{\gamma}}
\newcommand{\bdelta}{\boldsymbol{\delta}}
\newcommand{\bepsilon}{\boldsymbol{\epsilon}}
\newcommand{\bzeta}{\boldsymbol{\zeta}}
\newcommand{\bfeta}{\boldsymbol{\feta}}
\newcommand{\btheta}{\boldsymbol{\theta}}
\newcommand{\biota}{\boldsymbol{\iota}}
\newcommand{\bkappa}{\boldsymbol{\kappa}}
\newcommand{\blambda}{\boldsymbol{\lambda}}
\newcommand{\bmu}{\boldsymbol{\mu}}
\newcommand{\bnu}{\boldsymbol{\nu}}
\newcommand{\bxi}{\boldsymbol{\xi}}
\newcommand{\bpi}{\boldsymbol{\pi}}
\newcommand{\brho}{\boldsymbol{\rho}}
\newcommand{\bsigma}{\boldsymbol{\sigma}}
\newcommand{\btau}{\boldsymbol{\tau}}
\newcommand{\bupsilon}{\boldsymbol{\upsilon}}
\newcommand{\bphi}{\boldsymbol{\phi}}
\newcommand{\bchi}{\boldsymbol{\chi}}
\newcommand{\bpsi}{\boldsymbol{\psi}}
\newcommand{\bomega}{\boldsymbol{\omega}}
\newcommand{\bvarepsilon}{\boldsymbol{\varepsilon}}
\newcommand{\bvartheta}{\boldsymbol{\vartheta}}
\newcommand{\bvaromega}{\boldsymbol{\varomega}}
\newcommand{\bvarrho}{\boldsymbol{\varrho}}
\newcommand{\bvarsigma}{\boldsymbol{\varsigma}}
\newcommand{\bvarphi}{\boldsymbol{\varphi}}
\newcommand{\bpartial}{\boldsymbol{\partial}}
\newcommand{\bell}{\boldsymbol{\ell}}
\newcommand{\bimath}{\boldsymbol{\imath}}
\newcommand{\bjmath}{\boldsymbol{\jmath}}
%
\newcommand{\binfty}{\boldsymbol{\infty}}
\newcommand{\bnabla}{\boldsymbol{\nabla}}
\newcommand{\bdot}{\boldsymbol{\cdot}}
%%
%%
%%
