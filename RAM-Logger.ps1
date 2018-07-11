$Preload = {
    Clear-Host
    [Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
    $Host.ui.RawUI.WindowTitle = "RAM Logger"
    $Host.UI.RawUI.BackgroundColor = 'Black'
    $Host.UI.RawUI.ForegroundColor = 'Blue'
    $logpath = "D:\MemoryUsageLog.txt"
    .$Lang
}
$Lang = {
    Write-Host "1 - English"
    Write-Host "2 - Українська"
    [string]$lng = Read-Host "Select language / Виберіть мову"
    if($lng -eq 1){
        [string]$l1 = "Welcome to RAM Logger!"
        [string]$l2 = "This app will help you"
        [string]$l3 = "to monitor RAM usage"
        [string]$l4 = "on your PC."
        [string]$l5 = "Version:"
        [string]$l6 = "Developer:"
        [string]$l7 = "Press Enter to begin"
        [string]$l8 = "Type in logging frequency in seconds"
        [string]$l9 = "Logging frequency was set to"
        [string]$l10 = "Seconds"
        [string]$l11 = "Logging started."
        [string]$l12 = "To stop, press 0 key,"
        [string]$l13 = "when app window is active."
        [string]$l14 = "-----BEGIN OF LOG-----"
        [string]$l15 = "-----END OF LOG-----"
        [string]$l16 = "Log file saved:"
        [string]$l17 = "Start logging"
        [string]$l18 = "Change logging frequency"
        [string]$l19 = "Exit"
        [string]$l20 = "Select next action"
        [string]$l21 = "New logging"
        [string]$l22 = "You have entered invalid value!"
        [string]$l23 = "Press Enter to try again"
    }
    elseif($lng -eq 2){
        [string]$l1 = "Вітаємо у RAM Logger!"
        [string]$l2 = "Ця програма допоможе"
        [string]$l3 = "відслідкувати використання"
        [string]$l4 = "оперативної пам'яті комп'ютера."
        [string]$l5 = "Версія:"
        [string]$l6 = "Розробник:"
        [string]$l7 = "Натисніть Enter, щоб розпочати"
        [string]$l8 = "Введіть частоту логування в секундах"
        [string]$l9 = "Встановлено частоту логування"
        [string]$l10 = "Секунд(и)"
        [string]$l11 = "Логування розпочато."
        [string]$l12 = "Щоб зупинити, натисніть клавішу 0,"
        [string]$l13 = "коли вікно програми активне."
        [string]$l14 = "-----ПОЧАТОК ЛОГУВАННЯ-----"
        [string]$l15 = "-----КІНЕЦЬ ЛОГУВАННЯ-----"
        [string]$l16 = "Файл логу збережено:"
        [string]$l17 = "Розпочати логування"
        [string]$l18 = "Змінити частоту логування"
        [string]$l19 = "Вийти"
        [string]$l20 = "Виберіть наступну дію"
        [string]$l21 = "Нове логування"
        [string]$l22 = "Ви ввели неприпустиме значення!"
        [string]$l23 = "Натисніть Enter для повторного вводу"
    }
    else{exit}
    .$About
}
$About = {
    [string]$ver = "1.1.0"
    Write-Host "$l1"
    Write-Host "$l2"
    Write-Host "$l3"
    Write-Host "$l4"
    Write-Host "`n"
    Write-Host "$l5 $ver"
    Write-Host "$l6 MasterDevX"
    Write-Host "`n"
    Read-Host "$l7"
    .$Start
}
$Start = {
    Clear-Host
    try {[decimal]$freq = Read-Host "$l8"}
    catch {.$Invvalue}
    $freq = [math]::Round($freq, 0)
    if($freq -lt 1){.$Invvalue}
    Write-Host "$l9 $freq $l10"
    .$Ask
}
$Prelog = {
    Clear-Host
    Write-Host "$l11"
    Write-Host "$l12"
    Write-Host "$l13"
    Write-Host "`n"
    $startmsg = "$l14"
    Write-Host "$startmsg"
    $startmsg | Out-File -filepath $logpath -Append String
    $mainram = Get-Ciminstance Win32_OperatingSystem
    [decimal]$total = $mainram.TotalVisibleMemorySize/1024/1024
    $xtotal = $total | % {$_.ToString("0.000")}
    [decimal]$minuseds = $total
    [decimal]$minusedp = 100
    [decimal]$maxuseds = 0
    [decimal]$maxusedp = 0
    .$Startlog
}
$Startlog = {
    $mainram = Get-Ciminstance Win32_OperatingSystem
    [decimal]$crtuseds = ($mainram.TotalVisibleMemorySize - $mainram.FreePhysicalMemory)/1024/1024
    [int]$crtusedp = $crtuseds*100/$total
    if($crtuseds -lt $minuseds){$minuseds = $crtuseds}
    if($crtusedp -lt $minusedp){$minusedp = $crtusedp}
    if($crtuseds -gt $maxuseds){$maxuseds = $crtuseds}
    if($crtusedp -gt $maxusedp){$maxusedp = $crtusedp}
    $timestamp = Get-Date -format "HH:mm:ss"
    $xcrtuseds = $crtuseds | % {$_.ToString("0.000")}
    $xcrtusedp = $crtusedp | % {$_.ToString("000")}
    $xminuseds = $minuseds | % {$_.ToString("0.000")}
    $xminusedp = $minusedp | % {$_.ToString("000")}
    $xmaxuseds = $maxuseds | % {$_.ToString("0.000")}
    $xmaxusedp = $maxusedp | % {$_.ToString("000")}
    $log = "[$timestamp] Current: $xcrtuseds Gb / $xtotal Gb ($xcrtusedp%) | Min: $xminuseds Gb ($xminusedp%) | Max: $xmaxuseds Gb ($xmaxusedp%)"
    Write-Host "$log"
    $log | Out-File -filepath $logpath -Append String
    $timeloop = $freq
    .$Loopmain    
}
$Loopmain = {
    if($timeloop -gt 0){
        Start-Sleep -s 1
        $timeloop = $timeloop-1
        if($Host.UI.RawUI.KeyAvailable -and ("0" -eq $Host.UI.RawUI.ReadKey("IncludeKeyUp,NoEcho").Character)){.$Stoplog}      
        else{.$Loopmain}
    }
    if($timeloop -eq 0){.$Startlog}
}
$Stoplog = {
    $stopmsg = "$l15"
    Write-Host "$stopmsg"
    $stopmsg | Out-File -filepath $logpath -Append String
    $lbreak = "`n"
    $lbreak | Out-File -filepath $logpath -Append String
    Write-Host "`n"
    Write-Host "$l16 $logpath"
    .$Askadv
}
$Ask = {
    Write-Host "`n"
    Write-Host "1 - $l17"
    Write-Host "2 - $l18"
    Write-Host "3 - $l19"
    [string]$Action = Read-Host "$l20"
    if($Action -eq 1){.$Prelog}
    elseIf($Action -eq 2){.$Start}
    elseIf($Action -eq 3){exit}
    else{exit}
}
$Askadv = {
    Write-Host "`n"
    Write-Host "1 - $l21"
    Write-Host "2 - $l19"
    [string]$Action = Read-Host "$l20"
    if($Action -eq 1){.$Start}
    elseIf($Action -eq 2){exit}
    else{exit}
}
$Invvalue = {
    Write-Host "$l22"
    Read-Host "$l23"
    .$Start
}
&$Preload
