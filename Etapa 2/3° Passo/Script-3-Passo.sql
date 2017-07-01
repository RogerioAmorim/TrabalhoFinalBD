use museu;

-- I ----------------------------------------------------------

insert into museu.artista(data_nasc, nome, pais, estilo_principal) values('20/04/1980', 'João', 'Brasil', 'Barroco');
insert into museu.artista(data_nasc, nome, data_falecimento, pais, estilo_principal) values('20/04/1940', 'Maria Alencar', '17/08/2008', 'Brasil', 'Futurismo');
insert into museu.artista(data_nasc, nome, data_falecimento, pais, estilo_principal) values('20/04/1928', 'Allejandro Gaspar', '21/02/1993', 'Argentina', 'Cubismo');
insert into museu.artista(data_nasc, nome, pais, estilo_principal) values('30/01/1960', 'Marilia', 'Chile', 'Fauvismo');
insert into museu.artista(data_nasc, nome, pais, estilo_principal) values('02/07/1950', 'Josué', 'Brasil', 'Expressionismo');

-- III  --------------------------------------------------------
-- Esse passo será executado antes já que passo II depende dele. --

insert into museu.exposicao(nome, data_inicial, data_final) values('Expopsição 1', '20/04/2017', '30/04/2017');
insert into museu.exposicao(nome, data_inicial, data_final) values('Expopsição 2', '15/05/2017', '20/05/2017');

-- II ----------------------------------------------------------

-- Esse passo depende de um acervo já existir --

insert into museu.acervo(data_aquisicao, custo, fonte_vendedora, estado_exposto) values('14/01/2017', 2000.5, 'Fonte 1', 'Disponível');

-- ESCULTURA --

-- 1 --
Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('Vênus de Milo', 'Estilo 1', 1998, 'Escultura Vênus de Milo', 1, 1, 1);
insert into museu.escultura(altura, largura, peso, material_principal, id_Objeto) values(1.80, 0.5, 90, 'Argila', LAST_INSERT_ID());
Commit;

-- 2 --

Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('O Pensador', 'Estilo 2', 1999, 'Escultura O Pensador', 1, 1, 1);
insert into museu.escultura(altura, largura, peso, material_principal, id_Objeto) values(2.50, 0.6, 150, 'Argila', LAST_INSERT_ID());
Commit;

-- 3 --

Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('Lady Justiça', 'Estilo 1', 1949, 'Escultura Lady Justiça', 1, 1, 1);
insert into museu.escultura(altura, largura, peso, material_principal, id_Objeto) values(1.60, 0.5, 100, 'Argila', LAST_INSERT_ID());
Commit;

-- PINTURA --

-- 1 --

Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('Monalisa', 'Estilo 8', 1970, 'Pintura Monalisa', 5, 1, 2);
insert into museu.pintura(dimensoes, tipo_moldura, id_Objeto) values('0.5 x 0.2', 'Laca', LAST_INSERT_ID());
Commit;

-- 2 --

Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('A noite estrelada', 'Estilo 7', 1978, 'Pintura A noite estrelada', 5, 1, 2);
insert into museu.pintura(dimensoes, tipo_moldura, id_Objeto) values('0.5 x 0.2', 'Decape Policromia', LAST_INSERT_ID());
Commit;

-- 3 --

Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('O Grito', 'Estilo 5', 1983, 'Pintura O Grito', 4, 1, 2);
insert into museu.pintura(dimensoes, tipo_moldura, id_Objeto) values('0.5 x 0.2', 'Madeira', LAST_INSERT_ID());
Commit;

-- 4 --

Start Transaction;
insert into museu.objeto(titulo, estilo, ano_criacao, descricao, id_Artista, id_Acervo, id_Exposicao) values('A última ceia', 'Estilo 5', 1970, 'Pintura A última ceia', 2, 1, 2);
insert into museu.pintura(dimensoes, tipo_moldura, id_Objeto) values('0.5 x 0.2', 'Metal', LAST_INSERT_ID());
Commit;

-- ESTATUA --

-- 1 --

insert into museu.estatua(nome_homenageado, id_Escultura) values('Maria', 1);

-- 2 --

insert into museu.estatua(nome_homenageado, id_Escultura) values('João', 2);

-- 3 --

insert into museu.estatua(nome_homenageado, id_Escultura) values('Antonia', 3);

-- IV --------------------------------------------------------

update museu.artista set data_falecimento = '09/11/2010' where id_Artista = 4;
update museu.artista set data_falecimento = '11/03/2015' where id_Artista = 5;


-- V ---------------------------------------------------------

select * from museu.objeto where id_Exposicao = 1 OR id_Exposicao = 2;


-- VI ---------------------------------------------------------

select * from museu.objeto where objeto.id_Artista = (select (id_Artista) from museu.artista where nome = 'Josué'); 