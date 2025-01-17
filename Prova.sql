CREATE database if not exists prova;

use prova;

create table if not exists autores(
autor int primary key,
nome varchar(50) not null,
nacionalidade varchar(30) not null 
);

CREATE TABLE IF NOT EXISTS EDITORAS(
ID_EDIT INT PRIMARY KEY,
NOME_EDIT VARCHAR(30) NOT NULL,
LOCAL_EDIT VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS CLIENTES(
CPF VARCHAR(15) PRIMARY KEY,
NOME_CLEINTE VARCHAR(50)
); 

CREATE TABLE IF NOT EXISTS LIVROS(
ISBN_LIVRO VARCHAR(15) PRIMARY KEY NOT NULL,
TITULO VARCHAR(50) NOT NULL,
ANO_PUBLI YEAR NOT NULL,
EDITORA_LIVRO INT NOT NULL,
CONSTRAINT FK_ID_EDITORA FOREIGN KEY (EDITORA_LIVRO) REFERENCES EDITORAS(ID_EDIT)
);

CREATE TABLE IF NOT EXISTS EMPRESTIMOS(
ID_EMPRESTIMOS INT PRIMARY KEY NOT NULL,
DATA_EMP DATE NOT NULL,
DATA_DEV DATE NOT NULL,
ID_CLIENTE VARCHAR(15) NOT NULL,
CONSTRAINT FK_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(CPF)
);

CREATE TABLE IF NOT EXISTS LIVROS_EMPRESTIMOS(
EMPRESTIMO INT NOT NULL,
LIVRO VARCHAR(15),
PRIMARY KEY (EMPRESTIMO,LIVRO),
CONSTRAINT FK_EMPRE FOREIGN KEY (EMPRESTIMO) REFERENCES EMPRESTIMOS (ID_EMPRESTIMOS),
CONSTRAINT FK_LIVRO FOREIGN KEY (LIVRO) REFERENCES LIVROS(ISBN_LIVRO)
);