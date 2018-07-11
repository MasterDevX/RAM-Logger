$Preload = {
    Clear-Host
    [Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
    $Host.ui.RawUI.WindowTitle = "RAM Logger"
    $Host.UI.RawUI.BackgroundColor = 'Black'
    $Host.UI.RawUI.ForegroundColor = 'Blue'
    $logpath = "D:\MemoryUsageLog.txt"
    .$About
}
$About = {
    [string]$ver = "1.0.0"
    Write-Host "Вітаємо у RAM Logger!"
    Write-Host "Ця програма допоможе"
    Write-Host "відслідкувати використання"
    Write-Host "оперативної пам'яті комп'ютера."
    Write-Host "`n"
    Write-Host "Версія: $ver"
    Write-Host "Розробник: MasterDevX"
    Write-Host "`n"
    Read-Host "Натисніть Enter, щоб розпочати"
    .$Start
}
$Start = {
    Clear-Host
    try {[decimal]$freq = Read-Host "Введіть частоту логування в секундах"}
    catch {.$Invvalue}
    $freq = [math]::Round($freq, 0)
    if($freq -lt 1){.$Invvalue}
    Write-Host "Встановлено частоту логування $freq Секунд(и)"
    .$Ask
}
$Prelog = {
    Clear-Host
    Write-Host "Логування розпочато."
    Write-Host "Щоб зупинити, натисніть клавішу 0,"
    Write-Host "коли вікно програми активне."
    Write-Host "`n"
    $startmsg = "-----ПОЧАТОК ЛОГУВАННЯ-----"
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
    $stopmsg = "-----КІНЕЦЬ ЛОГУВАННЯ-----"
    Write-Host "$stopmsg"
    $stopmsg | Out-File -filepath $logpath -Append String
    $lbreak = "`n"
    $lbreak | Out-File -filepath $logpath -Append String
    Write-Host "`n"
    Write-Host "Файл логу збережено: $logpath"
    .$Askadv
}
$Ask = {
    Write-Host "`n"
    Write-Host "1 - Розпочати логування"
    Write-Host "2 - Змінити частоту логування"
    Write-Host "3 - Вийти"
    [string]$Action = Read-Host "Виберіть наступну дію"
    if($Action -eq 1){.$Prelog}
    elseIf($Action -eq 2){.$Start}
    elseIf($Action -eq 3){exit}
    else{exit}
}
$Askadv = {
    Write-Host "`n"
    Write-Host "1 - Нове логування"
    Write-Host "2 - Вийти"
    [string]$Action = Read-Host "Виберіть наступну дію"
    if($Action -eq 1){.$Start}
    elseIf($Action -eq 2){exit}
    else{exit}
}
$Invvalue = {
    Write-Host "Ви ввели неприпустиме значення!"
    Read-Host "Натисніть Enter для повторного вводу"
    .$Start
}
&$Preload