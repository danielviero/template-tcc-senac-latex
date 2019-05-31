%% Extensão do estilo abnTeX2 (https://github.com/abntex/abntex2) para 
%% TCC de pós-graduação EAD do Centro Universitário Senac.
%% Desenvolvido para uso específico por Daniel de Mello Viero em maio/2019.

%% Este arquivo de classe e o template estão disponíveis para quem quiser usar,
%% mas talvez não se aplique a todos os casos. Está aberto para aprimoramento 
%% pelos interessados. Eu não tenho profundo conhecimento em Latex, sugiro 
%% consultar a ótima documentação em https://github.com/abntex/abntex2 
%% (que eu usei para criar esta customização).

%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Daniel Viero <daniel.viero@gmail.com>.
%%
%% Further information about abnTeX2 are available on https://github.com/abntex/abntex2.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{senac-tcc}[2019/02/18 v1.0 Modelo de TCC do Centro Universitário SENAC baseado em abnTeX2]

%
% Repassa todos os parametros a classe abntex2, 
%
\PassOptionsToClass{
	% -- opções da classe memoir --
	12pt,				% tamanho da fonte
%	openright,			% capítulos começam em pág ímpar (insere página vazia caso preciso)
	twoside,			% para impressão em verso e anverso. Oposto a oneside
	a4paper,			% tamanho do papel. 
	% -- opções da classe abntex2 --
	chapter=TITLE,		% títulos de capítulos convertidos em letras maiúsculas
	% -- opções do pacote babel --
	english,			% idioma adicional para hifenização
%	spanish,			% idioma adicional para hifenização
	brazil				% o último idioma é o principal do documento
}{abntex2}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}

% ---
% Pacotes básicos 
% ---
\usepackage{lmodern}			% Usa a fonte Latin Modern			
\usepackage[T1]{fontenc}		% Selecao de codigos de fonte.
\usepackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
\usepackage{lastpage}			% Usado pela Ficha catalográfica
\usepackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\usepackage{color}				% Controle das cores
\usepackage{graphicx}			% Inclusão de gráficos
\usepackage{microtype} 			% para melhorias de justificação
% ---

% ---
% Pacotes de citações
% ---
\usepackage[brazilian,hyperpageref]{backref}	 % Paginas com as citações na bibl
\usepackage[alf]{abntex2cite}	% Citações padrão ABNT

% ---
% Ajustes nos comandos de dados com regras específicas do SENAC EAD
% ---
% Mudança da denominação "Orientador" para "Mediador"
\renewcommand{\orientadorname}{Mediador(a):}

% Novos comandos para o nome dos examinadores na folha de rosto temporária
\providecommand{\imprimirexaminadorum}{}
\providecommand{\imprimirexaminadordois}{}
\newcommand{\examinadores}[2]{
    \renewcommand{\imprimirexaminadorum}{#1}
    \renewcommand{\imprimirexaminadordois}{#2}
}

% Novo comando para indicar e imprimir o nome do campus
\providecommand{\imprimircampus}{}
\newcommand{\campus}[1]{\renewcommand{\imprimircampus}{#1}}

% Novo comando para indicar e imprimir o nome do pólo
\providecommand{\imprimirpolo}{}
\newcommand{\polo}[1]{\renewcommand{\imprimirpolo}{#1}}

% Novo comando para indicar e imprimir o nome do curso
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

% Novo comando para indicar e imprimir o complemento ao preâmbulo
\providecommand{\imprimircomplementopreambulo}{}
\newcommand{\complementopreambulo}[1]{\renewcommand{\imprimircomplementopreambulo}{#1}}

% ---
% Espaço após título de capítulo ou seção = 1 linha
% Guia de normatização item 3.2.3
% ---
\setlength{\afterchapskip}{\baselineskip}
%\setbeforesecskip{\baselineskip}
%\setbeforesubsecskip{\baselineskip}
%\setbeforesubsubsecskip{\baselineskip}

% ---
% Títulos de capítulos e seções com fonte e tamanho normais
% Guia de normatização itens 3.2.2 e 3.2.5
% ---
\renewcommand{\ABNTEXchapterfont}{\bfseries} %{\sffamily}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize} %{\Huge}

\renewcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize} %{\Large}

\renewcommand{\ABNTEXsubsectionfont}{} %{\ABNTEXsectionfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize} %{\large}

\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% ---
% Dados fixos para CAPA e FOLHA DE ROSTO
% ---
\instituicao{Centro Universitário Senac}
\tipotrabalho{Trabalho de Conclusão de Curso}
\preambulo{\imprimirtipotrabalho{} apresentado ao \imprimirinstituicao{}~-- Campus \imprimircampus{}, como exigência parcial para obtenção do grau de Especialista em \imprimircurso{}.}
\complementopreambulo{Este Trabalho foi desenvolvido nas disciplinas Trabalho de Conclusão de Curso I, II e III e mediado pelo(a) Professor(a) \imprimirorientador{}.}

% ---
% Capa
% Guia de Normatização item 3.1.1.1
% ---
\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \center
    \MakeTextUppercase{\imprimirinstituicao{}} 
    \par 
    \MakeTextUppercase{\imprimircampus{}}
    
    \vspace*{2cm}
    
    {\bfseries\imprimirautor}

    \vfill
    \begin{center}
    \bfseries\large\MakeTextUppercase{\imprimirtitulo}
    \end{center}
    \vfill
    
    \imprimirlocal
    
    \imprimirdata
    
    \vspace*{1cm}
  \end{capa}
}

% ---
% Folha de rosto 
% Guia de Normatização item 3.1.1.2
% ---
\renewcommand{\folhaderostocontent}{%
    \begin{center}
    
    {\bfseries\imprimirautor}
    
    \vspace*{\fill}
    
    \begin{center}
    \bfseries\large\MakeTextUppercase{\imprimirtitulo}
    \end{center}
    
    \vspace*{\fill}
    
    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      \SingleSpacing
      \imprimirpreambulo
      \par
      \imprimircomplementopreambulo
      \end{minipage}%
      \vspace*{\fill}
    }%
    
    %{\large\imprimirorientadorRotulo~\imprimirorientador\par}
    
    %\abntex@ifnotempty{\imprimircoorientador}{%
    %  {\large\imprimircoorientadorRotulo~\imprimircoorientador}%
    %}%
    
    \vspace*{\fill}
    
    \imprimirlocal
    
    \par
    
    \imprimirdata
    \vspace*{1cm}
    \end{center}
}

% ---
% Folha de aprovação temporária, conforme modelo do SENAC.
% ---
\newcommand{\imprimirfolhadeaprovacaotemporaria}{%
    \begin{folhadeaprovacao}
        {\large\imprimirautor}
        \vspace*{\fill}
    
        \hspace{.35\textwidth}
        \begin{minipage}{.5\textwidth}
            {\bfseries\large\imprimirtitulo}
            \vskip 2cm
            \imprimirpreambulo
            \vskip 1cm
            \orientadorname{} \imprimirorientador
        \end{minipage}%
        \vspace*{\fill}
    
       A banca examinadora dos Trabalhos de Conclusão, em sessão pública realizada em \_\_/\_\_/\_\_ , considerou o candidato: 

       \assinatura{\textbf{\imprimirexaminadorum} \\ Examinador(a)}
       \assinatura{\textbf{\imprimirexaminadordois} \\ Examinador(a)}
       \assinatura{\textbf{\imprimirorientador} \\ Presidente} 
       \vspace*{\fill}
    \end{folhadeaprovacao}
}

% --- 
% CONFIGURAÇÕES DE PACOTES
% --- 

% ---
% Configurações do pacote backref
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
	\fi}%
% ---

