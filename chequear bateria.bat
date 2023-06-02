@echo off
chcp 65001 > nul

echo ¿Desea generar un informe sobre su batería? (s/n): 
set /p choice=

IF /I "%choice%"=="s" (
    REM Ejecutar el comando powercfg para generar el informe de batería
    powercfg /batteryreport

    REM Verificar si se generó el archivo HTML
    IF EXIST "%USERPROFILE%\battery-report.html" (
        REM Abrir el archivo HTML generado
        start "" "%USERPROFILE%\battery-report.html"
    ) ELSE (
        echo No se pudo abrir el informe de batería.
        pause
    )
) ELSE (
    echo Cerrando la ventana...
    timeout /t 2 >nul
)
