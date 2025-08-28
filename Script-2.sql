create database db_revenda_joaogabriel;

create table endereco(
endereco_id serial primary key,
localidade varchar (100) not null,
uf char(2) not null,
cep char(8) not null,
bairro varchar(100) not null,
numero char(6) not null
);

create table usuario(
usuario_id serial primary key,
nome varchar(50) not null,
cpf char(8) not null unique,
telefone char(9) not null, 
email varchar(255),
endereco_id int, foreign key (endereco_id) references endereco(endereco_id)
);

create table produto(
produto_id serial primary key,
cor varchar(255),
largura numeric(5, 2),
altura numeric(5, 2),
profundidade numeric(5, 2),
nome varchar(255) not null,
descricao varchar(255) not null,
jogos varchar(255),
pedido_id int
);

create table pedido(
pedido_id serial primary key,
produto_id int, foreign key (produto_id) references produto(produto_id),
endereco_id int, foreign key (endereco_id) references endereco(endereco_id),
pagamento_id int, foreign key (pagamento_id) references pagamento(pagamento_id)
);

create table pagamento(
pagamento_id serial primary key,
pix int,
boleto_id int, foreign key (boleto_id) references boleto(boleto_id),
pix_id int,foreign key (pix_id) references pix(pix_id)
);

create table boleto(
boleto_id serial primary key,
nome varchar(200) not null
);

create table pix(
pix_id serial primary key,
chave varchar(20) not null
);

INSERT INTO endereco (endereco_id, localidade, uf, cep, bairro, numero) VALUES 
(1, 'Rua dos Trabalhadores', 'SP', '12345678', 'Vila Industrial', '100'),
(2, 'Avenida Brasil', 'RJ', '23456789', 'Copacabana', '200'),
(3, 'Rua Nova', 'MG', '34567890', 'Centro', '300'),
(4, 'Rua do Comércio', 'BA', '45678901', 'Pelourinho', '400'),
(5, 'Rua das Flores', 'RS', '56789012', 'Cidade Baixa', '500'),
(6, 'Avenida Paulista', 'SP', '67890123', 'Bela Vista', '600'),
(7, 'Rua 7 de Setembro', 'PR', '78901234', 'Centro', '700'),
(8, 'Rua do Sol', 'CE', '89012345', 'Beira Mar', '800'),
(9, 'Rua das Palmeiras', 'PE', '90123456', 'Boa Viagem', '900'),
(10, 'Rua do Saber', 'GO', '01234567', 'Setor Central', '1000');

INSERT INTO usuario (nome, cpf, telefone, email, endereco_id) VALUES 
('João Gabriel', '12345678', '912345678', 'joao@revenda.com', 1),
('Maria Silva', '23456789', '913456789', 'maria@revenda.com', 2),
('Carlos Souza', '34567890', '914567890', 'carlos@revenda.com', 3),
('Fernanda Oliveira', '45678901', '915678901', 'fernanda@revenda.com', 4),
('Luiz Fernando', '56789012', '916789012', 'luiz@revenda.com', 5),
('Ana Carolina', '67890123', '917890123', 'ana@revenda.com', 6),
('Roberto Alves', '78901234', '918901234', 'roberto@revenda.com', 7),
('Patrícia Costa', '89012345', '919012345', 'patricia@revenda.com', 8),
('Ricardo Lima', '90123456', '920123456', 'ricardo@revenda.com', 9),
('Juliana Pereira', '01234567', '921234567', 'juliana@revenda.com', 10);

INSERT INTO produto (produto_id, cor, largura, altura, profundidade, nome, descricao, jogos, pedido_id) VALUES 
(1, 'Preto', 10.5, 15.2, 8.3, 'Console PS5', 'Console de última geração', 'FIFA 22, God of War', 1),
(2, 'Branco', 8.2, 12.0, 6.5, 'Xbox Series X', 'Console com gráficos 4K', 'Halo Infinite, Forza Horizon', 2),
(3, 'Azul', 14.0, 20.0, 10.0, 'Notebook Dell', 'Notebook para gamers', 'League of Legends, PUBG', 3),
(4, 'Vermelho', 6.5, 7.2, 5.1, 'Fone de Ouvido', 'Fones com cancelamento de ruído', 'The Last of Us Part II', 4),
(5, 'Verde', 25.0, 30.0, 15.0, 'Monitor 4K', 'Monitor para gaming', 'Cyberpunk 2077', 5),
(6, 'Cinza', 8.5, 10.5, 7.2, 'Teclado Mecânico', 'Teclado com iluminação RGB', 'Minecraft, Call of Duty', 6),
(7, 'Amarelo', 6.0, 10.0, 4.5, 'Controle PS5', 'Controle com feedback adaptativo', 'Spider-Man: Miles Morales', 7),
(8, 'Preto', 3.2, 5.8, 2.0, 'Mouse Gamer', 'Mouse com DPI ajustável', 'Fortnite', 8),
(9, 'Prata', 15.0, 18.0, 12.5, 'Smartphone iPhone 12', 'Celular topo de linha', 'Call of Duty Mobile', 9),
(10, 'Azul Claro', 12.0, 16.0, 9.0, 'Câmera Digital', 'Câmera para fotógrafos iniciantes', 'Não aplica', 10);

INSERT INTO pedido (produto_id, endereco_id, pagamento_id) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

INSERT INTO pagamento (pagamento_id, pix, boleto_id, pix_id) VALUES 
(1, 123456789, 1, 1),
(2, 234567890, 2, 2),
(3, 345678901, 3, 3),
(4, 456789012, 4, 4),
(5, 567890123, 5, 5),
(6, 678901234, 6, 6),
(7, 789012345, 7, 7),
(8, 890123456, 8, 8),
(9, 901234567, 9, 9),
(10, 123450987, 10, 10);

INSERT INTO boleto (nome) VALUES 
('Boleto João Gabriel'),
('Boleto Maria Silva'),
('Boleto Carlos Souza'),
('Boleto Fernanda Oliveira'),
('Boleto Luiz Fernando'),
('Boleto Ana Carolina'),
('Boleto Roberto Alves'),
('Boleto Patrícia Costa'),
('Boleto Ricardo Lima'),
('Boleto Juliana Pereira');

INSERT INTO pix (chave) VALUES 
('1234567890'),
('2345678901'),
('3456789012'),
('4567890123'),
('5678901234'),
('6789012345'),
('7890123456'),
('8901234567'),
('9012345678'),
('0123456789');

SELECT * FROM produto;

create view vw_produto_jogos as
select
produto_id,
nome as produto_nome,
cor,
descricao,
jogos
from produto
where jogos is not null and jogos <> '';

create view vw_pedido_cliente_pagamento as
select
pe.pedido_id,
u.nome as cliente_nome,
u.telefone,
case 
when pg.pix is not null then 'pix'
when pg.boleto_id is not null then 'boleto'
else 'outro'
end as forma_pagamento,
pe.produto_id,
pe.endereco_id
from pedido pe
join usuario u on u.endereco_id = pe.endereco_id
join pagamento pg on pe.pagamento_id = pg.pagamento_id;

select * from vw_pedido_cliente_pagamento;

select * from vw_produto_jogos;

alter table endereco
add constraint chk_uf_length check (char_length(uf) = 2),
add constraint chk_cep_length check (char_length(cep) = 8);

alter table produto
add constraint chk_largura_nonnegative check (largura >= 0),
add constraint chk_altura_nonnegative check (altura >= 0),
add constraint chk_profundidade_nonnegative check (profundidade >= 0);

select * from produto where nome like '%PS5%';

explain
select * from produto where nome like '%PS5%'; --explain

create index idx_nome_produto on produto(nome);
select * from produto where nome like '%PS5%';

alter table usuario alter column nome type int;
alter table usuario alter column nome type varchar;
alter table usuario alter column cpf type varchar;

create user joaogabriel with password 'senha123';
grant all privileges on all tables in schema public to joaogabriel;
grant all privileges on all sequences in schema public to joaogabriel;

create user colega with password 'senha1234';
grant select on produto to colega;

select * from produto
select * from pedido p
-- alterar tabelas e realizar o explain no é possivel como 'colega', é necessario ser o dono do banco 

select u.nome, p.nome as produto from usuario u inner join pedido pe on u.endereco_id = pe.endereco_id inner join produto p on pe.produto_id = p.produto_id;

select u.nome, p.nome as produto from usuario u left join pedido pe on u.endereco_id = pe.endereco_id left join produto p on pe.produto_id = p.produto_id;

select u.nome, p.nome as produto from usuario u right join pedido pe on u.endereco_id = pe.endereco_id right join produto p on pe.produto_id = p.produto_id;

select pe.pedido_id, p.nome as produto, pg.pix from pedido pe inner join produto p on pe.produto_id = p.produto_id inner join pagamento pg on pe.pagamento_id = pg.pagamento_id;

select pe.pedido_id, p.nome as produto, pg.pix from pedido pe left join produto p on pe.produto_id = p.produto_id left join pagamento pg on pe.pagamento_id = pg.pagamento_id;

select pe.pedido_id, p.nome as produto, pg.pix from pedido pe right join produto p on pe.produto_id = p.produto_id right join pagamento pg on pe.pagamento_id = pg.pagamento_id;

select u.nome, e.localidade, e.uf from usuario u inner join endereco e on u.endereco_id = e.endereco_id;

select u.nome, e.localidade, e.uf from usuario u left join endereco e on u.endereco_id = e.endereco_id;

select u.nome, e.localidade, e.uf from usuario u right join endereco e on u.endereco_id = e.endereco_id;

select p.nome, pg.pix from produto p inner join pedido pe on p.produto_id = pe.produto_id inner join pagamento pg on pe.pagamento_id = pg.pagamento_id;

select p.nome, pg.pix from produto p left join pedido pe on p.produto_id = pe.produto_id left join pagamento pg on pe.pagamento_id = pg.pagamento_id;

select p.nome, pg.pix from produto p right join pedido pe on p.produto_id = pe.produto_id right join pagamento pg on pe.pagamento_id = pg.pagamento_id;
