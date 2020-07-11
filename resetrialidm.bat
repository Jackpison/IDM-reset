REM @echo off
TASKKILL /f 2> nul /IM IDMan.exe  > nul 2>&1
"subinacl" /keyreg "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /grant="Tout le monde"=f 1> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\WOW6432Node\CLSID\{99d8f88f-4892-43bf-a569-42c595069a1c}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\WOW6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /v MData /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /v Model /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /v Therad /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f 2> nul

reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f 2> nul

reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f 2> nul

REM reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f 2> nul

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Internet Download Manager" /v scansk /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v scansk /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v CheckUpdtVM /f 2> nul

REM reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /f 2> nul
REM reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Internet Download Manager" /f 2> nul

reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v FName /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v LName /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v Email /f 2> nul
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v Serial /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Internet DownloadManager" /v FName /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Internet DownloadManager" /v LName /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Internet DownloadManager" /v Email /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Internet DownloadManager" /v Serial /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Internet DownloadManager" /v FName /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Internet DownloadManager" /v LName /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Internet DownloadManager" /v Email /f 2> nul
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Internet DownloadManager"  /v Serial /f 2> nul
pause
