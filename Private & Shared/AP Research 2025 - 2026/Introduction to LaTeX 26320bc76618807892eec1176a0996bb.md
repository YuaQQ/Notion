# Introduction to LaTeX

[Source Page](Introduction%20to%20LaTeX%2026320bc76618807892eec1176a0996bb.md)

# What is LaTeX

---

**LaTeX** is a tool for typesetting professional-looking documents. However, LaTeX’s mode of operation is quite different to many other document-production applications you may have used, such as Microsoft Word or LibreOffice Writer: those  tools provide users with an interactive page into which they type and edit their text and apply various forms of styling. LaTeX works very differently: instead, your document is a plain text file interspersed with LaTeX *commands* used to express the desired (typeset) results. 

To produce a visible, typeset document, your LaTeX file is processed by a piece of software called a *TeX engine* which uses the commands embedded in your text file to guide and control the typesetting process, converting the LaTeX commands and document text into a professionally typeset **PDF** file. This means you only need to focus on the *content* of your document and the computer, via LaTeX commands and the TeX engine, will take care of the *visual appearance* (formatting).

# Why learn LaTeX?

### LaTeX can:

- Typeset EXTREMELY complex mathematics, tables and technical content for the physical sciences
- Help you with footnotes, cross-referencing and manage bibliographies
- Be highly customizable for bespoke document production due to its intrinsic programmability and extensibility through thousands of [free add-on packages](https://www.ctan.org/pkg).

### LaTeX separates your document style from document content.

- Once you have written the content of your document, its appearance can be changed with ease.
- You can create a LaTeX file which defines the layout/style of a particular document type and that file can be used as a *template* to standardise authorship/production of additional documents of that type.
- One the online LaTeX editor [Overleaf](https://www.overleaf.com/), there is a [gallery containing thousands of templates](https://www.overleaf.com/gallery), covering an enormous range of document types—everything from scientific articles, reports and books to CVs and presentations. Because these templates define the layout and style of the document, authors need only to open them in Overleaf—creating a new project—and commence writing to add their content.

# Writing your first piece of LaTeX

### Step 1: Creating a new LaTeX project in [Overleaf](https://www.notion.so/25f20bc766188160a485e356aa44920d?pvs=21)

```latex
\documentclass{article}
\begin{document}
First document. This is a simple example, with no extra parameters or packages included.
\end{document}
```

[Open this example in Overleaf.](https://www.overleaf.com/docs?engine=pdflatex&snip_name=Simplest+working+example+LaTeX+document&snip=%5Cdocumentclass%7Barticle%7D%0A%5Cbegin%7Bdocument%7D%0AFirst+document.+This+is+a+simple+example%2C+with+no+%0Aextra+parameters+or+packages+included.%0A%5Cend%7Bdocument%7D)

In LaTeX, we use **%** at the beginning of the lines of comments. Let’s see in a modified version of the example above, what each line does for us.

```latex
\documentclass{article} 
% declares the document type known as its class, which controls the overall appearance of the document. Different types of documents require different classes; i.e., a CV/resume will require a different class than a scientific paper which might use the standard LaTeX article class.

\begin{document}
% Everything to be shown in the document starts here, including titles, abstract, introduction, results, etc. 

First document. This is a simple example, with no extra parameters or packages included.

\end{document}
% Everything to be shown in the document ends here. i.e. commands for formatting the bibliography must be situated above this command.
```

After each change made in Overleaf, we can view the resulting typeset PDF by recompiling the document. Hit the green `Recompile` button on the top-left corner of the right part of screen to do this.

Any Overleaf project can be configured to recompile automatically each time it is edited: click the small arrow next to the Recompile button and set Auto Compile to On, as shown in the following screengrab:

![image.png](Introduction%20to%20LaTeX/image.png)

### Step 2: Add the preamble of a document

Everything in your `.tex` file (The form of LaTeX code document) appearing *before*  the `\begin{document}` command  is called the ***preamble***, which acts as the document’s “setup” section. 

Within the preamble you define the document class (type) together with specifics such as languages to be used when writing the document; loading packages you would like to use (more on this later), and it is where you’d apply other types of configuration.

Below shows an example of preamble:

```latex
\documentclass[12pt, letterpaper]{article} 
% declares the document type known as its class, which controls the overall appearance of the document
% [fontsize, papersize] 
% if font size is not specified, the default size is 10pt
% paper size: a4paper, legalpaper

\usepackage{graphicx}
% Loading an external package to enable LaTeX to import external graphic files for generation of figures.

\graphicspath{{images/}}
% Images uploaded to images/
```

### Step 3: Including title, author and date information in your preamble

```latex
\documentclass[12pt, letterpaper]{article} 
% declares the document type known as its class, which controls the overall appearance of the document
% [fontsize, papersize] 
% if font size is not specified, the default size is 10pt
% paper size: a4paper, legalpaper

\title{My first Latex document}
% the document title

\author{Hubert Farnsworth}
% here you write the name of the author(s)

%% optionally add "thank an institution"
\author{Caracal the \textbf{Genius}\thanks{Funded by the Overleaf team.}}
%% can be added after the name of the author, inside the braces of the author command. It will add a superscript and a footnote with the text inside the braces. Useful if you need to thank an institution in your article.

\date{September 2025} % enter the date manually
%or
\date{\today} % typeset the current date every time the document is compliled

\usepackage{amsmath}
% For the equation* environment

\usepackage{graphicx}
\graphicspath{{images/}}
% For figures
% Images uploaded to images/
```

### Step 4: Typesetting the title, author and date using the `\maketitle` command within the body of the document

```latex
\documentclass[12pt, letterpaper]{article} 
\title{My first Latex document}
\author{Caracal the \textbf{Genius}\thanks{Funded by the Overleaf team.}}
\date{\today} 
\usepackage{graphicx}
\graphicspath{{images/}}

\begin{document}

\maketitle
% To typeset the title, author and date within the body of the document

\end{document}
```

### Step 5: Introduce sections of your essays into the body of the document using corresponding commands

```latex
\documentclass[12pt, letterpaper]{article} 
\title{My first Latex document}author{Hubert Farnsworth}
\author{Caracal the \textbf{Genius}\thanks{Funded by the Overleaf team.}}
\date{\today} % typeset the current date every time the document is compliled
\usepackage{graphicx}
\graphicspath{{images/}}

\begin{document}

\maketitle

\begin{abstract}
    This is an abstract!
\end{abstract}

\section{introduction}
\hspace*{\parindent}Here shows the body of introduction!
% \hspace*{\parindent} forcifully introduces indent at the beginning of the introduction paragraphs.

\section{Results}
\hspace*{\parindent} First document. This is a \textbf{simple} example, with \underline{no additional} parameters or packages included. Now \emph{I} have added \textit{more} text and need to recompile the document. 
% Introduce indent in the first paragraph under a section name.
% \textbf{}: bold
% \underline{}: underline
% \texitit{}: italic
% \textbf{\textit{}}: bold + italic

\end{document}
```