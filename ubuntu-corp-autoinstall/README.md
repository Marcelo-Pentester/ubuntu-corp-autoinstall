# Ubuntu Corporate Autoinstall

Instalação automatizada do Ubuntu Desktop corporativo com hardening de segurança, usando `cloud-init` e `autoinstall`.

## Recursos incluídos:

- Instalação 100% automática
- Interface GNOME
- Pacotes: LibreOffice, Firefox, Atril
- Firewall UFW bloqueando tudo exceto HTTP, HTTPS e DNS
- SELinux ativado em modo enforcing
- chkrootkit agendado semanalmente
- Suporte a sudo sem senha para o usuário principal

## Estrutura

- `autoinstall/user-data.yaml`: Arquivo principal de configuração
- `autoinstall/meta-data`: Dados mínimos exigidos pelo `cloud-init`
- `scripts/hardening.sh`: Script opcional de hardening para uso pós-instalação
- `iso/custom-iso-guide.md`: Como criar uma ISO personalizada com esses arquivos

## Como usar

Você pode usar via PXE, pendrive ou gerar uma ISO personalizada. Veja o guia em `iso/custom-iso-guide.md`.
