-- =========================================
-- TABELA: tatuador
-- =========================================
CREATE TABLE tatuador (
    ID_tatuador INT NOT NULL AUTO_INCREMENT,
    projetos_disp MEDIUMBLOB,
    projetos_feito MEDIUMBLOB,
    estilo_arte VARCHAR(20) DEFAULT NULL,
    nome_tatuador VARCHAR(30) DEFAULT NULL,
    Tempo_tatuagem DATE DEFAULT NULL,
    
    PRIMARY KEY (ID_tatuador)
) ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;


-- =========================================
-- TABELA: cliente
-- =========================================
CREATE TABLE cliente (
    ID_CLIENTE INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    REDE_SOCIAL VARCHAR(15) DEFAULT NULL,
    TELEFONE DECIMAL(11,0) NOT NULL,
    DATA_NASCIMENTO DATE NOT NULL,

    PRIMARY KEY (ID_CLIENTE)
) ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;


-- =========================================
-- TABELA: agendamento
-- =========================================
CREATE TABLE agendamento (
    ID_agendamento INT NOT NULL AUTO_INCREMENT,
    id_tatuador INT NOT NULL,
    data DATE DEFAULT NULL,
    hora TIME DEFAULT NULL,
    sinal MEDIUMBLOB,

    PRIMARY KEY (ID_agendamento),
    KEY id_tatuador (id_tatuador),

    CONSTRAINT fk_id_tatuador_2
        FOREIGN KEY (id_tatuador)
        REFERENCES tatuador (ID_tatuador)
) ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;


-- =========================================
-- TABELA: ficha_anamnese
-- =========================================
CREATE TABLE ficha_anamnese (
    ID_ficha INT NOT NULL AUTO_INCREMENT,
    ID_tatuador INT NOT NULL,
    ID_cliente INT NOT NULL,
    autorizacao_cliente ENUM('sim','Não') DEFAULT NULL,
    como_conheceu ENUM('instagram','amigo','outros') DEFAULT NULL,

    PRIMARY KEY (ID_ficha),
    KEY ID_tatuador (ID_tatuador),
    KEY ID_cliente (ID_cliente),

    CONSTRAINT fk_id_cliente_1
        FOREIGN KEY (ID_cliente)
        REFERENCES cliente (ID_CLIENTE),

    CONSTRAINT fk_id_tatuador_1
        FOREIGN KEY (ID_tatuador)
        REFERENCES tatuador (ID_tatuador)
) ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;


-- =========================================
-- TABELA: tatuagem
-- =========================================
CREATE TABLE tatuagem (
    ID_tatuagem INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_tatuador INT NOT NULL,
    local_pele VARCHAR(15) NOT NULL,
    Tamanho DECIMAL(4,2) DEFAULT NULL,
    Referencia MEDIUMBLOB,
    estilo_tatuagem VARCHAR(20) DEFAULT NULL,

    PRIMARY KEY (ID_tatuagem),
    KEY id_cliente (id_cliente),
    KEY id_tatuador (id_tatuador),

    CONSTRAINT fk_id_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente (ID_CLIENTE),

    CONSTRAINT fk_id_tatuador
        FOREIGN KEY (id_tatuador)
        REFERENCES tatuador (ID_tatuador)
) ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;


-- =========================================
-- TABELA: realiza
-- =========================================
CREATE TABLE realiza (
    ID_realiza INT NOT NULL AUTO_INCREMENT,
    ID_cliente INT NOT NULL,
    ID_agendamento INT NOT NULL,

    PRIMARY KEY (ID_realiza),
    KEY ID_cliente (ID_cliente),
    KEY ID_agendamento (ID_agendamento),

    CONSTRAINT fk_id_agendamento
        FOREIGN KEY (ID_agendamento)
        REFERENCES agendamento (ID_agendamento),

    CONSTRAINT fk_ID_cliente_r
        FOREIGN KEY (ID_cliente)
        REFERENCES cliente (ID_CLIENTE)
) ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;
