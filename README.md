# Sistema de Login e Painel do Operador - VPS Hostinger

## Descrição

Sistema completo de autenticação e painel administrativo otimizado para servidores VPS da Hostinger. Inclui recursos avançados de segurança, logs detalhados e interface responsiva.

## Características Principais

- 🔐 **Autenticação Segura**: Login com criptografia de senhas usando bcrypt
- 👥 **Gestão de Usuários**: Sistema completo de cadastro e gerenciamento
- 📊 **Painel Administrativo**: Interface intuitiva para operadores
- 📝 **Sistema de Logs**: Registro detalhado de todas as atividades
- 🛡️ **Segurança Avançada**: Proteção contra ataques comuns (SQL Injection, XSS, CSRF)
- 📱 **Design Responsivo**: Compatível com desktop e mobile
- ⚡ **Otimizado para VPS**: Configurações específicas para Hostinger

## Estrutura do Projeto

```
sistema_vps_hostinger/
├── cliente/                    # Área do cliente
│   ├── login_vps.php          # Login otimizado
│   ├── cadastro_vps.php       # Cadastro de usuários
│   └── ...
├── painel/                    # Painel administrativo
│   ├── index_vps.php          # Dashboard principal
│   ├── enviar_comando_vps.php # Envio de comandos
│   └── ...
├── includes/                  # Arquivos de inclusão
│   ├── db_vps.php            # Conexão com banco otimizada
│   └── ...
├── css/                      # Estilos
├── logs/                     # Logs do sistema
├── uploads/                  # Arquivos enviados
├── backup/                   # Backups
├── config.php               # Configurações principais
├── database.sql             # Estrutura do banco
├── .htaccess               # Configurações Apache
├── index_vps.html          # Página inicial
└── INSTALACAO_VPS_HOSTINGER.md # Guia de instalação
```

## Requisitos do Sistema

- **PHP**: 7.4 ou superior (recomendado 8.0+)
- **MySQL**: 5.7 ou superior (ou MariaDB 10.2+)
- **Apache**: com mod_rewrite habilitado
- **SSL**: Certificado SSL ativo (HTTPS)

## Instalação Rápida

1. **Upload dos arquivos** para o diretório `public_html`
2. **Criar banco de dados** via hPanel da Hostinger
3. **Importar** o arquivo `database.sql`
4. **Configurar** o arquivo `config.php` com suas credenciais
5. **Ativar SSL** no painel da Hostinger
6. **Testar** o acesso ao sistema

Para instruções detalhadas, consulte: [INSTALACAO_VPS_HOSTINGER.md](INSTALACAO_VPS_HOSTINGER.md)

## Credenciais Padrão

**⚠️ IMPORTANTE: Altere imediatamente após a instalação!**

- **Usuário**: admin
- **Senha**: admin123

## Arquivos Principais

### Versões Otimizadas para VPS:
- `index_vps.html` - Página inicial
- `cliente/login_vps.php` - Sistema de login
- `cliente/cadastro_vps.php` - Cadastro de usuários
- `painel/index_vps.php` - Painel principal
- `includes/db_vps.php` - Conexão com banco

### Configurações:
- `config.php` - Configurações principais
- `.htaccess` - Configurações de segurança Apache
- `database.sql` - Estrutura do banco de dados

## Recursos de Segurança

- ✅ Criptografia de senhas com bcrypt
- ✅ Proteção contra SQL Injection
- ✅ Validação e sanitização de dados
- ✅ Headers de segurança HTTP
- ✅ Proteção de arquivos sensíveis
- ✅ Logs de auditoria
- ✅ Redirecionamento HTTPS forçado

## Logs e Monitoramento

O sistema registra automaticamente:
- Tentativas de login (sucesso/falha)
- Ações dos usuários
- Erros do sistema
- Acessos suspeitos

Logs são salvos em: `logs/error.log`

## Backup e Manutenção

- Script de backup automático incluído
- Configuração de cron para backups regulares
- Limpeza automática de logs antigos
- Monitoramento de performance

## Suporte

Para suporte e dúvidas:
1. Consulte o arquivo `INSTALACAO_VPS_HOSTINGER.md`
2. Verifique os logs em `logs/error.log`
3. Entre em contato com o suporte técnico

## Licença

Este sistema é fornecido "como está" para uso em servidores VPS Hostinger.

---

**Desenvolvido para VPS Hostinger**  
**Versão**: 1.0  
**Data**: 2024

