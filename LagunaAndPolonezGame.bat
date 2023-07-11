@echo off
@chcp 65001
Setlocal enabledelayedexpansion
title Kolko i krzyzyk online
::Set your server and color 
set mm=4
set y=7
set SerwerFTP=112.111.108.111
set LoginFTP=laguna
set HasloFTP=polonez
color %mm%%y%


:Start
mode 120,16
cls
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo ========================================================================================================================
echo ========================================================================================================================
echo ========================================================================================================================
echo   ////////////////////////////////////         ° ___              ___ ___ ___  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo  ////////////////////////////////////   \    / ǀ  ǀ   /\   /\/\   \˅/ \˅/ \˅/   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo ////////////////////////////////////     \/\/  ǀ  ǀ  /¯¯\ /    \   ○   ○   ○     \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo ========================================================================================================================
echo ========================================================================================================================
echo ========================================================================================================================
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
ping localhost -n 2 >nul
:start2
mode 120,30
cls
echo ///////// Witam !!! \\\\\\\\\\
echo ===========================
echo Wybierz:
echo 1. Graj online
echo 2. Graj offline
echo 3. Ustawienia
echo 4. Wyjdź\Laguna?/
set /p menu=
if "%menu%"=="1" goto loby
if "%menu%"=="2" goto offline 
if "%menu%"=="3" goto optio
if "%menu%"=="4" exit
pause


:optio
cls 
echo A.Wybierz kolor tła     
echo B.Wybierz kolor liter
echo C.Powrót do menu
choice /c:abc /n
if ERRORLEVEL 3 goto start2
if ERRORLEVEL 2 goto olitery
if ERRORLEVEL 1 goto okolor


:okolor
cls
color %mm%%y%
echo A.Wybierz kolor tła:
echo 1. Zielony
echo 2. Jasno niebieski
echo 3. Czerwony
echo 4. Czarny
echo 5. Żółty
echo 6. Powrót
echo B.Wybierz kolor liter:
echo C.Powrót do menu
choice /c:123456bc /n

if ERRORLEVEL 8 goto start2

if ERRORLEVEL 7 goto olitery

if ERRORLEVEL 6 goto option

if ERRORLEVEL 5 set mm=6&goto okolor

if ERRORLEVEL 4 set mm=0&goto okolor

if ERRORLEVEL 3 set mm=4&goto okolor

if ERRORLEVEL 2 set mm=B&goto okolor

if ERRORLEVEL 1 set mm=A&goto okolor
goto okolor


:olitery
cls
color %mm%%y%
echo A.Wybierz kolor tła:
echo B.Wybierz kolor liter:
echo 1. Czarny 
echo 2. Czerwony
echo 3. Niebieski
echo 4. Biały
echo 5. Zielony
echo 6. Żółty
echo 7. Powrót
echo C.Powrót do menu
choice /c:a1234567c /n

if ERRORLEVEL 9 goto start2

if ERRORLEVEL 8 goto option

if ERRORLEVEL 7 set y=6&goto olitery

if ERRORLEVEL 6 set y=A&goto olitery

if ERRORLEVEL 5 set y=7&goto olitery

if ERRORLEVEL 4 set y=1&goto olitery

if ERRORLEVEL 3 set y=4&goto olitery

if ERRORLEVEL 2 set y=0&goto olitery

if ERRORLEVEL 1 goto okolor
goto olitery


:loby
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get serinfo.txt
echo disconnect
echo bye)>infoser.txt
cls
echo 1. Dołącz do pokoju
echo 2. Stwórz pokój
echo 3. Wróć
set /p ppl=
if "%ppl%"=="1" goto dol
if "%ppl%"=="2" goto stw
if "%ppl%"=="3" goto start2


:dol
set zot=1
cls
echo 1. Wyszukaj pokój
echo 2. Wybierz z listy pokoji
echo 3. Wróć
set /p ll=
if "%ll%"=="1" goto wszp
if "%ll%"=="2" goto wbierzpp
if "%ll%"=="3" goto loby


:wszp
cls
ftp -s:infoser.txt >nul
cls
echo /// Wyszukiwarka \\\
echo Wpisz nazwe pokoju:
set /p "nazwapokoju=>>"
if "%nazwapokoju%"=="stop" goto dol
for /f "delims== tokens=2" %%a in (serinfo.txt) do (
echo %%a | find "%nazwapokoju%" >nul
if !errorlevel!==0 set ost=0
if !errorlevel!==1 set ot=1
)
if "%ost%"=="0" goto llkk
if "%ot%"=="1" goto nieistnieje
pause


:nieistnieje
cls
endlocal
echo Nie istnieje taka nazwa pokoju !!!
echo Jeśli chcesz wrócić wpisz w pole wyszukiwania "stop".
setlocal enabledelayedexpansion
pause
goto wszp


:wbierzpp
cls
ftp -s:infoser.txt >nul
cls
echo Pokoje:
for /f "delims== tokens=2" %%a in (serinfo.txt) do (
echo %%a
)
echo Wpisz  "<-" aby wrócić
echo Wpisz nazwe pokoju do którego chcesz dołączyć:
set /p "wybur=>>"
if "wybur"=="<-" goto dol 
for /f "delims== tokens=2" %%a in (serinfo.txt) do (
echo %%a | find "%wybur%" >nul
if !errorlevel!==0 set zost=0
if !errorlevel!==1 set zot=1
)
if "%zost%"=="0" goto llkkl
if "%zot%"=="1" goto wbierzpp


:llkk
set serwer=%nazwapokoju%
goto lkkl
:llkkl
set serwer=%wybur%
:lkkl
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get info%serwer%.txt
echo disconnect
echo bye)>infohas.txt
cls
ftp -s:infohas.txt >nul
for /f "tokens=*" %%i in (info%serwer%.txt) do set %%i
if "%gracze%"=="1" goto dalejzzz
if "%gracze%"=="2" goto zajetekon
:dalejzzz
for /f "delims== tokens=1" %%i in (info%serwer%.txt) do (
echo %%i | find "haloo" >nul
if !errorlevel!==1 set zhost=1
if !errorlevel!==2 set zhot=0
)
if "%zhot%"=="0" goto nieznalhas
if "%zhost%"=="1" goto znalhas

:zajetekon
cls
endlocal
echo Pokój jest już pełny !!!
setlocal enabledelayedexpansion
pause
goto wbierzpp


:znalhas
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get halloo%serwer%.txt
echo disconnect
echo bye)>infpobierzha.txt
set "dolhaslo="
set "has="
cls
echo Podaj hasło do pokoju:
set /p "dolhaslo=>>"
ftp -s:infpobierzha.txt >nul
for /f "tokens=*" %%a in (halloo%serwer%.txt) do set %%a
cls
set has=%has%
if "%dolhaslo%"=="wracam" (
	del halloo%serwer%.txt
	del infpobierzha.txt
	goto dol
)
if "%dolhaslo%"=="%has%" (
	del halloo%serwer%.txt
	del infpobierzha.txt
	goto nieznalhas
)
if not "%dolhaslo%"=="%has%" (
	del halloo%serwer%.txt
	del infpobierzha.txt
	goto zle
)


:zle
cls
echo Podales/as zle haslo sprobuj ponownie !!!
echo Jesli chcesz wrocic do menu wpisz w polu hasla "wracam"
pause
goto znalhas

:nieznalhas
cls
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put info%serwer%.txt
echo disconnect
echo bye)>infocz.txt
echo Wpisz swoją nazwe:
set janazw=0
set /p "nickdol=>>"
set czk1k=11
set gracze=2
(echo nickdol=%nickdol%
echo czk1k=%czk1k%
echo gracze=%gracze%)>>info%serwer%.txt
ftp -s:infocz.txt >nul
goto hdalej


:stw
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put serinfo.txt
echo disconnect
echo bye)>infoserw.txt
cls
echo Wpisz swoją nazwe/nick:
set janazw=1
set /p "nickstw=>>"
:nazwapo
cls
echo Niedozwolona nazwa: "<-"
echo Wpisz nazwe pokoju:
set /p "serwer=>>"
ftp -s:infoser.txt >nul
for /f "tokens=*" %%a in (serinfo.txt) do set %%a
if "%serwer%"=="<-" goto nieodpow
if "%serwer%"=="%ser1%" goto zajeta
if not "%serwer%"=="%ser1%" goto dallej
pause


:nieodpow
cls
echo Nazwa pokoju jest niedozowlona.
pause
goto nazwapo 


:zajeta
cls
echo Nazwa pokoju jest już zajetą.
pause>nul
goto nazwapo

:dallej
(echo ser1=%serwer%)>>serinfo.txt
ftp -s:infoserw.txt >nul
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put info%serwer%.txt
echo disconnect
echo bye)>infohaslo.txt
set gracze=1
(echo gracze=%gracze%
echo nickstw=%nickstw%)>>info%serwer%.txt
ftp -s:infohaslo.txt >nul
cls
echo Czy chcesz mieć haslo ? tak/nie
set /p odp=
if "%odp%"=="tak" goto hstop
if "%odp%"=="nie" goto hdalej

:hdalej
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get info%serwer%.txt
echo disconnect
echo bye)>infolo.txt
:hdalej2
ftp -s:infolo.txt >nul
ping localhost -n 2 >nul
for /f "tokens=*" %%a in (info%serwer%.txt) do set %%a
cls
echo.
echo Poczkaj na  drugiego gracza...
echo.
if "%czk1k%"=="11" goto zacznijgra
if not "%czk1k%"=="11" goto hdalej2
pause>nul

:hstop
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put halloo%serwer%.txt
echo disconnect
echo bye)>infhalloo.txt
cls
echo Nazwa pokoju: %serwer%
echo Wpisz hasło do loby 
set /p "haloo=>>"
(echo haloo=jesthaslo)>>info%serwer%.txt
(echo has=%haloo%)>halloo%serwer%.txt
ftp -s:infohaslo.txt >nul
ftp -s:infhalloo.txt >nul
del halloo%serwer%.txt
del infhalloo.txt
goto hdalej

:zacznijgra
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get "ckas%serwer%.txt"
echo binary
echo get "cka%serwer%.txt"
echo disconnect
echo bye)>ckaftp.txt
set onlwybur=0 
set postaw=0
:start1
cls
echo Nazwa gospodarza: %nickstw%
echo Nazwa gościa: %nickdol%
echo 1. Zacznij grę w kółko i krzyżyk
echo 2. Czat
echo 3. Wróć do głównego menu
set /p rr=
if "%rr%"=="1" goto sftps
if "%rr%"=="2" goto daneczatu
if "%rr%"=="3" goto koniecgryy


:koniecgryy
del serinfo.txt
del infoser.txt
del info%serwer%.txt
del infocz.txt
del infohas.txt
del infolo.txt
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo delete info%serwer%.txt
echo disconnect
echo bye)>ftpkasuj.txt
ftp -s:ftpkasuj. >nul
del ftpkasuj.txt
goto start2


:sftps
ftp -s:ckaftp.txt >nul
for /f "tokens=*" %%a in (ckas%serwer%.txt) do set %%a
if "%postaw%"=="0" goto gra
if "%postaw%"=="1" goto gra2


:daneczatu
cls
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put danewiadomosc%serwer%.txt
echo disconnect
echo bye)>ftpczat.txt
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get danewiadomosc%serwer%.txt
echo disconnect
echo bye)>wftpczat.txt
start odczytczat.bat
cls
:czat2
echo - Wpisz "\stop" aby wyjść z czatu
echo - Po wyjściu z czatu wiadomości zostaną usunięte
:czat3
set /p "wiadomosc=>>"
if "%wiadomosc%"=="\stop" goto wyjdz
(echo wiadomosc=%wiadomosc%)>>danewiadomosc%serwer%.txt
ftp -s:ftpczat.txt >nul
goto czat3

:wyjdz
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo delete danewiadomosc%serwer%.txt
echo disconnect
echo bye)>ftpusun.txt
cls
ftp -s:ftpusun.txt >nul
del ftpusun.txt
del ftpczat.txt
del wftpczat.txt
del danewiadomosc%serwer%.txt
goto start1


:gra2
cls
echo Przeciwnik właśnie wybiera postać
echo Wciśnij dowolny przycisk aby wrocić
pause>nul
goto start1

:gra
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put "ckas%serwer%.txt"
echo binary
echo put "cka%serwer%.txt"
echo disconnect
echo bye)>wckaftp.txt
ftp -s:ckaftp.txt >nul
for /f "tokens=*" %%a in (ckas%serwer%.txt) do set %%a
if "%onlwybur%"=="2" goto akrzyzyk
if "%onlwybur%"=="1" goto akolko
set postaw=1
(echo postaw=%postaw%)>>ckas%serwer%.txt
ftp -s:wckaftp.txt >nul
cls
echo Wybierz swój znak!
echo 1.
echo       _      _°
echo ǀ/ ǀ)  / \./  / \./ ǀ/
echo ǀ\ ǀ\ /_  ǀ  /_  ǀ  ǀ\
echo 2.
echo     /
echo ǀ/ /\  ǀ/ ǀ/ /\
echo ǀ\ \/ /ǀ_ ǀ\ \/
echo.
set /p wyburp=
if %wyburp%== 1 goto krzyzyk
if %wyburp%== 2 goto kolko
:akrzyzyk
cls 
echo Zostaleś/aś autmoatycznie wybrany/na na krzyzyk(X), gdyż przeciwnik wcześniej wybrał kółko(O)
ping localhost -n 5 >nul
goto krzyzyk
:krzyzyk
cls
set postaw=0
set onlwybur=1
(echo postaw=%postaw%
echo onlwybur=%onlwybur%)>>ckas%serwer%.txt
ftp -s:wckaftp.txt >nul
if "%janazw%"=="1" set nazwa=%nickstw%(X)
if "%janazw%"=="0" set nazwa=%nickdol%(X)
goto zacznij
:akolko
cls 
echo Zostaleś/aś autmoatycznie wybrany/na na kolko(O), gdyż przeciwnik wcześniej wybrał krzyżyk(X)
ping localhost -n 4 >nul
goto kolko
:kolko
cls
set postaw=0
set onlwybur=2
(echo postaw=%postaw%
echo onlwybur=%onlwybur%)>>ckas%serwer%.txt
ftp -s:wckaftp.txt >nul
if "%janazw%"=="1" set nazwa=%nickstw%(O)
if "%janazw%"=="0" set nazwa=%nickdol%(O)
goto zacznij
:zacznij
cls
echo Zaczynajmy !
pause
timeout /t  2>nul
cls
echo Krzyżyk zaczyna (X)
echo.
ping localhost -n 2 >nul
echo     \  /
echo      \/
echo      /\
echo     /  \
ping localhost -n 2 >nul
goto dane

 
:dane
cls
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo put "danekiko%serwer%.txt"
echo disconnect
echo bye)>ftpkiko.txt
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo ascii
echo prompt
echo get "danekiko%serwer%.txt"
echo disconnect
echo bye)>ftpkiko1.txt
set w=0
set ck55=02
set ris=0
set kk= 
set k1= 
set k2= 
set k3= 
set k4= 
set k5= 
set k6= 
set k7= 
set k8= 
set k9= 
goto ockna
:ockna
ftp -s:ckaftp.txt >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
for /f "tokens=*" %%a in (cka%serwer%.txt) do set %%a
goto ockna2
:ockna2
cls
echo.
echo Poczkaj na ruch gracza...
echo.
if "%w%"=="1" goto wygrana2
if "%w%"=="2" goto remis2
if %nazwa% EQU %nickstw%(X) if "%ck55%"=="02" goto plansza12
if %nazwa% EQU %nickdol%(X) if "%ck55%"=="02" goto plansza12
if %nazwa% EQU %nickstw%(X) if not "%ck55%"=="02" goto ockna
if %nazwa% EQU %nickdol%(X) if not "%ck55%"=="02" goto ockna
if %nazwa% EQU %nickstw%(O) if "%ck55%"=="11" goto plansza12
if %nazwa% EQU %nickdol%(O) if "%ck55%"=="11" goto plansza12
if %nazwa% EQU %nickstw%(O) if not "%ck55%"=="11" goto ockna
if %nazwa% EQU %nickdol%(O) if not "%ck55%"=="11" goto ockna

:plansza12
cls
ftp -s:ftpkiko1.txt >nul
ping localhost -n 2 >nul
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
:plansza1
cls
if %nazwa% EQU %nickstw%(X) set kk="%nickdol%"
if %nazwa% EQU %nickdol%(X) set kk="%nickstw%"
if %nazwa% EQU %nickstw%(O) set kk="%nickdol%"
if %nazwa% EQU %nickdol%(O) set kk="%nickstw%"
cls
echo Kolej: %nazwa% 
echo Grasz z %kk%
echo.
echo.
echo.
echo.
echo.
echo                                                  Sterowanie pomocnicze:
echo                                                  -klawiatura numeryczna
echo                                                  (każda liczba jest powiazana z miejscem gdzie wstawisz X lub O)
echo          %k7%  I  %k8%  I  %k9%                             num 7  I num 8  I num 9   
echo       -------------------                        -------------------
echo          %k4%  I  %k5%  I  %k6%                             num 4  I num 5  I num 6   
echo       -------------------                        -------------------
echo          %k1%  I  %k2%  I  %k3%                             num 1  I num 2  I num 3   
echo                                                  (R)-odświeżenie planszy
echo.
echo.
echo.
if "%k1%"=="X" if "%k2%"=="X" if "%k3%"=="X" set zx=1&goto wygrana
if "%k1%"=="O" if "%k2%"=="O" if "%k3%"=="O" set zx=0&goto wygrana
if "%k4%"=="X" if "%k5%"=="X" if "%k6%"=="X" set zx=1&goto wygrana
if "%k4%"=="O" if "%k5%"=="O" if "%k6%"=="O" set zx=0&goto wygrana
if "%k7%"=="X" if "%k8%"=="X" if "%k9%"=="X" set zx=1&goto wygrana
if "%k7%"=="O" if "%k8%"=="O" if "%k9%"=="O" set zx=0&goto wygrana
if "%k7%"=="X" if "%k4%"=="X" if "%k1%"=="X" set zx=1&goto wygrana
if "%k7%"=="O" if "%k4%"=="O" if "%k1%"=="O" set zx=0&goto wygrana
if "%k5%"=="X" if "%k8%"=="X" if "%k2%"=="X" set zx=1&goto wygrana
if "%k5%"=="O" if "%k8%"=="O" if "%k2%"=="O" set zx=0&goto wygrana
if "%k3%"=="X" if "%k6%"=="X" if "%k9%"=="X" set zx=1&goto wygrana
if "%k3%"=="O" if "%k6%"=="O" if "%k9%"=="O" set zx=0&goto wygrana
if "%k3%"=="X" if "%k5%"=="X" if "%k7%"=="X" set zx=1&goto wygrana
if "%k3%"=="O" if "%k5%"=="O" if "%k7%"=="O" set zx=0&goto wygrana
if "%k1%"=="X" if "%k5%"=="X" if "%k9%"=="X" set zx=1&goto wygrana
if "%k1%"=="O" if "%k5%"=="O" if "%k9%"=="O" set zx=0&goto wygrana
if %ris% GEQ 9 goto remis2


:ruch
choice /c:123456789r  /n
if ERRORLEVEL 10 goto plansza12

if ERRORLEVEL 9 goto num9

if ERRORLEVEL 8 goto num8

if ERRORLEVEL 7 goto num7

if ERRORLEVEL 6 goto num6

if ERRORLEVEL 5 goto num5

if ERRORLEVEL 4 goto num4

if ERRORLEVEL 3 goto num3

if ERRORLEVEL 2 goto num2

if ERRORLEVEL 1 goto num1


:num1
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k1%"=="X" goto plansza1
if "%k1%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k1=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k1=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k1=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k1=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num2
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k2%"=="X" goto plansza1
if "%k2%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k2=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k2=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k2=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k2=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num3
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k3%"=="X" goto plansza1
if "%k3%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k3=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k3=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k3=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k3=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num4
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k4%"=="X" goto plansza1
if "%k4%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k4=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k4=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k4=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k4=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num5
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k5%"=="X" goto plansza1
if "%k5%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k5=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k5=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k5=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k5=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num6
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k6%"=="X" goto plansza1
if "%k6%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k6=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k6=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k6=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k6=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num7
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k7%"=="X" goto plansza1
if "%k7%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k7=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k7=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k7=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k7=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num8
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k8%"=="X" goto plansza1
if "%k8%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k8=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k8=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k8=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k8=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji

:num9
cls
for /f "tokens=*" %%a in (danekiko%serwer%.txt) do set %%a
if "%k9%"=="X" goto plansza1
if "%k9%"=="O" goto plansza1
if "%nazwa%"=="%nickstw%(X)" (set k9=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickdol%(X)" (set k9=X
	set /a ris=%ris%+1
	set ck55=11)
if "%nazwa%"=="%nickstw%(O)" (set k9=O
	set /a ris=%ris%+1
	set ck55=02)
if "%nazwa%"=="%nickdol%(O)" (set k9=O
	set /a ris=%ris%+1
	set ck55=02)
goto wyslidanepozycji


:wyslidanepozycji
(echo  k1=%k1%
echo  k2=%k2%
echo  k3=%k3%
echo  k4=%k4%
echo  k5=%k5%
echo  k6=%k6%
echo  k7=%k7%
echo  k8=%k8%
echo  k9=%k9%
echo  ris=%ris%)>danekiko%serwer%.txt
ftp -s:ftpkiko.txt >nul
ping localhost -n 2 >nul
(echo ck55=%ck55%)>cka%serwer%.txt
ftp -s:wckaftp.txt >nul
goto ockna


:remis2
set w=2
(echo w=%w%)>>cka%serwer%.txt
ftp -s:wckaftp.txt
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo delete danekiko%serwer%.txt
echo delete cka%serwer%.txt
echo delete ckas%serwer%.txt
echo disconnect
echo bye)>dd.txt
del cka%serwer%.txt
del ckas%serwer%.txt
del danekiko%serwer%.txt
del ftpkiko.txt
del ftpkiko1.txt
del ckaftp.txt
del wckaftp.txt
cls
echo Remis. :\
echo 1. Wróci do menu
echo 2. Wyjdź
set /p reim=
if %reim%== 1 del ckaftp.txt&ftp -s:dd.txt&del dd.txt&goto start1
if %reim%== 2 (
del ckaftp.txt
ftp -s:dd.txt >nul
del dd.txt
del serinfo.txt
del infoser.txt
del info%serwer%.txt
del infocz.txt
del infohas.txt
del infolo.txt
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo delete info%serwer%.txt
echo disconnect
echo bye)>ftpkasuj.txt
ftp -s:ftpkasuj.txt >nul
del ftpkasuj.txt
exit
)


:wygrana
set w=1
(echo w=%w%
echo zx=%zx%)>>cka%serwer%.txt
ftp -s:wckaftp.txt >nul
cls
:wygrana2
cls
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo delete danekiko%serwer%.txt
echo delete cka%serwer%.txt
echo delete ckas%serwer%.txt
echo disconnect
echo bye)>dd.txt
del ckas%serwer%.txt
del cka%serwer%.txt
del danekiko%serwer%.txt
del ftpkiko.txt
del ftpkiko1.txt
del ckaftp.txt
del wckaftp.txt
cls
if %nazwa% equ %nickstw%(X) set xxx=0
if %nazwa% equ %nickstw%(O) set xxx=1
if %nazwa% equ %nickdol%(X) set xxx=2
if %nazwa% equ %nickdol%(O) set xxx=3
if %zx% equ 1 if %xxx% equ 0 set nazwa=%nickstw%
if %zx% equ 1 if %xxx% equ 2 set nazwa=%nickdol%
if %zx% equ 1 if %xxx% equ 1 set nazwa=%nickdol%
if %zx% equ 1 if %xxx% equ 3 set nazwa=%nickstw%
if %zx% equ 0 if %xxx% equ 0 set nazwa=%nickdol%
if %zx% equ 0 if %xxx% equ 2 set nazwa=%nickstw%
if %zx% equ 0 if %xxx% equ 1 set nazwa=%nickstw%
if %zx% equ 0 if %xxx% equ 3 set nazwa=%nickdol%
echo Wygrał/a:%nazwa% 
echo Brawo !
echo 1. Wróci do menu
echo 2. Wyjdź
set /p reim=
if "%reim%"=="1" del ckaftp.txt&ftp -s:dd.txt&del dd.txt&goto start1 
if "%reim%"=="2" (del ckaftp.txt
ftp -s:dd.txt >nul
del dd.txt
del serinfo.txt
del infoser.txt
del info%serwer%.txt
del infocz.txt
del infohas.txt
del infolo.txt
(echo open %SerwerFTP%
echo %LoginFTP%
echo %HasloFTP%
echo cd /serwer
echo delete info%serwer%.txt
echo disconnect
echo bye)>ftpkasuj.txt
ftp -s:ftpkasuj.txt >nul
del ftpkasuj.txt
exit
)



:offline
cls
endlocal
echo 1. Graj w kółko i krzyżyk z komputerem
echo 2. Graj w kółko i krzyżyk w dwie osoby
echo 3. Wróć
set /p mennu=
if %mennu%== 1 goto graai
if %mennu%== 2 goto gradwi
if %mennu%== 3 goto start2


:graai
cls
set ai=1
echo Wybierz czym chcesz być!
echo 1.
echo       _      _°
echo ǀ/ ǀ)  / \./  / \./ ǀ/
echo ǀ\ ǀ\ /_  ǀ  /_  ǀ  ǀ\
echo 2.
echo     /
echo ǀ/ /\  ǀ/ ǀ/ /\
echo ǀ\ \/ /ǀ_ ǀ\ \/
echo.
set /p wp=
if %wp%== 1 goto krzyzzyk
if %wp%== 2 goto kolkko
:krzyzzyk
cls
echo Nick gracza("X"):
set /p "nick1=>>"
set nick2=komputer
set ja=0
cls 
echo Zaczynajmy !! :D
pause
timeout /t 1>nul
goto dane111
:kolkko
cls
echo Nick gracza("O"):
set /p "nick2=>>"
set nick1=komputer
set ja=1
cls 
echo Zaczynajmy !! :D
pause
cls
echo Krzyzyk zaczyna (X)
ping localhost -n 2 >nul
goto dane111


:gradwi
cls
set ai=0
echo Nick pierwszego gracza("X"):
set /p "nick1=>>"
cls
echo Nick drugiego gracza("O"):
set /p "nick2=>>"
cls 
echo Zaczynajmy !! :D
pause
cls
echo Krzyzyk zaczyna (X)
ping localhost -n 2 >nul
goto dane111


:dane111
cls
set liczenie=1
set /a liczenie=%liczenie%+1
set naz=num%random:~0,1%
set n1=0
set n2=0
set n3=0
set n4=0
set n5=0
set n6=0
set n7=0
set n8=0
set n9=0
set remis=0
set zx=1
set nazwa=1
set k1= 
set k2= 
set k3= 
set k4= 
set k5= 
set k6= 
set k7= 
set k8= 
set k9= 
goto pplansza1
:nazwa11
if %zx%== 1 set zx=0 & goto pplansza1
if %zx%== 0 set zx=1 & goto pplansza1
:pplansza1
cls
if %zx% EQU 1 set nazwa=%nick1%(X)
if %zx% EQU 0 set nazwa=%nick2%(O)
echo Kolej: %nazwa% 
echo.
echo.
echo.
echo.
echo.
echo                                                  Sterowanie pomocnicze:
echo                                                  -klawiatura numeryczna
echo                                                  (każda liczba jest powiązana z miejscem gdzie wstawisz X lub O)
echo          %k7%  I  %k8%  I  %k9%                             num 7  I num 8  I num 9   
echo       -------------------                        -------------------
echo          %k4%  I  %k5%  I  %k6%                             num 4  I num 5  I num 6   
echo       -------------------                        -------------------
echo          %k1%  I  %k2%  I  %k3%                             num 1  I num 2  I num 3   
echo.
echo.
echo.
echo.
if "%k1%"=="X" if "%k2%"=="X" if "%k3%"=="X" goto wygranaa
if "%k1%"=="O" if "%k2%"=="O" if "%k3%"=="O" goto wygranaa
if "%k4%"=="X" if "%k5%"=="X" if "%k6%"=="X" goto wygranaa
if "%k4%"=="O" if "%k5%"=="O" if "%k6%"=="O" goto wygranaa
if "%k7%"=="X" if "%k8%"=="X" if "%k9%"=="X" goto wygranaa
if "%k7%"=="O" if "%k8%"=="O" if "%k9%"=="O" goto wygranaa
if "%k7%"=="X" if "%k4%"=="X" if "%k1%"=="X" goto wygranaa
if "%k7%"=="O" if "%k4%"=="O" if "%k1%"=="O" goto wygranaa
if "%k5%"=="X" if "%k8%"=="X" if "%k2%"=="X" goto wygranaa
if "%k5%"=="O" if "%k8%"=="O" if "%k2%"=="O" goto wygranaa
if "%k3%"=="X" if "%k6%"=="X" if "%k9%"=="X" goto wygranaa
if "%k3%"=="O" if "%k6%"=="O" if "%k9%"=="O" goto wygranaa
if "%k3%"=="X" if "%k5%"=="X" if "%k7%"=="X" goto wygranaa
if "%k3%"=="O" if "%k5%"=="O" if "%k7%"=="O" goto wygranaa
if "%k1%"=="X" if "%k5%"=="X" if "%k9%"=="X" goto wygranaa
if "%k1%"=="O" if "%k5%"=="O" if "%k9%"=="O" goto wygranaa
if %remis% EQU 9 goto remiss2
if %ai% equ 0 goto ruchh
if %ai% equ 1 (
	if %zx% EQU %ja% echo Wciśnij dowolny przycisk aby kontynuować...
	if %zx% EQU %ja% pause>nul
	if %ja% equ 1 goto XXX
	if %ja% equ 0 goto OOO
)

:XXX
if %ai% equ 1 if %zx% EQU %ja% (
	if %n1% equ 0 if "%k3%"=="X" if "%k2%"=="X" set n1=1 & goto nnum1
	if %n1% equ 0 if "%k7%"=="X" if "%k4%"=="X" set n1=1 & goto nnum1
	if %n1% equ 0 if "%k5%"=="X" if "%k9%"=="X" set n1=1 & goto nnum1
	if %n2% equ 0 if "%k1%"=="X" if "%k3%"=="X" set n2=1 & goto nnum2
	if %n2% equ 0 if "%k5%"=="X" if "%k8%"=="X" set n2=1 & goto nnum2
	if %n3% equ 0 if "%k1%"=="X" if "%k2%"=="X" set n3=1 & goto nnum3
	if %n3% equ 0 if "%k6%"=="X" if "%k9%"=="X" set n3=1 & goto nnum3
	if %n3% equ 0 if "%k7%"=="X" if "%k5%"=="X" set n3=1 & goto nnum3
	if %n4% equ 0 if "%k5%"=="X" if "%k6%"=="X" set n4=1 & goto nnum4
	if %n4% equ 0 if "%k1%"=="X" if "%k7%"=="X" set n4=1 & goto nnum4
	if %n5% equ 0 if "%k1%"=="X" if "%k9%"=="X" set n5=1 & goto nnum5
	if %n5% equ 0 if "%k3%"=="X" if "%k7%"=="X" set n5=1 & goto nnum5
	if %n5% equ 0 if "%k2%"=="X" if "%k8%"=="X" set n5=1 & goto nnum5
	if %n5% equ 0 if "%k4%"=="X" if "%k6%"=="X" set n5=1 & goto nnum5
	if %n6% equ 0 if "%k4%"=="X" if "%k5%"=="X" set n6=1 & goto nnum6
	if %n6% equ 0 if "%k3%"=="X" if "%k9%"=="X" set n6=1 & goto nnum6
	if %n7% equ 0 if "%k4%"=="X" if "%k1%"=="X" set n7=1 & goto nnum7
	if %n7% equ 0 if "%k8%"=="X" if "%k9%"=="X" set n7=1 & goto nnum7
	if %n7% equ 0 if "%k3%"=="X" if "%k5%"=="X" set n7=1 & goto nnum7
	if %n8% equ 0 if "%k5%"=="X" if "%k2%"=="X" set n8=1 & goto nnum8
	if %n8% equ 0 if "%k9%"=="X" if "%k7%"=="X" set n8=1 & goto nnum8
	if %n9% equ 0 if "%k1%"=="X" if "%k5%"=="X" set n9=1 & goto nnum9
	if %n9% equ 0 if "%k7%"=="X" if "%k8%"=="X" set n9=1 & goto nnum9
	if %n9% equ 0 if "%k3%"=="X" if "%k6%"=="X" set n9=1 & goto nnum9
)
if %ai% equ 1 if %ja% equ 1 goto OOO
if %ai% equ 1 if %ja% equ 0 goto lospplansza1


:OOO
if %ai% equ 1 if %zx% EQU %ja% (
	if %n1% equ 0 if "%k5%"=="O" if "%k9%"=="O" set n1=1 & goto nnum1
	if %n1% equ 0 if "%k7%"=="O" if "%k4%"=="O" set n1=1 & goto nnum1
	if %n1% equ 0 if "%k3%"=="O" if "%k2%"=="O" set n1=1 & goto nnum1
	if %n2% equ 0 if "%k1%"=="O" if "%k3%"=="O" set n2=1 & goto nnum2
	if %n2% equ 0 if "%k5%"=="O" if "%k8%"=="O" set n2=1 & goto nnum2
	if %n3% equ 0 if "%k1%"=="O" if "%k2%"=="O" set n3=1 & goto nnum3
	if %n3% equ 0 if "%k6%"=="O" if "%k9%"=="O" set n3=1 & goto nnum3
	if %n3% equ 0 if "%k7%"=="O" if "%k5%"=="O" set n3=1 & goto nnum3
	if %n4% equ 0 if "%k1%"=="O" if "%k7%"=="O" set n4=1 & goto nnum4
	if %n4% equ 0 if "%k5%"=="O" if "%k6%"=="O" set n4=1 & goto nnum4
	if %n5% equ 0 if "%k1%"=="O" if "%k9%"=="O" set n5=1 & goto nnum5
	if %n5% equ 0 if "%k3%"=="O" if "%k7%"=="O" set n5=1 & goto nnum5
	if %n5% equ 0 if "%k2%"=="O" if "%k8%"=="O" set n5=1 & goto nnum5
	if %n5% equ 0 if "%k4%"=="O" if "%k6%"=="O" set n5=1 & goto nnum5
	if %n6% equ 0 if "%k4%"=="O" if "%k5%"=="O" set n6=1 & goto nnum6
	if %n6% equ 0 if "%k3%"=="O" if "%k9%"=="O" set n6=1 & goto nnum6
	if %n7% equ 0 if "%k4%"=="O" if "%k1%"=="O" set n7=1 & goto nnum7
	if %n7% equ 0 if "%k8%"=="O" if "%k9%"=="O" set n7=1 & goto nnum7
	if %n7% equ 0 if "%k3%"=="O" if "%k5%"=="O" set n7=1 & goto nnum7
	if %n8% equ 0 if "%k5%"=="O" if "%k2%"=="O" set n8=1 & goto nnum8
	if %n8% equ 0 if "%k9%"=="O" if "%k7%"=="O" set n8=1 & goto nnum8
	if %n9% equ 0 if "%k1%"=="O" if "%k5%"=="O" set n9=1 & goto nnum9
	if %n9% equ 0 if "%k7%"=="O" if "%k8%"=="O" set n9=1 & goto nnum9
	if %n9% equ 0 if "%k3%"=="O" if "%k6%"=="O" set n9=1 & goto nnum9
)
if %ai% equ 1 if %ja% equ 1 goto lospplansza1
if %ai% equ 1 if %ja% equ 0 goto XXX


:lospplansza1
if %ai% equ 1 (
	set naz=num%random:~0,1%
	set naz=num%random:~0,1%
	set naz=num%random:~0,1%
	set /a liczbalosowana=%random:~0,1%+3
	if %liczenie% equ 4 set liczenie=1 & set naz=num%liczbalosowana%
)
if %ai% equ 1 if %zx% EQU %ja% (
	if %naz% EQU num0 goto lospplansza1
	if %n1% equ 0 if %naz% EQU num1 goto nnum1
	if %n2% equ 0 if %naz% EQU num2 goto nnum2
	if %n3% equ 0 if %naz% EQU num3 goto nnum3
	if %n4% equ 0 if %naz% EQU num4 goto nnum4
	if %n5% equ 0 if %naz% EQU num5 goto nnum5
	if %n6% equ 0 if %naz% EQU num6 goto nnum6
	if %n7% equ 0 if %naz% EQU num7 goto nnum7
	if %n8% equ 0 if %naz% EQU num8 goto nnum8
	if %n9% equ 0 if %naz% EQU num9 goto nnum9
)
if %ai% equ 1 if %zx% EQU %ja% goto lospplansza1 

:ruchh
choice /c:123456789  /n
if ERRORLEVEL 9 goto nnum9

if ERRORLEVEL 8 goto nnum8

if ERRORLEVEL 7 goto nnum7

if ERRORLEVEL 6 goto nnum6

if ERRORLEVEL 5 goto nnum5

if ERRORLEVEL 4 goto nnum4

if ERRORLEVEL 3 goto nnum3

if ERRORLEVEL 2 goto nnum2

if ERRORLEVEL 1 goto nnum1


:nnum1
cls
if "%k1%"=="X" goto pplansza1
if "%k1%"=="O" goto pplansza1
if %ai% equ 1 set n1=1
if %nazwa% EQU %nick1%(X) set k1=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k1=O& set /a remis=%remis%+1
goto nazwa11

:nnum2
cls
if "%k2%"=="X" goto pplansza1
if "%k2%"=="O" goto pplansza1
if %ai% equ 1 set n2=1
if %nazwa% EQU %nick1%(X) set k2=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k2=O& set /a remis=%remis%+1
goto nazwa11

:nnum3
cls
if "%k3%"=="X" goto pplansza1
if "%k3%"=="O" goto pplansza1
if %ai% equ 1 set n3=1
if %nazwa% EQU %nick1%(X) set k3=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k3=O& set /a remis=%remis%+1
goto nazwa11

:nnum4
cls
if "%k4%"=="X" goto pplansza1
if "%k4%"=="O" goto pplansza1
if %ai% equ 1 set n4=1
if %nazwa% EQU %nick1%(X) set k4=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k4=O& set /a remis=%remis%+1
goto nazwa11

:nnum5
cls
if "%k5%"=="X" goto pplansza1
if "%k5%"=="O" goto pplansza1
if %ai% equ 1 set n5=1
if %nazwa% EQU %nick1%(X) set k5=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k5=O& set /a remis=%remis%+1
goto nazwa11

:nnum6
cls
if "%k6%"=="X" goto pplansza1
if "%k6%"=="O" goto pplansza1
if %ai% equ 1 set n6=1
if %nazwa% EQU %nick1%(X) set k6=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k6=O& set /a remis=%remis%+1
goto nazwa11

:nnum7
cls
if "%k7%"=="X" goto pplansza1
if "%k7%"=="O" goto pplansza1
if %ai% equ 1 set n7=1
if %nazwa% EQU %nick1%(X) set k7=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k7=O& set /a remis=%remis%+1
goto nazwa11

:nnum8
cls
if "%k8%"=="X" goto pplansza1
if "%k8%"=="O" goto pplansza1
if %ai% equ 1 set n8=1
if %nazwa% EQU %nick1%(X) set k8=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k8=O& set /a remis=%remis%+1
goto nazwa11

:nnum9
cls
if "%k9%"=="X" goto pplansza1
if "%k9%"=="O" goto pplansza1
if %ai% equ 1 set n9=1
if %nazwa% EQU %nick1%(X) set k9=X& set /a remis=%remis%+1
if %nazwa% EQU %nick2%(O) set k9=O& set /a remis=%remis%+1
goto nazwa11


:remiss2
set naz=num%random:~0,1%
cls
echo Remis. :\
echo 1. Zagraj jeszcze raz
echo 2. Wróci do menu
echo 3. Wyjdź
set /p reim=
if %reim%== 1 goto dane111
if %reim%== 2 goto offline
if %reim%== 3 exit


:wygranaa
set naz=num%random:~0,1%
cls
if %zx%== 1 set zx=0 & goto wygranaa2
if %zx%== 0 set zx=1 & goto wygranaa2
:wygranaa2
if %zx% EQU 1 set nazwa=%nick1%
if %zx% EQU 0 set nazwa=%nick2%
echo Wygrał/a›:%nazwa% !!! :D
pause>nul
echo 1. Zagraj jeszcze raz
echo 2. Wróci do menu
echo 3. Wyjdź
set /p reim=
if %reim%== 1 goto dane111
if %reim%== 2 goto offline
if %reim%== 3 exit