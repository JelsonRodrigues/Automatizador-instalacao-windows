Este script foi criado para automatizar a instalação dos programas no Windows<br>
Funciona no Windows 10 ou superior, desde que possua o winget<br>
**Deve ser executado como administrador**<br>
Caso não tenha o winget instalado/atualizado, o script tenta instalar o winget<br>

Para alterar o funcionamento do script e instalar outros programas,
primeiramente pesquise se o programa/aplicativo está disponível no
repositório do winget, com o comando

`winget search <nome do programa>`

Caso a busca tenha tido sucesso, copie o ID do programa e coloque uma linha no script
da seguinte maneira:

`CALL :Instala <ID do programa> %arquivo_erro%`

Para rodar o script abra uma instância do **CMD**, **PowerShell** ou **Terminal** (do Windows) como 
**administrador** e navegue até a pasta onde se encontra o arquivo "instalar.bat"<br>
Execute o script com `./instalar.bat`
