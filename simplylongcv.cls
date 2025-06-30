% SimplyLongCV
% A short and maintenance-free TeX class for preparing a general curriculum vitae (CV)
% Credits: https://github.com/jankapunkt/latexcv

\LoadClass{article} % Use article class as base template
\NeedsTeXFormat{LaTeX2e} % Latest LaTeX format
\ProvidesClass{simplylongcv}[2024/09/05] % Class name and version

%% Load packages
% No indent for new paragraphs, see https://tex.stackexchange.com/a/40432
% Set parfill=0pt to avoid hfill from not filling up the entire line: https://www.reddit.com/r/LaTeX/comments/t3ljjm/hfill_not_reaching_the_end_of_the_line/
\RequirePackage[parfill=0pt]{parskip}
\RequirePackage{geometry}
\RequirePackage{hyperref}

% Required for Jan Küster's CV template below
\RequirePackage{transparent}
\RequirePackage{color}
\RequirePackage{tikz} % Draw arrows below
\RequirePackage{enumitem} % Change list style
\RequirePackage{xifthen} % Use the included calc to calculate custom spacings below
\RequirePackage[T1]{fontenc} % Enforce T1 font encoding: https://tex.stackexchange.com/a/677
\RequirePackage{moresize} % More font sizes
\RequirePackage{fontawesome} % Give icons from Font Awesome
\RequirePackage{fontspec}

%% Set geometry of the class
\geometry{a4paper, portrait, top=1cm, bottom=-.6cm, left=0.4cm, right=1cm}
%% Request no page number in the document
\pagenumbering{gobble}	

%%% Aliases %%%
%%% Mostly modified from Jan Küster's CV template

%% Font config
\setmainfont{IBM Plex Sans}
%% Accent colour
\definecolor{accentcol}{RGB}{0,114,178}
%% Complementary colour (to accent)
\definecolor{compltcol}{RGB}{213,94,0}

%% Calculate custom widths
\newcommand{\mystrut}{\rule[-.3\baselineskip]{0pt}{\baselineskip}}
\newcommand{\mpwidth}{\linewidth-\fboxsep-\fboxsep}
\setlength{\headheight}{-5pt}

%% Set default list style with custom spacings and bullet
\setlist{topsep=3pt, itemsep=6pt, label=\larrow{cyan}}

%% Six-pointed arrows (the ones on traffic signs)
\newcommand{\tzlarrow}{(0,0) -- (0.2,0) -- (0.3,0.2) -- (0.2,0.4) -- (0,0.4) -- (0.1,0.2) -- cycle;}	
\newcommand{\larrow}[1]{
	\begin{tikzpicture}[scale=0.58]
		\filldraw[fill=#1!100,draw=#1!100!black]  \tzlarrow
	\end{tikzpicture}
}
\newcommand{\tzrarrow}{ (0,0.2) -- (0.1,0) -- (0.3,0) -- (0.2,0.2) -- (0.3,0.4) -- (0.1,0.4) -- cycle;}
\newcommand{\rarrow}{
	\begin{tikzpicture}[scale=0.7]
		\filldraw[fill=accentcol!100,draw=accentcol!100!black] \tzrarrow
	\end{tikzpicture}
}
%%

% CV section (main)
\newcommand{\cvsection}[1]{
	\vspace{10pt}
	\colorbox{accentcol}{%
		\mystrut\makebox[\mpwidth][l]{
			\larrow{compltcol} \hspace{-8pt} \larrow{compltcol} \hspace{-8pt} \larrow{compltcol} \textbf{\textcolor{white}{\uppercase{#1}}}\hspace{4pt}
		}%
	}\\[2pt]
}

% Meta section (sidebar)
\newcommand{\metasection}[1]{
	\vspace{24pt}
	\textcolor{white}{\large{\uppercase{#1}}}\\
	\parbox{.8\mpwidth}{\textcolor{white}{\hrule}}\color{white}\par
}

% Name and short description
\newcommand{\selfintroduction}[2]{%
	\vspace{-3pt}
	
	\colorbox{accentcol}{%
		\makebox[\mpwidth][c]{
			\HUGE{\textcolor{white}{\uppercase{#1 }}}
			\textcolor{white}{\rule[-1mm]{1mm}{0.9cm}}
			\HUGE{\textcolor{white}{\uppercase{ CV}}}
		}%
	}
	
	\colorbox{compltcol}{%
		\parbox{\mpwidth}{
			\begin{center}
				\textcolor{white}{#2}
			\end{center}
		}%
	}%
}

% CV events with title, place and time
\newcommand{\cvevent}[3]{%
	\vspace{4pt}
	\textcolor{black}{\textbf{#1}} \hfill
	\textcolor{accentcol}{#2}, \textcolor{compltcol}{#3}
	\vspace{4pt}
	\textcolor{black}{\hrule}
	\vspace{4pt}%
}

%% Annotate FontAwesome icons with texts
% use to vertically center content
% credits to: http://tex.stackexchange.com/questions/7219/how-to-vertically-center-two-images-next-to-each-other
\newcommand*{\vcenteredhbox}[1]{\begingroup
	\setbox0=\hbox{#1}\parbox{\wd0}{\box0}\endgroup}
\newcommand{\annotateicon}[3]{ 						%icon with text shortcut
	\vcenteredhbox{
		\makebox(12, 12){
			\textcolor{#3}{\csname fa#1\endcsname}
		}
	}
	\vcenteredhbox{\textcolor{#3}{#2}}
}
%%
