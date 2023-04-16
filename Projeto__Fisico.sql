/* projeto_Fisico.sql: */

CREATE TABLE Cliente (
    idCliente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    Telefone VARCHAR(11),
    CPF VARCHAR(11) UNIQUE,
    dataNascimento DATE,
    email VARCHAR(45),
    Logradouro VARCHAR(45),
    numero VARCHAR(45),
    complemento VARCHAR(45),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    estado CHAR(2)
);

CREATE TABLE Venda (
    idVenda INTEGER PRIMARY KEY,
    dataVenda DATE NOT NULL,
    valor DOUBLE NOT NULL,
    fk_cliente INTEGER,
    fk_funcionario INTEGER,
    CONSTRAINT FK_CLIENTE_ FOREIGN KEY (fk_cliente) REFERENCES Cliente(idCliente),
    CONSTRAINT FK_FUNCIONARIO_ FOREIGN KEY(fk_funcionario) REFERENCES Funcionario(idFuncionario) 
);

CREATE TABLE Produto (
    idProduto INTEGER PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    valorUnitario VARCHAR(45) NOT NULL,
    desconto DOUBLE,
    qtd_estoque INTEGER NOT NULL,
    fk_fornecedor INTEGER,
    fk_venda INTEGER,
    CONSTRAINT FK_FORNECEDOR_ FOREIGN KEY(fk_fornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT FK_VENDA_ FOREIGN KEY (fk_venda) REFERENCES Venda (idVenda)
);

CREATE TABLE Funcionario (
    idFuncionario INTEGER PRIMARY KEY,
    email VARCHAR(45) NOT NULL,
    senha INTEGER NOT NULL,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    matricula VARCHAR(45) UNIQUE NOT NULL,
    salario DOUBLE NOT NULL
);

CREATE TABLE Caixa (
    idPagamento INTEGER PRIMARY KEY,
    tipoPagamento VARCHAR(45),
    qtd_parcela INTEGER,
    fk_venda INTEGER,
    CONSTRAINT FK_VENDA_2 FOREIGN KEY (fk_venda) REFERENCES Venda (idVenda)
);

CREATE TABLE Fornecedor (
    idFornecedor INTEGER PRIMARY KEY,
    nome VARCHAR(45),
    Telefone VARCHAR(11),
    logradouro VARCHAR(45),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    estado CHAR(2)
);
