CREATE DATABASE IF NOT EXISTS gerenciamento_rec;
USE gerenciamento_rec;
DROP TABLE IF EXISTS base_conhecimento_palavra;
DROP TABLE IF EXISTS comentario_resposta;
DROP TABLE IF EXISTS palavra_chave;
DROP TABLE IF EXISTS base_conhecimento;
DROP TABLE IF EXISTS resposta;
DROP TABLE IF EXISTS duvida;
DROP TABLE IF EXISTS professor_voluntario;
DROP TABLE IF EXISTS aluno;
DROP TABLE IF EXISTS assunto;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    tipo ENUM('aluno', 'professor') NOT NULL
);

CREATE TABLE aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_fk INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_fk) REFERENCES usuario(id)
);

CREATE TABLE professor_voluntario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_fk INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    area_atuacao VARCHAR(100),
    FOREIGN KEY (usuario_fk) REFERENCES usuario(id)
);

CREATE TABLE assunto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE duvida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_fk INT NOT NULL,
    assunto_fk INT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    status ENUM('pendente', 'respondida') DEFAULT 'pendente',
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aluno_fk) REFERENCES aluno(id),
    FOREIGN KEY (assunto_fk) REFERENCES assunto(id)
);

CREATE TABLE resposta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    duvida_fk INT NOT NULL UNIQUE,
    professor_fk INT,
    texto_resposta TEXT NOT NULL,
    data_resposta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (duvida_fk) REFERENCES duvida(id),
    FOREIGN KEY (professor_fk) REFERENCES professor_voluntario(id)
);

CREATE TABLE comentario_resposta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    resposta_fk INT NOT NULL,
    professor_fk INT NOT NULL,
    comentario TEXT NOT NULL,
    data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (resposta_fk) REFERENCES resposta(id),
    FOREIGN KEY (professor_fk) REFERENCES professor_voluntario(id)
);

CREATE TABLE base_conhecimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    resposta_fk INT NOT NULL UNIQUE,
    visibilidade ENUM('publica', 'privada') DEFAULT 'publica',
    FOREIGN KEY (resposta_fk) REFERENCES resposta(id)
);

CREATE TABLE palavra_chave (
    id INT PRIMARY KEY AUTO_INCREMENT,
    termo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE base_conhecimento_palavra (
    base_conhecimento_fk INT,
    palavra_chave_fk INT,
    PRIMARY KEY (base_conhecimento_fk, palavra_chave_fk),
    FOREIGN KEY (base_conhecimento_fk) REFERENCES base_conhecimento(id),
    FOREIGN KEY (palavra_chave_fk) REFERENCES palavra_chave(id)
);

INSERT INTO usuario (email, senha, tipo) VALUES
('joaogabriel@email.com', 'alunoJoaoGabriel4651', 'aluno'),
('mariafernanda@email.com', 'alunoMariaFernanda7382', 'aluno'),
('carloshenrique@email.com', 'alunoCarlosHenrique5138', 'aluno'),
('lucaspereira@email.com', 'alunoLucasPereira9217', 'aluno'),
('beatrizsouza@email.com', 'alunoBeatrizSouza3829', 'aluno'),
('guilhermelima@email.com', 'alunoGuilhermeLima1047', 'aluno'),
('larissamelo@email.com', 'alunoLarissaMelo3812', 'aluno'),
('viniciusramos@email.com', 'alunoViniciusRamos9983', 'aluno'),
('camilaoliveira@email.com', 'alunoCamilaOliveira5531', 'aluno'),
('andresantos@email.com', 'alunoAndreSantos1374', 'aluno'),
('julianaferraz@email.com', 'alunoJulianaFerraz2663', 'aluno'),
('ricardobarros@email.com', 'alunoRicardoBarros7920', 'aluno'),
('marianaalves@email.com', 'alunoMarianaAlves4482', 'aluno'),
('felipecosta@email.com', 'alunoFelipeCosta6093', 'aluno'),
('luanamoura@email.com', 'alunoLuanaMoura3417', 'aluno'),
('felipe@email.com', 'professorFelipe5432', 'professor'),
('marina@email.com', 'professorMarina8765', 'professor'),
('rafael@email.com', 'professorRafael3124', 'professor'),
('isabela@email.com', 'professorIsabela7651', 'professor'),
('joaovictor@email.com', 'professorJoaoVictor4390', 'professor'),
('carlasantos@email.com', 'professorCarlaS1234', 'professor'),
('ricardomendes@email.com', 'professorRicardoS567', 'professor'),
('leticiacampos@email.com', 'professorLeticiaC890', 'professor'),
('danielsouza@email.com', 'professorDanielS345', 'professor'),
('marianaribeiro@email.com', 'professorMarianaR678', 'professor'),
('thiagomartins@email.com', 'professorThiagoM901', 'professor'),
('sergio.historia@email.com', 'profSergioHistoria123', 'professor');


INSERT INTO aluno (usuario_fk, nome) VALUES
(1, 'João Gabriel'),
(2, 'Maria Fernanda'),
(3, 'Carlos Henrique'),
(4, 'Lucas Pereira'),
(5, 'Beatriz Souza'),
(6, 'Guilherme Lima'),
(7, 'Larissa Melo'),
(8, 'Vinicius Ramos'),
(9, 'Camila Oliveira'),
(10, 'André Santos'),
(11, 'Juliana Ferraz'),
(12, 'Ricardo Barros'),
(13, 'Mariana Alves'),
(14, 'Felipe Costa'),
(15, 'Luana Moura');

INSERT INTO professor_voluntario (usuario_fk, nome, area_atuacao) VALUES
(16, 'Prof. Felipe', 'Geografia'),
(17, 'Prof. Marina', 'Física'),
(18, 'Prof. Rafael', 'Biologia'),
(19, 'Prof. Isabela', 'Filosofia'),
(20, 'Prof. João Victor', 'Educação Física'),
(21, 'Prof. Carla Santos', 'Química'),
(22, 'Prof. Ricardo Mendes', 'Inglês'),
(23, 'Prof. Letícia Campos', 'Artes'),
(24, 'Prof. Daniel Souza', 'Matemática'),
(25, 'Prof. Mariana Ribeiro', 'Sociologia'),
(26, 'Prof. Thiago Martins', 'Português'),
(27, 'Prof. Sérgio', 'História');

INSERT INTO assunto (id, nome) VALUES
(1, 'Geografia'),
(2, 'Física'),
(3, 'Biologia'),
(4, 'Filosofia'),
(5, 'Educação Física'),
(6, 'Química'),
(7, 'Inglês'),
(8, 'Artes'),
(9, 'Matemática'),
(10, 'Sociologia'),
(11, 'Português'),
(12, 'História');

INSERT INTO duvida (aluno_fk, assunto_fk, titulo, descricao, status) VALUES
(1, 9, 'O que é MMC?', 'Não entendi como calcular o MMC entre dois números.', 'respondida'),
(2, 11, 'Ortografia com "s" ou "z"', 'Como saber quando usar "s" ou "z"?', 'respondida'),
(3, 9, 'Somar frações', 'Não entendi como somar frações com denominadores diferentes.', 'pendente'),
(4, 9, 'Como resolver equações do 2º grau?', 'Não entendo como aplicar a fórmula de Bhaskara.', 'respondida'),
(5, 11, 'Uso de crase em frases simples', 'Como saber se a frase exige crase?', 'pendente'),
(6, 11, 'Diferença entre "mas" e "mais"', 'Quando usar cada um?', 'respondida'),
(7, 9, 'Potência de base negativa', 'O que acontece com expoente par ou ímpar?', 'respondida'),
(8, 2, 'O que é velocidade média?', 'Não entendi como calcular velocidade média em física.', 'respondida'),
(9, 12, 'O que foi a Revolução Francesa?', 'Resumo simples sobre a Revolução Francesa.', 'respondida'),
(10, 1, 'Coordenadas geográficas', 'Como identificar latitude e longitude?', 'respondida'),
(11, 3, 'Diferença entre DNA e RNA', 'Quais as principais diferenças entre DNA e RNA?', 'respondida'),
(12, 4, 'O que é ética?', 'Não entendi o conceito de ética na filosofia.', 'respondida'),
(13, 6, 'Estados da matéria', 'Quais são os estados físicos da matéria e suas mudanças?', 'respondida'),
(14, 7, 'Como formar frases no passado?', 'Tenho dificuldade com o passado simples em inglês.', 'respondida'),
(15, 10, 'O que é cultura?', 'Definição simples e exemplos de cultura.', 'respondida');

INSERT INTO resposta (duvida_fk, professor_fk, texto_resposta) VALUES
(1, 9, 'MMC é o menor múltiplo comum entre dois números. Veja este exemplo: ...'),
(2, 11, 'A ortografia deve ser memorizada, mas há regras. Ex: sufixos "-ez" e "-eza" com Z.'),
(4, 9, 'A fórmula de Bhaskara resolve equações do tipo ax²+bx+c. Exemplo: x² - 5x + 6 = 0.'),
(6, 11, '"Mas" é conjunção adversativa. "Mais" é advérbio de intensidade. Ex: Eu quero mais.'),
(7, 9, 'Potência com expoente par dá resultado positivo, com ímpar mantém o sinal da base.'),
(8, 2, 'Velocidade média é calculada dividindo a distância total pelo tempo total. Ex: 100 km / 2h = 50 km/h.'),
(9, 12, 'A Revolução Francesa foi um marco histórico iniciado em 1789 que mudou a estrutura política da França.'),
(10, 1, 'Latitude indica a posição Norte-Sul e longitude a posição Leste-Oeste no globo terrestre.'),
(11, 3, 'DNA é fita dupla e contém informações genéticas. RNA é fita simples e ajuda na síntese de proteínas.'),
(12, 4, 'Ética é o estudo do que é certo ou errado. Exemplo: respeitar os outros é uma atitude ética.'),
(13, 6, 'Sólido, líquido e gasoso são os estados da matéria. Mudanças incluem fusão, evaporação, condensação etc.'),
(14, 7, 'Ex: "I walked to school yesterday." Para o passado simples, usamos o verbo com "ed" ou sua forma irregular.'),
(15, 10, 'Cultura é o conjunto de costumes, crenças e conhecimentos de um povo. Ex: festas, idioma, culinária.');

INSERT INTO base_conhecimento (resposta_fk, visibilidade) VALUES
(1, 'publica'),
(2, 'publica'),
(3, 'publica'),
(4, 'publica'),
(5, 'privada'),
(6, 'publica'),
(7, 'publica'),
(8, 'publica'),
(9, 'publica'),
(10, 'publica'),
(11, 'publica'),
(12, 'publica'),
(13, 'publica');

INSERT INTO palavra_chave (termo) VALUES
('mmc'),
('matemática'),
('múltiplo comum'),
('ortografia'),
('sufixos'),
('letras'),
('s ou z'),
('bhaskara'),
('equações'),
('crase'),
('potência'),
('sinais'),
('velocidade média'),
('movimento'),
('revolução francesa'),
('história moderna'),
('coordenadas'),
('latitude'),
('DNA'),
('RNA'),
('ética'),
('moral'),
('estados físicos'),
('mudanças de estado'),
('passado simples'),
('gramática inglesa'),
('cultura'),
('sociologia'),
('arte'),
('perspectiva'),
('desenho');

INSERT INTO base_conhecimento_palavra (base_conhecimento_fk, palavra_chave_fk) VALUES
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (2, 7), (3, 8), (3, 9), (3, 2), (4, 10), (4, 26), (5, 11), (5, 12), (5, 2), (6, 13), (6, 14), (7, 15), (7, 16), (8, 17), (8, 18), (9, 19), (9, 20), (10, 21), (10, 22), (11, 23), (11, 24), (12, 25), (12, 26), (13, 27), (13, 28);

INSERT INTO comentario_resposta (resposta_fk, professor_fk, comentario) VALUES
(3, 2, 'Boa explicação, talvez incluir mais exemplos.'),
(4, 5, 'Sugiro simplificar a linguagem.'),
(6, 4, 'Ótima explicação, poderia incluir uma fórmula visual.'),
(7, 1, 'Excelente síntese.'),
(8, 2, 'Bom resumo, adicione exemplo com coordenadas reais.'),
(9, 3, 'Seria bom ilustrar com imagens de DNA e RNA.'),
(10, 4, 'Talvez destacar diferença entre ética e moral.'),
(11, 6, 'Muito bom.'),
(12, 7, 'Frase simples e objetiva, ótimo para iniciantes.'),
(13, 10, 'Excelente definição de cultura.');

CREATE OR REPLACE VIEW ver_base_conhecimento_completa AS
SELECT
    d.titulo AS titulo_duvida,
    r.texto_resposta,
    p.nome AS professor,
    a.nome AS assunto,
    GROUP_CONCAT(pc.termo ORDER BY pc.termo SEPARATOR ', ') AS palavras_chave,
    r.data_resposta
FROM base_conhecimento bc
JOIN resposta r ON bc.resposta_fk = r.id
JOIN duvida d ON r.duvida_fk = d.id
JOIN professor_voluntario p ON r.professor_fk = p.id
JOIN assunto a ON d.assunto_fk = a.id
LEFT JOIN base_conhecimento_palavra bcp ON bc.id = bcp.base_conhecimento_fk
LEFT JOIN palavra_chave pc ON bcp.palavra_chave_fk = pc.id
GROUP BY bc.id;

CREATE OR REPLACE VIEW ver_duvidas_pendentes AS
SELECT
    d.id AS id_duvida,
    d.titulo,
    d.descricao,
    d.data_criacao,
    a.nome AS aluno,
    s.nome AS assunto
FROM duvida d
JOIN aluno a ON d.aluno_fk = a.id
LEFT JOIN assunto s ON d.assunto_fk = s.id
WHERE d.status = 'pendente';

CREATE OR REPLACE VIEW ver_duvidas_respondidas AS
SELECT
    d.id AS id_duvida,
    d.titulo,
    r.texto_resposta,
    r.data_resposta,
    p.nome AS professor,
    a.nome AS aluno,
    s.nome AS assunto
FROM duvida d
JOIN resposta r ON d.id = r.duvida_fk
JOIN professor_voluntario p ON r.professor_fk = p.id
JOIN aluno a ON d.aluno_fk = a.id
LEFT JOIN assunto s ON d.assunto_fk = s.id
WHERE d.status = 'respondida';

CREATE OR REPLACE VIEW ver_atividades_professor AS
SELECT
    p.id AS id_professor,
    p.nome AS professor,
    p.area_atuacao,
    COUNT(r.id) AS total_respostas
FROM professor_voluntario p
LEFT JOIN resposta r ON p.id = r.professor_fk
GROUP BY p.id;

CREATE OR REPLACE VIEW ver_atividades_aluno AS
SELECT
    a.id AS id_aluno,
    a.nome AS aluno,
    COUNT(d.id) AS total_duvidas,
    SUM(CASE WHEN d.status = 'respondida' THEN 1 ELSE 0 END) AS duvidas_respondidas,
    SUM(CASE WHEN d.status = 'pendente' THEN 1 ELSE 0 END) AS duvidas_pendentes
FROM aluno a
LEFT JOIN duvida d ON a.id = d.aluno_fk
GROUP BY a.id;

CREATE OR REPLACE VIEW ver_painel_aluno AS
SELECT
    d.aluno_fk,
    a.nome AS nome_aluno,
    d.id AS id_duvida,
    d.titulo,
    d.status,
    d.data_criacao,
    r.id AS id_resposta,
    r.data_resposta,
    p.nome AS nome_professor
FROM duvida d
JOIN aluno a ON d.aluno_fk = a.id
LEFT JOIN resposta r ON d.id = r.duvida_fk
LEFT JOIN professor_voluntario p ON r.professor_fk = p.id
ORDER BY d.data_criacao DESC;

CREATE OR REPLACE VIEW ver_comentarios_em_respostas AS
SELECT
    d.id AS id_duvida,
    d.titulo AS titulo_duvida,
    r.id AS id_resposta,
    resp_prof.nome AS autor_da_resposta,
    r.texto_resposta,
    c.id AS id_comentario,
    c.data_comentario,
    com_prof.nome AS autor_do_comentario,
    c.comentario
FROM comentario_resposta c
JOIN resposta r ON c.resposta_fk = r.id
JOIN duvida d ON r.duvida_fk = d.id
JOIN professor_voluntario resp_prof ON r.professor_fk = resp_prof.id
JOIN professor_voluntario com_prof ON c.professor_fk = com_prof.id
ORDER BY c.data_comentario DESC;

CREATE OR REPLACE VIEW ver_respostas_por_assunto AS
SELECT
    s.nome AS nome_assunto,
    d.id AS id_duvida,
    d.titulo AS titulo_duvida,
    r.id AS id_resposta,
    r.texto_resposta,
    p.nome AS nome_professor,
    p.area_atuacao AS area_professor,
    a.nome AS nome_aluno,
    r.data_resposta
FROM
    resposta r
    JOIN duvida d ON r.duvida_fk = d.id
    JOIN assunto s ON d.assunto_fk = s.id
    JOIN professor_voluntario p ON r.professor_fk = p.id
    JOIN aluno a ON d.aluno_fk = a.id
ORDER BY
    s.nome, r.data_resposta DESC;

SELECT * FROM ver_base_conhecimento_completa;

SELECT * FROM ver_duvidas_pendentes;
SELECT * FROM ver_duvidas_respondidas;

SELECT * FROM ver_atividades_professor;
SELECT * FROM ver_atividades_aluno;

SELECT * FROM ver_painel_aluno;
SELECT * FROM ver_comentarios_em_respostas;

SELECT * FROM ver_respostas_por_assunto;
SELECT * FROM ver_respostas_por_assunto WHERE nome_assunto = 'Matemática';