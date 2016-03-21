@echo off
setlocal enabledelayedexpansion
:: Batch file to be able to click on posting info on beancount's web interface and
:: automatically open up the source file at the place of that posting.
:: 
:: Ref: https://msdn.microsoft.com/en-us/library/aa767914(v=vs.85).aspx
:: 
:: Instructions:
:: 1) Edit the supplied beancounturi.reg file, and replace the string 'YOURUSERNAME'
::    with your Windows username
:: 2) Save and double click beancounturi.reg to install the registry value
:: 3) In the last line below, replace the editor with the one of your choice installed
::    on your system, and its arguments as required
:: 4) Copy this .bat file to C:\Users\YOURUSERNAME\beancountopen.bat (as indicated in
::    the .reg file)
:: 5) Clicking on a beancount:// uri in your browser (or in any other application)
::    should now open the file in your editor at the line name given
:: 
:: Notes: URI example: beancount:///cygdrive/c/Users/YOURUSERNAME/beancount/Credit-Card.bc?lineno=647
:: This is changed to: "C:\Program Files (x86)\Vim\vim74\gvim.exe"  C:/Users/YOURUSERNAME/Documents/beancount/Credit-Card.bc +647
:: 

Set url=%1

:: Strip quotes
set url=%url:~1,-1%

:: Strip '"beanount://'
set url=%url:beancount://=%

:: Extract line number
set "find=*?"
call set lineno=%%url:!find!=%%
set "find=*lineno"
call set lineno=%%lineno:!find!=%%
set lineno=%lineno:~1%
:: echo %lineno%

:: Extract filename
:: echo URL: %url%
:: echo Lineno: %lineno%
call set file=%%url:!lineno!=%%
:: echo File-portion: %file%
set file=%file:~0,-8%
:: echo CygFile: %file%

:: Replace root directory with custom root (since cygwin paths are different from native
:: Windows paths)
Set "Pattern=/cygdrive/c"
Set "Replace=C:/"
Set "File=!File:%Pattern%=%Replace%!"
:: echo WinFile: %file%

:: DEBUG:
::echo File: %file%
::echo Line: %lineno%

:: REPLACE this with the editor of your choice:
"C:\Program Files (x86)\Vim\vim74\gvim.exe" %file%   +%lineno%

