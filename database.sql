-- Script SQL para criação do banco de dados
-- Execute este script no seu painel de controle da Hostinger

CREATE DATABASE IF NOT EXISTS sistema_login CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE sistema_login;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimo_login TIMESTAMP NULL,
    ativo BOOLEAN DEFAULT TRUE,
    INDEX idx_usuario (usuario),
    INDEX idx_email (email)
) ENGINE=InnoDB;

-- Tabela de sessões (opcional, para controle de sessões)
CREATE TABLE IF NOT EXISTS sessoes (
    id VARCHAR(128) PRIMARY KEY,
    usuario_id INT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_expiracao TIMESTAMP NOT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_usuario_id (usuario_id),
    INDEX idx_expiracao (data_expiracao)
) ENGINE=InnoDB;

-- Tabela de logs (opcional, para auditoria)
CREATE TABLE IF NOT EXISTS logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    acao VARCHAR(100) NOT NULL,
    detalhes TEXT,
    ip_address VARCHAR(45),
    data_acao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
    INDEX idx_usuario_id (usuario_id),
    INDEX idx_data_acao (data_acao)
) ENGINE=InnoDB;

-- Inserir usuário administrador padrão (senha: admin123)
-- IMPORTANTE: Altere esta senha após a instalação!
INSERT INTO usuarios (usuario, senha, email) VALUES 
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@seudominio.com')
ON DUPLICATE KEY UPDATE usuario = usuario;

