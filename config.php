<?php
// Configurações para VPS Hostinger
// Substitua os valores abaixo pelas informações do seu banco de dados

// Configurações do Banco de Dados
define('DB_HOST', 'localhost'); // ou o host fornecido pela Hostinger
define('DB_NAME', 'sistema_login'); // nome do seu banco de dados
define('DB_USER', 'seu_usuario'); // usuário do banco de dados
define('DB_PASS', 'sua_senha'); // senha do banco de dados

// Configurações de Segurança
define('SITE_URL', 'https://seudominio.com'); // URL do seu site
define('SECURE_KEY', 'sua_chave_secreta_aqui'); // Chave para criptografia

// Configurações de Sessão
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 1);
ini_set('session.use_only_cookies', 1);

// Configurações de Erro (para produção)
error_reporting(0);
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/logs/error.log');

// Timezone
date_default_timezone_set('America/Sao_Paulo');
?>

