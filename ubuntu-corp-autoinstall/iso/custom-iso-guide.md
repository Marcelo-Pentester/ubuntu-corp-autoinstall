# Criando ISO personalizada com autoinstall

1. Baixe a ISO oficial do Ubuntu Desktop (22.04+).
2. Monte a ISO e copie todo o conteúdo para uma pasta.
3. Crie a pasta `nocloud` dentro da estrutura e adicione `user-data.yaml` e `meta-data`.
4. Modifique o arquivo de boot (GRUB) e adicione:

```
autoinstall ds=nocloud\;s=/cdrom/nocloud/
```

5. Gere a nova ISO com `xorriso` ou `mkisofs`.

```bash
xorriso -as mkisofs -r -V "Ubuntu Auto" -o ubuntu-custom.iso -J -l -b isolinux/isolinux.bin   -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table ./ISO_DIR
```

6. Grave em DVD ou pendrive com `dd`.
