@echo off
echo Starting Network Configuration Reset...

:: ========================================================
:: Batch Script for Network Configuration Reset
:: Code by: Rachit Sharma
:: ========================================================

:: Reset TCP/IP stack
echo Resetting TCP/IP stack...
netsh int ip reset
if %errorlevel% neq 0 (
    echo Error: Failed to reset TCP/IP stack.
) else (
    echo Success: TCP/IP stack reset successfully.
)

:: Reset Winsock
echo Resetting Winsock...
netsh winsock reset
if %errorlevel% neq 0 (
    echo Error: Failed to reset Winsock.
) else (
    echo Success: Winsock reset successfully.
)

:: Release and renew IP address
echo Releasing IP address...
ipconfig /release
if %errorlevel% neq 0 (
    echo Error: Failed to release IP address.
) else (
    echo Success: IP address released successfully.
)

echo Renewing IP address...
ipconfig /renew
if %errorlevel% neq 0 (
    echo Error: Failed to renew IP address.
) else (
    echo Success: IP address renewed successfully.
)

:: Clear DNS cache
echo Clearing DNS cache...
ipconfig /flushdns
if %errorlevel% neq 0 (
    echo Error: Failed to clear DNS cache.
) else (
    echo Success: DNS cache cleared successfully.
)

:: Set DNS server to Google DNS
echo Setting DNS server to Google DNS...
netsh interface ip set dns name="Wi-Fi" source=static addr=8.8.8.8 register=primary
netsh interface ip add dns name="Wi-Fi" addr=8.8.4.4 index=2
if %errorlevel% neq 0 (
    echo Error: Failed to set DNS server.
) else (
    echo Success: DNS server set to Google DNS.
)

:: Enable and reset network adapters
echo Enabling and resetting network adapters...
netsh interface set interface "Wi-Fi" admin=enabled
netsh interface set interface "Ethernet" admin=enabled
if %errorlevel% neq 0 (
    echo Error: Failed to enable network adapters.
) else (
    echo Success: Network adapters enabled successfully.
)

echo Network configuration reset complete.
pause
