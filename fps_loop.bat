@echo off
setlocal EnableDelayedExpansion

set TRACE=/data/misc/perfetto-traces/fps.pftrace

:loop
adb shell rm -f %TRACE% >nul 2>&1
adb shell -t perfetto --out %TRACE% --time 5s gfx view wm am sched >nul 2>&1
adb pull %TRACE% fps2.pftrace >nul 2>&1

for /f "usebackq delims=" %%L in (`trace_processor_shell.exe fps2.pftrace ^< fps.sql 2^>^&1`) do (
  set "line=%%L"
  if "!line:~0,2!"=="A:" echo(!line!
)

goto loop
