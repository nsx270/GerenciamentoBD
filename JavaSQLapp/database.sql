CREATE DATABASE aula_ioo;

CREATE TABLE produto(
  id SERIAL,
  descricao VARCHAR(50),
  preco DOUBLE PRECISION
);

INSERT INTO produto (descricao, preco) VALUES ('computador', 500);

select * from produto;
	
