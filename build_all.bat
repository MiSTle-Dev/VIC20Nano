
@echo off
set GWSH=C:\Gowin\Gowin_V1.9.12_x64\IDE\bin\gw_sh

%GWSH% build_tm138kpro.tcl
%GWSH% build_tm60k.tcl
%GWSH% build_tp25k.tcl
%GWSH% build_tn20k.tcl
%GWSH% build_tp20k.tcl
%GWSH% build_tn9k.tcl
%GWSH% build_tn9k_lcd.tcl
%GWSH% build_tn20k_lcd.tcl
%GWSH% build_tc60k.tcl
%GWSH% build_tc138k.tcl

echo "done."
dir impl\pnr\*.fs

