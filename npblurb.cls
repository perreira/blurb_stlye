%% LaTeX / LuaLaTeX Class for Blurb Books
%% Please adapt to your needs, no guarantee that anything works
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{npblurb}[2012/07/22 v0.2a Class for Blurb books (and other POD maybe later)]
%% ABOUT
%% Written by Nils Pickert mailto:nils@mipi.de
%% Some ideas taken from https://github.com/aginiewicz/createspace/ 
%% and from http://redskiesatnight.com/books/pod/latex-templates-for-pod-publishing-with-blurb-com/
%%
%% Use at your own risk, this is might not work!
%%
%% HISTORY
%% 12/07/12 v0.1a first version running, 
%% 13/07/12 v0.1b passes Adobe Preflight Check for PDFX/1-3; tested with pocketbig, passes Blurb Preflight
%% 22/07/12 v0.2a using xkeyval package for arguments, allowing to set borders a bit more flexible for the user
%%
%% TODO
%% - make layout more user configurable (define text-borders as key/val pairs)
%% - make more robust
%% - finetune layouts
%% - write documentation
%% - steal underpants
%% - ...
%% - profit

% Calc for calculations
\RequirePackage{calc}
% xkeyval for option handling
\RequirePackage{xkeyval}

%% Defining Lengths
\newlength\blurbpaperwidth
\newlength\blurbpaperheight
\newlength\blurblayoutwidth
\newlength\blurblayoutheight
\newlength\blurblayoutvoffset
\newlength\blurbouter
\newlength\blurbinner
\newlength\blurbbindingoffset
\newlength\blurbheadheight
\newlength\completeinnermargin
\newlength\imagepageshift
%\newlength\basefontsize


% Define a default pdf media and trimbox
\newcommand{\settrimbox}{% 
 \pdfpageattr{
   /MediaBox [0 0 693.36000 594.00000]
   /TrimBox [0.00000 9.00000 693.00000 594.0000]
  }
}


%% Defining Options
%% Paperformats: 
%% - pocketbig: Pocket book large 15x23 cm (5x8 in)
%% - pocket: Pocket book 13x20 cm (6x9 in)
%% - square: the standard square book 18x18 cm (7x7 in)
%% - port: portrait standard 20x25 cm (8x10 in)
%% - land: landscape standard 25x20 cm (10x8 in)
%% - landbig: landscape big 33x28 cm (13x11 in)
%% - squarebig: square book in big

\define@choicekey*+{npblurb.cls}{bbook}[\val\bbnr]{pocketbig,pocket,square,port,land,squarebig,landbig}{%
\ifcase\bbnr\relax
%% Pocketbook big
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{15.557truecm}
\setlength\blurbpaperheight{23.495truecm}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{22.86truecm}
\setlength\blurblayoutvoffset{0.317truecm}
\setlength\blurbbindingoffset{1.587truecm}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{
 	/MediaBox [0 0 441.00000 666.00000]%
  	/TrimBox [0.00000 9.00000 441.00000 666.0000]
  	}
  }
\or
%% Pocketbook normal
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{13.017truecm}
\setlength\blurbpaperheight{20.995truecm}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{20.321truecm}
\setlength\blurblayoutvoffset{0.317truecm}
\setlength\blurbbindingoffset{1.587truecm}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{%
  /MediaBox [0 0 369.00000 594.00000]
  /TrimBox [0.00000 9.00000 369.00000 594.0000]}%
  }
\or
%% Square 8x8 inches
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{495bp}
\setlength\blurbpaperheight{495bp}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{477bp}
\setlength\blurblayoutvoffset{9bp}
\setlength\blurbbindingoffset{45bp}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{%
  /MediaBox [0 0 495.00000 495.00000]
  /TrimBox [0.00000 9.00000 495.00000 495.0000]}%
  }
\or
%% Portrait Standard 8x10 inches
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{20.002truecm}
\setlength\blurbpaperheight{25.4truecm}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{24.766truecm}
\setlength\blurblayoutvoffset{0.317truecm}
\setlength\blurbbindingoffset{1.587truecm}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{%
  /MediaBox [0 0 567.00000 720.00000]
  /TrimBox [0.00000 9.00000 567.00000 720.0000]}%
  }
\or
%% Landscape Standard 10x8 inches
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{24.447truecm}
\setlength\blurbpaperheight{20.995truecm}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{20.321truecm}
\setlength\blurblayoutvoffset{0.317truecm}
\setlength\blurbbindingoffset{1.587truecm}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{%
  /MediaBox [0 0 693.000 594.00000]
  /TrimBox [0.00000 9.00000 693.00000 594.0000]}%
  }
\or
%% Square Big
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{30.162truecm}
\setlength\blurbpaperheight{30.479truecm}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{29.845truecm}
\setlength\blurblayoutvoffset{0.317truecm}
\setlength\blurbbindingoffset{1.587truecm}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{%/MediaBox [0 0 693.36000 594.00000]
  /TrimBox [0.00000 9.00000 855.00000 864.0000]}%
  }
\or
%% Landscape Big 13x11 inches
%% Dimensions given by Blurb
\setlength\blurbpaperwidth{32.067truecm}
\setlength\blurbpaperheight{27.622truecm}
%% this has to be the same as paperwidth, as geometry cannot handle left/right hoffset with twopage docs correctly
\setlength\blurblayoutwidth{\blurbpaperwidth}
\setlength\blurblayoutheight{26.988truecm}
\setlength\blurblayoutvoffset{0.317truecm}
\setlength\blurbbindingoffset{1.587truecm}
\renewcommand{\settrimbox}{% 
 \pdfpageattr{%
  /MediaBox [0 0 909.00000 783.00000]
  /TrimBox [0.00000 9.00000 909.00000 783.0000]}%
  }
\fi
}{%
\ClassError{npblurb}{Unknown Book format: #1, please use either of: pocketbig, pocket, square, port, land, landbig, squarebig}
}

%% Dimensions which can be changed
\setlength\blurbouter{2.817truecm} %% this is a matter of taste
\setlength\blurbinner{0.5truecm} %% this is a matter of taste
\setlength\blurbheadheight{15pt} %% this is a matter of taste
\DeclareOptionX{inner}[0.5truecm]{\setlength\blurbinner{#1}}
\DeclareOptionX{outer}[2.817truecm]{\setlength\blurbouter{#1}}
\DeclareOptionX{head}[15pt]{\setlength\blurbheadheight{#1}}

%% Process options
\ProcessOptionsX

%% This class is based on the standard LaTeX Book class, so everything you know from there should work.
\LoadClassWithOptions{book}
%%
%% Loading packages %%
%%
% LaTeX Fixes
\RequirePackage{fixltx2e}
% xcolor allows the use of color, who would have thought that...
\RequirePackage{xcolor}
% mdframed for colorful boxes
\RequirePackage[xcolor]{mdframed}

%% Set up pagesize with geometry
\RequirePackage[twoside,
		  paperwidth=\blurbpaperwidth,
		  paperheight=\blurbpaperheight,
          layoutwidth=\blurblayoutwidth, 
          layoutheight=\blurblayoutheight,
          layoutvoffset=\blurblayoutvoffset,
%          layouthoffset=0.317truecm, %% this does not work, it's a geometry problem...
          outer=\blurbouter,
          inner=\blurbinner,
          bindingoffset=\blurbbindingoffset,
          headheight=\blurbheadheight,
%          showframe, %% DEBUGGING ONLY 
%          showcrop   %% DEBUGGING ONLY
]{geometry}

%%
%% More packages %%
%%
% hyperref for PDF, options needed for PDF X/1-a (unicode=true)
\RequirePackage[unicode=true,draft,bookmarks=false]{hyperref}
%graphicx to load images
\RequirePackage{graphicx}
% textpos for full page image
%\RequirePackage[%
%showboxes
%]{textpos}
% Koma Script utilities
\RequirePackage{scrextend}
% Float on double pages...
\RequirePackage{dpfloat}


%% Variables for PDF X/1-a compatible documents %%
\def\@pdfsubject{}
\def\@pdfkeywords{}
\let\@pdftitle\@empty
\let\@pdfauthor\@empty
\let\cs@author\author
\let\cs@title\title

\renewcommand\author[1]{\pdfauthor{#1}\cs@author{#1}}
\renewcommand\title[1]{\pdftitle{#1}\cs@title{#1}}
\newcommand\pdfauthor[1]{\pdfstringdef\@pdfauthor{#1}}
\newcommand\pdftitle[1]{\pdfstringdef\@pdftitle{#1}}
\newcommand\pdfsubject[1]{\pdfstringdef\@pdfsubject{#1}}
\newcommand\pdfkeywords[1]{\pdfstringdef\@pdfkeywords{#1}}

%% Setting variable with complete margin length
\setlength\completeinnermargin{\blurbinner}
\addtolength\completeinnermargin{\blurbbindingoffset}
\setlength\imagepageshift{\completeinnermargin}
\addtolength\imagepageshift{\paperwidth}

%% defining easy image commands
% fullpageimage gives you a full page image float (LaTeX decides where it ends up)
% As it is using figure* it also works with multicol
% It will probably end up on a right page always as it is using the fullpage environment
\newcommand\fullpageimage[1]{\begin{figure*}%
\begin{fullpage}%
\ifthispageodd{\hspace{-\completeinnermargin}}{\hspace{-\blurbouter}}%
\includegraphics[width=\paperwidth]{#1}%
\end{fullpage}%
\end{figure*}}
% twopageimage gives you a single image spread over a double page (left and right)
\newcommand\twopageimage[1]{
\begin{figure*}%
\begin{leftfullpage}%
\hspace{-\blurbouter}\includegraphics[width=2\paperwidth]{#1}%
\end{leftfullpage}%
\end{figure*}%
\begin{figure*}%
\begin{fullpage}%
\hspace{-\imagepageshift}\includegraphics[width=2\paperwidth]{#1}%
\end{fullpage}%
\end{figure*}%
}


%% Execute this at Begin Document (still in the preamble!)
\AtBeginDocument{
\pdfinfo{
  /Title (\@pdftitle)
  /Author (\@pdfauthor)
  /Subject (\@pdfsubject)
  /Keywords (\@pdfkeywords)
  /GTS_PDFXVersion (PDF/X-1:2001)
  /GTS_PDFXConformance (PDF/X-1a:2001)
}%
\settrimbox
\pdfobjcompresslevel=0
\pdfminorversion=3

%% include color profile
\immediate\pdfobj stream attr{/N 4}  file{Blurb_ICC_Profile.icc}%
\edef\cs@profile{\the\pdflastobj}%
\xdef\cs@profilename{Blurb ICC Profile}%
\def\cs@backslash{\expandafter\@gobble\string\\}
\pdfcatalog{
  /PageMode /UseNone
  /OutputIntents [ <<
    /Type /OutputIntent
    /S /GTS_PDFX
    /OutputConditionIdentifier (\cs@profilename\space\cs@backslash(basICColor\cs@backslash))
    /DestOutputProfile \cs@profile\space 0 R
    /RegistryName (http://www.color.org/)
  >> ]
	}%
}

%% Execute at the End of the documet
\AtEndDocument{
%% ensure that the page number is even
\makeatletter
\def\emptycleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother
\emptycleardoublepage
%% That's it
}