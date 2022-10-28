create database biblioteca;
use biblioteca;

create table cliente(
	IdCliente int auto_increment not null,
    NomeCliente varchar(50),
    email varchar(30),
    constraint Pk_IdCliente primary key (idCliente)
)
Engine = InnoDB;

create table autor(
	IdAutor int auto_increment not null,
    NomeAutor varchar(55) not null,
    Endereco varchar(100) not null,
    Lougradouro varchar(30) not null,
    Numero int not null,
    Cep varchar(11) not null,
    DataNascimento date not null,
    PaisOrigem varchar(40) not null,
    constraint Pk_IdAutor primary key (IdAutor)
)
Engine = InnoDB;

drop table autor;

create table compra(
	IdCompra int auto_increment not null,
    DataCompra date not null,
    TotalCompra double not null,
    IdCliente int not null,
    IdLivro int not null,
    constraint Pk_IdCompra primary key (IdCompra),
    constraint Fk_IdCliente foreign key (IdCliente)
		references cliente (IdCliente),
	constraint Fk_IdLivro foreign key (IdLivro)
        references livro (IdLivro)
)
Engine = InnoDB;

create table livro(
	IdLivro int auto_increment not null,
    Titulo varchar(70),
    TipoCapa varchar(40),
    Genero varchar(80),
    Valor double,
    constraint Pk_IdLivro primary key (IdLivro)
)
engine = InnoDB;

create table avaliacao(
	IdAvaliacao int auto_increment not null,
    DescricaoAvaliacao varchar(50),
    IdCliente int not null,
    IdLivro int not null,
    constraint Pk_IdAvaliacao primary key (IdAvaliacao),
    constraint Fk_IdCliente_Avaliacao foreign key (IdCliente)
			references cliente (IdCliente),
	constraint Fk_IdLivro_Avaliacao foreign key (IdLivro)
			references livro (IdLivro)
)
engine = InnoDB;

create table editora(
	IdEditora int auto_increment not null,
    NomeEditora varchar(70) not null,
    Telefone varchar(50) not null,
    Celular varchar(50) not null,
    DataPublicacao date not null,
    constraint Pk_IdEditora primary key (IdEditora)
)
engine = InnoDB;

create table Obra(
	IdObra int auto_increment not null,
    IdAutor int not null,
    IdLivro int not null,
    constraint Pk_IdObra primary key (IdObra),
    constraint Fk_IdAutor_Obra foreign key (IdAutor)
			references autor (IdAutor),
	constraint Fk_IdLivro_Obra foreign key (IdLivro)
			references livro (IdLivro)
)
engine = InnoDB;

create table Publicacao(
	IdPublicacao int auto_increment not null,
    IdEditora int not null,
    IdLivro int not null,
    constraint Pk_IdPublicacao primary key (IdPublicacao),
    constraint Fk_IdEditora_Publicacao foreign key (IdEditora)
			references Editora (IdEditora),
	constraint Fk_IdLivro_Publicacao foreign key (IdLivro)
			references Livro (IdLivro)
)
engine = InnoDB;