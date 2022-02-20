DROP TABLE IF EXISTS carro;
DROP TABLE IF EXISTS favorito;
CREATE TABLE carro(id INTEGER PRIMARY KEY, tipo TEXT, nome TEXT, descricao TEXT, urlFoto TEXT, urlVideo TEXT, latitude TEXT, longitude TEXT);
CREATE TABLE favorito (id INTEGER PRIMARY KEY, nome TEXT);