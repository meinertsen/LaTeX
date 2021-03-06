\ProvidesClass{Meinertsen}[2017/07/10 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz} % Drawing icons
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{fontawesome} % Icons
\RequirePackage{parskip}
\RequirePackage{alltt}
\RequirePackage{fancyvrb}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%\usepackage[pdftex, hidelinks=false, pdfauthor={Frederik Meinertsen},pdftitle={Meinertsen's CV}]{hyperref}

%	 COLOURS
\definecolor{white}{RGB}{255,255,255}
\definecolor{grey}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingrey}{HTML}{B9B9B9}


%	 MISC CONFIGURATIONS
\renewcommand{\bfseries}{\color{grey}} % Make \textbf produce coloured text instead
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

%	 SIDEBAR DEFINITIONS

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1.6cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{2.5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!75} \Large #1 \rule[0.15\baselineskip]{\TotalSectionLength}{0pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvmobile}[1]{\renewcommand{\cvmobile}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvskype}[1]{\renewcommand{\cvskype}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\sidecaseone}[1]{\renewcommand{\sidecaseone}{#1}}
\newcommand{\sidecasetwo}[1]{\renewcommand{\sidecasetwo}{#1}}
\newcommand{\sidecasethree}[1]{\renewcommand{\sidecasethree}{#1}}
\newcommand{\sidecasefour}[1]{\renewcommand{\sidecasefour}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle, minimum size=7mm,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}


\newcommand\countries[1]{
	\renewcommand{\countries}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingrey,maingrey] (0,\i) rectangle (5.2,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing skill progress bars
\newcommand\skills[1]{
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingrey,maingrey] (0,\i) rectangle (5.2,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

%	 SIDEBAR LAYOUT

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=8.5cm, minimum height=\paperheight+5cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	\begin{textblock}{5}(0.5, 0.5)


		\renewcommand{\arraystretch}{1.6}
		\begin{tabular}{p{0.5cm} @{\hskip 0.6cm}p{5cm}}



		\end{tabular}

		\ifthenelse{\equal{\sidecaseone}{}}{}{	\profilesection{Programming(\emph{self}, *)}
			\begin{flushleft}
				\begin{alltt}
                \sidecaseone
                \end{alltt}
			\end{flushleft}
		}
		\ifthenelse{\equal{\sidecaseone}{}}{}{
			\profilesection{Business Intelligence}
			\begin{flushleft}
				\sidecasetwo
			\end{flushleft}
		}
		\ifthenelse{\equal{\sidecasethree}{}}{}{
			\profilesection{Cloud experience}
			\begin{flushleft}
				\sidecasethree
			\end{flushleft}
		}
		\ifthenelse{\equal{\sidecasefour}{}}{}{
			\profilesection{Dev Environment}
			\begin{flushleft}
				\sidecasefour
			\end{flushleft}
		}


		\scriptsize

		%------------------------------------------------

	\end{textblock}
}


%	 COLOURED SECTION TITLE BOX

\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			maingrey\or%
			%mainblue\or%
			maingrey\or%
			%mainblue\or%
			maingrey\or%
			%mainblue\or%
			maingrey\or%
			%mainblue\or%
 			maingrey\or%
			%mainblue\else%
			maingrey\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{black}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{black} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{cvlatex}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\cvlatexitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		%\textbf
        {#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

%	 SMALL LIST ENVIRONMENT

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{cvlatexshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\cvlatexitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		%\textbf
        {#2}%
	}\\
}

%	 MARGINS AND LINKS

\RequirePackage[left=7cm,top=0.1cm,right=0.5cm,bottom=0.1cm,nohead,nofoot]{geometry}
\RequirePackage[pdftex, hidelinks, pdfauthor={Frederik Meinertsen},pdftitle={Meinertsen's CV}]{hyperref}
