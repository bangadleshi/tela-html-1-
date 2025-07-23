# Sistema de Login - Guia de Instalação VPS Hostinger

## Visão Geral

Este sistema de login e painel do operador foi otimizado especificamente para funcionar em servidores VPS da Hostinger. Inclui recursos de segurança avançados, logs detalhados e configurações otimizadas para produção.

## Características do Sistema

- ✅ Login seguro com criptografia de senhas
- ✅ Painel administrativo completo
- ✅ Sistema de logs e auditoria
- ✅ Proteção contra ataques comuns
- ✅ Configurações otimizadas para VPS
- ✅ Interface responsiva
- ✅ Backup e recuperação

## Pré-requisitos

Antes de iniciar a instalação, certifique-se de que seu VPS Hostinger possui:

- **PHP 7.4 ou superior** (recomendado PHP 8.0+)
- **MySQL 5.7 ou superior** (ou MariaDB 10.2+)
- **Apache com mod_rewrite habilitado**
- **Acesso SSH ao servidor**
- **Painel de controle (hPanel)**




## Passo 1: Preparação do Ambiente

### 1.1 Acesso ao VPS via SSH

```bash
ssh root@seu-ip-do-vps
# ou
ssh usuario@seu-ip-do-vps
```

### 1.2 Atualização do Sistema

```bash
apt update && apt upgrade -y
```

### 1.3 Instalação de Dependências (se necessário)

```bash
# Instalar Apache, PHP e MySQL (se não estiverem instalados)
apt install apache2 php php-mysql mysql-server -y

# Habilitar mod_rewrite
a2enmod rewrite

# Reiniciar Apache
systemctl restart apache2
```

## Passo 2: Upload dos Arquivos

### 2.1 Via Painel de Controle (hPanel)

1. Acesse o hPanel da Hostinger
2. Vá em **Arquivos** → **Gerenciador de Arquivos**
3. Navegue até a pasta `public_html` (ou pasta do seu domínio)
4. Faça upload de todos os arquivos do sistema
5. Extraia se necessário

### 2.2 Via SSH/SCP

```bash
# Copiar arquivos via SCP
scp -r sistema_vps_hostinger/* usuario@seu-ip:/home/usuario/public_html/

# Ou via SSH, fazer upload e extrair
cd /home/usuario/public_html/
wget https://seu-link-dos-arquivos.zip
unzip sistema_vps_hostinger.zip
```

### 2.3 Configurar Permissões

```bash
# Definir permissões corretas
chown -R www-data:www-data /home/usuario/public_html/
chmod -R 755 /home/usuario/public_html/
chmod -R 777 /home/usuario/public_html/logs/
chmod -R 777 /home/usuario/public_html/uploads/
```


## Passo 3: Configuração do Banco de Dados

### 3.1 Criar Banco de Dados via hPanel

1. No hPanel, vá em **Bancos de Dados** → **MySQL**
2. Clique em **Criar novo banco de dados**
3. Nome do banco: `sistema_login` (ou outro nome de sua escolha)
4. Anote as informações:
   - **Nome do banco:** sistema_login
   - **Usuário:** (será criado automaticamente)
   - **Senha:** (defina uma senha forte)
   - **Host:** localhost (geralmente)

### 3.2 Importar Estrutura do Banco

1. No hPanel, vá em **Bancos de Dados** → **phpMyAdmin**
2. Selecione o banco criado
3. Clique na aba **Importar**
4. Selecione o arquivo `database.sql`
5. Clique em **Executar**

### 3.3 Via SSH (Alternativo)

```bash
# Conectar ao MySQL
mysql -u root -p

# Criar banco e usuário
CREATE DATABASE sistema_login CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'sistema_user'@'localhost' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON sistema_login.* TO 'sistema_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# Importar estrutura
mysql -u sistema_user -p sistema_login < database.sql
```

## Passo 4: Configuração do Sistema

### 4.1 Editar Arquivo de Configuração

Edite o arquivo `config.php` com as informações do seu banco:

```php
// Configurações do Banco de Dados
define('DB_HOST', 'localhost');
define('DB_NAME', 'sistema_login');
define('DB_USER', 'seu_usuario_db');
define('DB_PASS', 'sua_senha_db');

// Configurações de Segurança
define('SITE_URL', 'https://seudominio.com');
define('SECURE_KEY', 'sua_chave_secreta_unica_aqui');
```

### 4.2 Gerar Chave de Segurança

Para gerar uma chave segura, use:

```bash
# Via PHP
php -r "echo bin2hex(random_bytes(32));"

# Via OpenSSL
openssl rand -hex 32
```


## Passo 5: Configuração de Segurança

### 5.1 Configurar SSL (HTTPS)

Na Hostinger, o SSL é geralmente gratuito:

1. No hPanel, vá em **Segurança** → **SSL**
2. Ative o **SSL gratuito** para seu domínio
3. Aguarde a ativação (pode levar alguns minutos)
4. Teste acessando `https://seudominio.com`

### 5.2 Configurar .htaccess

O arquivo `.htaccess` já está incluído com configurações de segurança:

- Redirecionamento HTTP → HTTPS
- Proteção de arquivos sensíveis
- Headers de segurança
- Compressão GZIP
- Cache otimizado

### 5.3 Alterar Senha Padrão

**IMPORTANTE:** O sistema vem com um usuário administrador padrão:

- **Usuário:** admin
- **Senha:** admin123

**Altere imediatamente após a instalação!**

1. Faça login no sistema
2. Vá em **Configurações**
3. Altere a senha para uma senha forte

## Passo 6: Teste e Verificação

### 6.1 Teste de Acesso

1. Acesse `https://seudominio.com`
2. Teste o login com as credenciais padrão
3. Verifique se o painel carrega corretamente
4. Teste o cadastro de novos usuários

### 6.2 Verificar Logs

1. Acesse a pasta `logs/` via FTP/SSH
2. Verifique se os arquivos de log estão sendo criados
3. Monitore por erros no arquivo `error.log`

### 6.3 Teste de Funcionalidades

- ✅ Login e logout
- ✅ Cadastro de usuários
- ✅ Painel administrativo
- ✅ Logs do sistema
- ✅ Redirecionamento HTTPS


## Passo 7: Manutenção e Backup

### 7.1 Backup Automático

Crie um script de backup para executar regularmente:

```bash
#!/bin/bash
# Script de backup - salvar como backup.sh

DATA=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/home/backup"
SITE_DIR="/home/usuario/public_html"
DB_NAME="sistema_login"
DB_USER="seu_usuario_db"
DB_PASS="sua_senha_db"

# Criar diretório de backup
mkdir -p $BACKUP_DIR

# Backup dos arquivos
tar -czf $BACKUP_DIR/arquivos_$DATA.tar.gz $SITE_DIR

# Backup do banco de dados
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/banco_$DATA.sql

# Manter apenas os últimos 7 backups
find $BACKUP_DIR -name "*.tar.gz" -mtime +7 -delete
find $BACKUP_DIR -name "*.sql" -mtime +7 -delete
```

### 7.2 Configurar Cron para Backup

```bash
# Editar crontab
crontab -e

# Adicionar linha para backup diário às 2h da manhã
0 2 * * * /home/usuario/backup.sh
```

## Solução de Problemas Comuns

### Erro: "Conexão falhou"

**Causa:** Configurações incorretas do banco de dados

**Solução:**
1. Verifique as credenciais em `config.php`
2. Confirme se o banco de dados existe
3. Teste a conexão via phpMyAdmin

### Erro: "Internal Server Error"

**Causa:** Problemas no .htaccess ou permissões

**Solução:**
1. Verifique as permissões dos arquivos (755 para pastas, 644 para arquivos)
2. Temporariamente renomeie `.htaccess` para `.htaccess_backup`
3. Verifique os logs de erro do Apache

### Página não carrega CSS/JS

**Causa:** Problemas de caminho ou permissões

**Solução:**
1. Verifique se os arquivos CSS estão na pasta correta
2. Confirme as permissões da pasta `css/`
3. Teste acessando diretamente o arquivo CSS

### Login não funciona

**Causa:** Problemas de sessão ou banco de dados

**Solução:**
1. Verifique se as tabelas foram criadas corretamente
2. Confirme se o PHP tem permissão para criar sessões
3. Verifique os logs em `logs/error.log`

## Configurações Avançadas

### Configurar Email (Opcional)

Para funcionalidades de email (recuperação de senha, etc.):

```php
// Adicionar ao config.php
define('SMTP_HOST', 'smtp.hostinger.com');
define('SMTP_PORT', 587);
define('SMTP_USER', 'seu-email@seudominio.com');
define('SMTP_PASS', 'sua-senha-email');
```

### Configurar Firewall

```bash
# Configurar UFW (se disponível)
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw enable
```

## Suporte e Contato

Para suporte adicional:

1. Verifique os logs em `logs/error.log`
2. Consulte a documentação da Hostinger
3. Entre em contato com o suporte técnico

---

**Versão do Sistema:** 1.0  
**Compatibilidade:** VPS Hostinger  
**Última atualização:** 2024

