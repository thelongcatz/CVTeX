% simplylongcv.cls
%
% A LaTeX2e document for preparing curriculum vitae (CV)

% References:
% https://www.overleaf.com/learn/latex/How_to_write_a_LaTeX_class_file_and_design_your_own_CV_(Part_1)
% https://github.com/c-keyes/CV_template

\LoadClass{article} % Use article class as base template
\NeedsTeXFormat{LaTeX2e} % Latest LaTeX format
\ProvidesClass{simplylongcv}[2023/05/03] % Class name and version

%% Load packages
% No indent for new paragraphs, see https://tex.stackexchange.com/a/40432
% Set parfill=0pt to avoid hfill from not filling up the entire line: https://www.reddit.com/r/LaTeX/comments/t3ljjm/hfill_not_reaching_the_end_of_the_line/
\RequirePackage[parfill=0pt]{parskip}
\RequirePackage{geometry}
\RequirePackage{titlesec} % Modifies format of some commands
\RequirePackage{hyperref}

%% Set geometry of the class
\geometry{a4paper, portrait, margin=1in}
%% Request no page number in the document
\pagenumbering{gobble}

%%% Customise \section and \subsection %%%
% \scshape: Small capitals, \raggedright: Left aligned
\titleformat{\section}
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

\titlespacing*{\section}{0pt}{1.6ex}{2.5ex} % Left spacing, before spacing, after spacing

% \bfseries: Bold-faced fonts
\titleformat{\subsection}
  {\large\bfseries\raggedright}
  {}{0em}
  {}
  []

\titlespacing*{\subsection}{0pt}{1.6ex}{2.5ex}
%%%

%%% Aliases %%%
%% \section and \subsection with date on the right
\newcommand{\datedsection}[2] {
  \section[#1]{#1~\hfill \textnormal{#2}}
}
\newcommand{\datedsubsection}[2] {
  \subsection[#1]{#1~\hfill \textnormal{#2}}
}

%% Command to produce your name, nice and big
\newcommand{\name}[1]{
  {\LARGE\scshape{#1}} \vspace{0.5em}
}

%% Add address
\newcommand{\address}[3]{
  #1{\large\textperiodcentered}#2{\large\textperiodcentered}#3\\ \vspace{0.5em}
}

%% Produce contact info (2 phone (1st for tel: hyperlink, 2nd for typesetting) and 1 email fields)
\newcommand{\contact}[3]{
  \href{tel:#1}{#2} \hspace{1.25em} \href{mailto:#3}{#3}
}

%% Skill entry
\newcommand{\skill}[2]{
  #1: #2
}

%% Experience with date on the right
\newcommand{\datedexperience}[2]{
  #1\hfill#2
}

%% Work experience - the fields are job title, date, company name, and location
\newcommand{\workexperience}[4]{
  \datedsubsection{#1}{#2}
  \vspace{-1.5ex}
  {\large{#3}\hfill{#4}}
}

%% Language level
\newcommand{\languageability}[2]{
  #1 - #2
}
%%%
