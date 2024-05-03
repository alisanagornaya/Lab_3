@echo off
chcp 65001 > nul

rem Перевірка наявності параметру /help або неправильного синтаксису
if "%~1" == "" (
    echo Помилка: Неправильний синтаксис.
    goto :help
)

if "%~1" == "/help" goto :help

rem Перевірка наявності другого параметру (ім'я підкаталогу)
if "%~2" == "" (
    echo Помилка: Неправильний синтаксис.
    goto :help
)

set "target_directory=%~1"
set "subdirectory_name=%~2"

rem Перевірка чи існує вказаний каталог
if not exist "%target_directory%" (
    echo Помилка: Вказаний каталог не існує.
    pause
    exit /b 1
)

rem Перевірка чи каталог є каталогом, а не файлом
if not exist "%target_directory%\" (
    echo Помилка: Вказаний шлях не є каталогом.
    pause
    exit /b 1
)

rem Підрахунок кількості файлів та скритих файлів у каталозі
set /a count=0

for /f %%i in ('dir /b /a-d "%target_directory%" ^| find /c /v ""') do (
    set /a count+=%%i
)

for /f %%i in ('dir /b /a:hidden "%target_directory%" ^| find /c /v ""') do (
    set /a count+=%%i
)

echo Кількість файлів у каталозі "%target_directory%": %count%
pause
exit /b 0

:help
echo Довідка: Використання командного рядка:
echo   part2.bat [шлях_до_каталогу] 
echo.
echo   Шлях_до_каталогу - обов'язковий параметр, шлях до каталогу, у якому шукається підкаталог.
echo.
echo Приклади використання:
echo   part2.bat C:\Назва_каталогу 
pause
exit /b 0