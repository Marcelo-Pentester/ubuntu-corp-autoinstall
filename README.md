
# ubuntu-corp-autoinstall

Instalação automatizada do Ubuntu usando o recurso `autoinstall` com foco em segurança e endurecimento do sistema (hardening).

## Características

- Instalação totalmente automatizada via `cloud-init`
- Firewall UFW configurado com:
  - **Bloqueio total** de conexões
  - Apenas **portas 80, 443 e 53 liberadas** (entrada e saída)
- Ativação de **SELinux em modo enforcing**
- Pacotes de segurança e auditoria:
  - `rkhunter`, `aide`, `chkrootkit`, `auditd`
- Ambiente gráfico (opcional):
  - `ubuntu-desktop`, `libreoffice`, `firefox`, `atril`
- Agendamento de relatórios semanais por e-mail para:
  - Checagem de rootkits, integridade e anomalias
- Suporte ao idioma e layout de teclado brasileiro (ABNT2)
- Usuário `usuario` com acesso `sudo` sem senha (`NOPASSWD`)

## Uso

1. Clone este repositório:
   ```bash
  https://github.com/Marcelo-Pentester/ubuntu-corp-autoinstall.git
   cd ubuntu-corp-autoinstall
