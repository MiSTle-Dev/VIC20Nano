
@echo off
set GWSH=C:\Gowin\Gowin_V1.9.10.03_x64\IDE\bin\gw_sh

echo.
echo ============ build mega138k pro ===============
echo.
%GWSH% build_tm138k.tcl
echo.
echo ============ build mega 60k  ===============
echo.
%GWSH% build_tm60k.tcl
echo.
echo ============ build primer 25k  ===============
echo.
%GWSH% build_tp25k.tcl
echo.
echo ============ build nano 20k  ===============
echo.
%GWSH% build_tn20k.tcl
echo.
echo ============ build primer 20k  ===============
echo.
%GWSH% build_tp20k.tcl
echo.
echo ============ build nano 9k  ===============
echo.
%GWSH% build_tn9k.tcl

echo "done."
dir impl\pnr\*.fs

