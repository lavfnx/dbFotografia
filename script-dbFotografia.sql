create database dbFotografia;   
 use dbFotografia;


create table usuarios (
	idUsuario int primary key auto_increment,
	nomeUsuario varchar(50) not null,
	emailUsuario varchar(50) not null unique,
	senhaUsuario varchar(255)not null
	);


create table endereco(
    idEndereco int primary key auto_increment,
	cep varchar(9) not null,
	endereco varchar(255),
	numero varchar(10),
	complemento varchar(255),
	bairro varchar(40),
	cidade varchar(40),
	estado varchar(2)
);

create table profissionais (
	idProfissional int primary key auto_increment,
    especialidade varchar(255) not null,
    bio text,
    whatsapp varchar(255),
	instagram varchar(255),
	twitter varchar(255),
	telefone varchar(20) not null,
    disponibilidade enum ('Manhã','Tarde', 'Noite', 'Todos'),
    idEndereco int not null,
    idUsuario int not null,
    foreign key (idUsuario) references usuarios(idUsuario),
	FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco)
);


create table seguidores (
	id int primary key auto_increment,
    idSeguidor int, # quem está seguindo
	idSeguido int,  # quem é seguido (profissional)
	FOREIGN KEY (idSeguidor) REFERENCES usuarios (idUsuario),
    FOREIGN KEY (idSeguido) REFERENCES profissionais (idProfissional)

);

create table post (
	idPost int primary key auto_increment,
    nomePost varchar(50),
    capaPost text,
    especialidade varchar(50),
    dataPost date,
    foto1 text,
    foto2 text,
    foto3 text,
    foto4 text,
    foto5 text,
    foto6 text,
    foto7 text,
    foto8 text,
    foto9 text,
    foto10 text,
    idProfissional int not null,
    foreign key (idProfissional) references profissionais(idProfissional)
);

create table avaliacao (
idAvaliacao int primary key auto_increment,
idPost int,
idUsuario int,
avaliacao int,
foreign key (idPost) references post(idPost),
foreign key (idUsuario) references usuarios(idUsuario)
);

