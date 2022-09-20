@ECHO OFF
CLS

:: Nome do arquivo para salvar o nome dos pacotes que tiverem erro
set arquivo_erro="erro.txt"

:main
:: Verifica se o winget esta presente, tenta instalar caso contrario
CALL :VerificaWinget

:: Verifica se e admin
CALL :TemPermissaoAdministrador ehAdministrador
if %ehAdministrador% == 0 (
    echo Voce deve executar este script como administrador!
    EXIT /B %ERRORLEVEL%
)

:: Instala os programas	::
:: Programas uteis  ::
CALL :Instala 7zip.7zip %arquivo_erro%
CALL :Instala AnyDeskSoftwareGmbH.AnyDesk %arquivo_erro%
CALL :Instala TheDocumentFoundation.LibreOffice %arquivo_erro%
CALL :Instala VideoLAN.VLC %arquivo_erro%
CALL :Instala Logitech.GHUB %arquivo_erro%
CALL :Instala Mega.MEGASync %arquivo_erro%
CALL :Instala KeePassXCTeam.KeePassXC %arquivo_erro%
CALL :Instala qBittorrent.qBittorrent %arquivo_erro%
CALL :Instala Nvidia.GeForceExperience %arquivo_erro%

:: Ferramentas de Desenvolvimento ::
CALL :Instala Notepad++.Notepad++ %arquivo_erro%
CALL :Instala Microsoft.VisualStudioCode %arquivo_erro%
CALL :Instala Git.Git %arquivo_erro%
CALL :Instala GnuWin32.Make %arquivo_erro%
CALL :Instala Python.Python.3.10 %arquivo_erro%
CALL :Instala Gluon.SceneBuilder %arquivo_erro%
CALL :Instala MKLabs.StarUML %arquivo_erro%
CALL :Instala EclipseAdoptium.Temurin.18.JDK %arquivo_erro%

:: Instala os launchers de games ::
CALL :Instala Ubisoft.Connect %arquivo_erro%
CALL :Instala EpicGames.EpicGamesLauncher %arquivo_erro%
CALL :Instala Valve.Steam %arquivo_erro%
CALL :Instala GOG.Galaxy %arquivo_erro%

EXIT /B 0

:TemPermissaoAdministrador
:: Esse comando so funciona se tiver permissao de admin, se nao ele salva um numero na variavel errolevel
:: Redireciona a saida padrao do comando para nul e a saida de erro para o nul tambem
net session >nul 2>nul

if %ERRORLEVEL% == 0 (
    set /a %~1=1
) ELSE (
    set /a %~1=0
)
EXIT /B 0


:: Esta fucao verifica se o winget esta funcionando
:TemWingetInstalado
winget >nul 2>nul
if %ERRORLEVEL% == 0 ( 
    :: winget esta instalado
    set /a %~1=1
) ELSE (
    :: sem winget
    set /a %~1=0
)
EXIT /B 0

:: Esta funcao instala com o winget o programa especificado e caso haja erro 
:: escreve o nome do programa no arquivo passado por parametro
:Instala
echo Instalando %~1
winget install %~1
:: Ocorreu erro?
if %ERRORLEVEL% neq 0 ( 
	echo Erro ao instalar %~1 >>%~2
)
echo.
EXIT /B 0

:: Verifica se o winget esta instalado
:VerificaWinget
:verifica_winget
CALL :TemWingetInstalado temWinget
if %temWinget% equ 0 goto :instala_winget
if %temWinget% neq 0 EXIT /B 0
:instala_winget 
(
    echo Voce deve ter o winget instalado para proseguir
    echo Tentando instalar o WINGET
    start ms-appinstaller:?source=https://aka.ms/getwinget
    echo.
	timeout 5 >nul
    echo Caso tenha ocorrido algum erro ao instalar, entre no link abaixo
    echo No Windows 10 ou superior entre no link https://www.microsoft.com/store/productId/9NBLGGH4NNS1 
    echo.
	echo Pressione alguma tecla para continuar
	pause >nul
	goto :verifica_winget
)