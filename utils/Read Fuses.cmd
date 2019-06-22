@echo off
Call SetPath
color f0
title AvrDude GUI Command Window
@echo.
@echo. trying to connect to device...
avrdude -p ATtiny85 -c stk500v1 -P COM6  -b 19200 -U lfuse:r:"Fuses.raw":r -C%AVRDUDE_CONFIG_FILE%
avrdude -p ATtiny85 -c stk500v1 -P COM6  -b 19200 -U hfuse:r:"HFuse.raw":r -C%AVRDUDE_CONFIG_FILE%
type HFuse.raw >> Fuses.raw
del HFuse.raw
avrdude -p ATtiny85 -c stk500v1 -P COM6  -b 19200 -U efuse:r:"EFuse.raw":r -C%AVRDUDE_CONFIG_FILE%
type EFuse.raw >> Fuses.raw
del EFuse.raw
pause