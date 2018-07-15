$Preload = {
    Clear-Host
    [Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
    $Host.Ui.RawUI.WindowTitle = "RAM Logger"
    $Host.UI.RawUI.BackgroundColor = "Black"
    $Host.UI.RawUI.ForegroundColor = "Blue"
    $logpath = "D:\MemoryUsageLog.txt"
    $ErrorActionPreference = "silentlycontinue"
    .$Lang
}
$Lang = {
    Clear-Host
    Write-Host "1 - English"
    Write-Host "2 - Українська"
    Write-Host "3 - Русский"
    [string]$lng = Read-Host "Select language / Виберіть мову / Выберите язык"
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
        [string]$l10 = "second(s)"
        [string]$l11 = "Logging started."
        [string]$l12 = "To stop, press 0 key,"
        [string]$l13 = "when app window is active."
        [string]$l14 = "-----BEGIN OF LOG-----"
        [string]$l15 = "-----END OF LOG-----"
        [string]$l16 = "Log file saved:"
        [string]$l17 = "Start logging"
        [string]$l18 = "Change logging configuration"
        [string]$l19 = "Exit"
        [string]$l20 = "Select next action"
        [string]$l21 = "New logging"
        [string]$l22 = "You have entered invalid value!"
        [string]$l23 = "Press Enter to try again"
        [string]$l24 = "Type in computer name in local network, which will be monitored"
        [string]$l25 = "Connecting to computer"
        [string]$l26 = "Could not reach target computer"
        [string]$l27 = "Make sure computer name and credentials were entered correctly / WinRM is running and properly configured on target computer."
        [string]$l28 = "WinRM can be configured using ""winrm quickconfig"" command."
        [string]$l29 = "Monitoring computer"
        [string]$l30 = "Successfully connected to"
        [string]$l31 = "Monitoring current PC"
        [string]$l32 = "Monitoring remote PC"
        [string]$l33 = "Make sure WinRM is running and properly configured."
        [string]$l34 = "For localhost monitoring select ""Monitoring current PC"" in app menu."
        [string]$l35 = "Creating CIM session for"
        [string]$l36 = "Enable saving log to file? (1 - Yes | 0 -No)"
        [string]$l37 = "Saving log to file enabled"
        [string]$l38 = "Saving log to file disabled"
        [string]$l39 = "Type in remote PC administrator account credentials."
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
        [string]$l10 = "cекунд(и)"
        [string]$l11 = "Логування розпочато."
        [string]$l12 = "Щоб зупинити, натисніть клавішу 0,"
        [string]$l13 = "коли вікно програми активне."
        [string]$l14 = "-----ПОЧАТОК ЛОГУ-----"
        [string]$l15 = "-----КІНЕЦЬ ЛОГУ-----"
        [string]$l16 = "Файл логу збережено:"
        [string]$l17 = "Розпочати логування"
        [string]$l18 = "Змінити конфігурацію логування"
        [string]$l19 = "Вийти"
        [string]$l20 = "Виберіть наступну дію"
        [string]$l21 = "Нове логування"
        [string]$l22 = "Ви ввели неприпустиме значення!"
        [string]$l23 = "Натисніть Enter, щоб спробувати знову"
        [string]$l24 = "Введіть ім'я комп'ютера в локальній мережі, який буде моніторитися"
        [string]$l25 = "Під'єднання до комп'ютера"
        [string]$l26 = "Неможливо з'єднатися з цільовим комп'ютером"
        [string]$l27 = "Переконайтеся, що ім'я комп'ютера та облікові дані введено вірно / WinRM запущено та правильно налаштовано на цільовому комп'ютері."
        [string]$l28 = "Налаштувати WinRM можна за допомогою команди ""winrm quickconfig""."
        [string]$l29 = "Моніторинг комп'ютера"
        [string]$l30 = "Встановлено з'єднання з"
        [string]$l31 = "Моніторинг поточного ПК"
        [string]$l32 = "Моніторинг віддаленого ПК"
        [string]$l33 = "Переконайтеся, що WinRM запущено та правильно налаштовано."
        [string]$l34 = "Для моніторингу localhost виберіть ""Моніторинг поточного ПК"" в меню програми."
        [string]$l35 = "Створення CIM сесії для"
        [string]$l36 = "Увімкнути запис логу до файлу? (1 - Так | 0 - Ні)"
        [string]$l37 = "Запис логу до файлу увімкнено"
        [string]$l38 = "Запис логу до файлу вимкнено"
        [string]$l39 = "Введіть облікові дані від облікового запису адміністратора віддаленого ПК."
    }
    elseif($lng -eq 3){
        [string]$l1 = "Добро пожаловать в RAM Logger!"
        [string]$l2 = "Эта программа поможет"
        [string]$l3 = "отследить использование"
        [string]$l4 = "оперативной памяти компьютера."
        [string]$l5 = "Версия:"
        [string]$l6 = "Разработчик:"
        [string]$l7 = "Нажмите Enter, чтобы начать"
        [string]$l8 = "Введите частоту логирования в секундах"
        [string]$l9 = "Установлено частоту логирования"
        [string]$l10 = "cекунд(ы)"
        [string]$l11 = "Логирование начато."
        [string]$l12 = "Чтобы остановить, нажмите клавишу 0,"
        [string]$l13 = "когда окно программы активное."
        [string]$l14 = "-----НАЧАЛО ЛОГА-----"
        [string]$l15 = "-----КОНЕЦ ЛОГА-----"
        [string]$l16 = "Файл лога сохранён:"
        [string]$l17 = "Начать логирование"
        [string]$l18 = "Изменить конфигурацию логирования"
        [string]$l19 = "Выйти"
        [string]$l20 = "Выберите следующее действие"
        [string]$l21 = "Новое логирование"
        [string]$l22 = "Вы ввели недопустимое значение!"
        [string]$l23 = "Нажмите Enter, чтобы попробовать снова"
        [string]$l24 = "Введите имя компьютера в локальной сети, который будет мониториться"
        [string]$l25 = "Подключение к компьютеру"
        [string]$l26 = "Невозможно соединиться с целевым компьютером"
        [string]$l27 = "Убедитесь, что имя компьютера и учетные данные введено верно / WinRM запущен и правильно настроен на целевом компьютере."
        [string]$l28 = "Настроить WinRM можно с помощью команды ""winrm quickconfig""."
        [string]$l29 = "Мониторинг компьютера"
        [string]$l30 = "Установлено соединение с"
        [string]$l31 = "Мониторинг текущего ПК"
        [string]$l32 = "Мониторинг удаленного ПК"
        [string]$l33 = "Убедитесь, что WinRM запущен и правильно настроен."
        [string]$l34 = "Для мониторинга localhost выберите ""Мониторинг текущего ПК"" в меню программы."
        [string]$l35 = "Создание CIM сессии для"
        [string]$l36 = "Включить запись лога в файл? (1 - Да | 0 - Нет)"
        [string]$l37 = "Запись лога в файл включена"
        [string]$l38 = "Запись лога в файл выключена"
        [string]$l39 = "Введите учетные данные от учетной записи администратора удаленного ПК."
    }
    else{.$Lang}
    .$About
}
$About = {
    Clear-Host
    [string]$ver = "1.5.0"
    Write-Host "$l1"
    Write-Host "$l2"
    Write-Host "$l3"
    Write-Host "$l4"
    Write-Host "`n"
    Write-Host "$l5 $ver"
    Write-Host "$l6 MasterDevX"
    Write-Host "`n"
    Read-Host "$l7"
    .$Chooselog
}
$Chooselog = {
    Clear-Host
    Write-Host "1 - $l31"
    Write-Host "2 - $l32"
    Write-Host "3 - $l19"
    [string]$Action = Read-Host "$l20"
    if($Action -eq 1){.$Startlocallog}
    elseIf($Action -eq 2){.$Startremotelog}
    elseIf($Action -eq 3){exit}
    else{.$Chooselog}
}
$Startlocallog = {
    Clear-Host
    try {[decimal]$freq = Read-Host "$l8"}
    catch {.$Invvalue}
    $freq = [math]::Round($freq, 0)
    if($freq -lt 1){.$Invvalue}
    $tofile = Read-Host "$l36"
    if(($tofile -ne 1) -and ($tofile -ne 0)){.$Invvalue}
    Write-Host "`n"
    $computerlog = "localhost"
    Write-Host "$l25 $computerlog ..."
    Get-Ciminstance Win32_OperatingSystem -Computer $computerlog -Errorvariable connectionerror | Out-Null
    if($connectionerror){
        Write-Host "$l26 $computerlog!"
        Write-Host "`n"
        Write-Host "$l33"
        Write-Host "$l28"
        Write-Host "`n"
        Read-Host "$l23"
        .$Chooselog
    }
    else{
        $session = New-CimSession -Computer $computerlog
        Write-Host "$l30 $computerlog!"
        Write-Host "`n"
        Write-Host "$l9 $freq $l10"
        if($tofile -eq 1){Write-Host "$l37"}
        else{Write-Host "$l38"}
        Write-Host "$l29 - $computerlog"
        .$Ask
    }
}
$Startremotelog = {
    Clear-Host
    try {[decimal]$freq = Read-Host "$l8"}
    catch {.$Invvalue}
    $freq = [math]::Round($freq, 0)
    if($freq -lt 1){.$Invvalue}
    $tofile = Read-Host "$l36"
    if(($tofile -ne 1) -and ($tofile -ne 0)){.$Invvalue}
    $computerlog = Read-Host "$l24"
    $computerlog = $computerlog -Replace '\s\s',''
    if(($computerlog -eq "") -or ($computerlog -eq " ")){$computerlog = "localhost"}
    if($computerlog -eq "localhost"){
        Write-Host "`n"
        Write-Host "$l34"
        Read-Host "$l23"
        .$Chooselog
    }
    Write-Host "`n"
    Write-Host "$l35 $computerlog ..."
    Write-Host "`n"
    Write-Host "$l39"
    $usr = Read-Host "Username"
    $pwd = Read-Host -AsSecureString "Password"
    $creds = New-Object System.Management.Automation.PSCredential -ArgumentList $usr, $pwd
    $session = New-CimSession -Computer $computerlog -Credential $creds
    Write-Host "`n"
    Write-Host "$l25 $computerlog ..."
    try{Get-CimInstance win32_operatingsystem -CimSession $session | Out-Null}
    catch{
        Write-Host "$l26 $computerlog!"
        Write-Host "`n"
        Write-Host "$l27"
        Write-Host "$l28"
        Write-Host "`n"
        Read-Host "$l23"
        .$Chooselog
    }
    Write-Host "$l30 $computerlog!"
    Write-Host "`n"
    Write-Host "$l9 $freq $l10"
    if($tofile -eq 1){Write-Host "$l37"}
    else{Write-Host "$l38"}
    Write-Host "$l29 - $computerlog"
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
    if($tofile -eq 1){
        $startmsg | Out-File -Filepath $logpath -Append String
    }
    $mainram = Get-CimInstance win32_operatingsystem -CimSession $session
    [decimal]$total = $mainram.TotalVisibleMemorySize/1024/1024
    $xtotal = $total | % {$_.ToString("0.000")}
    [decimal]$minuseds = $total
    [decimal]$minusedp = 100
    [decimal]$maxuseds = 0
    [decimal]$maxusedp = 0
    .$Startlog
}
$Startlog = {
    $mainram = Get-CimInstance win32_operatingsystem -CimSession $session
    [decimal]$crtuseds = ($mainram.TotalVisibleMemorySize - $mainram.FreePhysicalMemory)/1024/1024
    [int]$crtusedp = $crtuseds*100/$total
    if($crtuseds -lt $minuseds){$minuseds = $crtuseds}
    if($crtusedp -lt $minusedp){$minusedp = $crtusedp}
    if($crtuseds -gt $maxuseds){$maxuseds = $crtuseds}
    if($crtusedp -gt $maxusedp){$maxusedp = $crtusedp}
    $timestamp = Get-Date -Format "HH:mm:ss"
    $xcrtuseds = $crtuseds | % {$_.ToString("0.000")}
    $xcrtusedp = $crtusedp | % {$_.ToString("000")}
    $xminuseds = $minuseds | % {$_.ToString("0.000")}
    $xminusedp = $minusedp | % {$_.ToString("000")}
    $xmaxuseds = $maxuseds | % {$_.ToString("0.000")}
    $xmaxusedp = $maxusedp | % {$_.ToString("000")}
    $log = "[$timestamp | $computerlog] Current: $xcrtuseds Gb / $xtotal Gb ($xcrtusedp%) | Min: $xminuseds Gb ($xminusedp%) | Max: $xmaxuseds Gb ($xmaxusedp%)"
    Write-Host "$log"
    if($tofile -eq 1){
        $log | Out-File -Filepath $logpath -Append String
    }
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
    if($tofile -eq 1){
        $stopmsg | Out-File -Filepath $logpath -Append String
    }
    $lbreak = "`n"
    if($tofile -eq 1){
        $lbreak | Out-File -Filepath $logpath -Append String
    }
    if($tofile -eq 1){
        Write-Host "`n"
        Write-Host "$l16 $logpath"
    }
    .$Askadv
}
$Ask = {
    Write-Host "`n"
    Write-Host "1 - $l17"
    Write-Host "2 - $l18"
    Write-Host "3 - $l19"
    [string]$Action = Read-Host "$l20"
    if($Action -eq 1){.$Prelog}
    elseIf($Action -eq 2){.$Chooselog}
    elseIf($Action -eq 3){exit}
    else{exit}
}
$Askadv = {
    Write-Host "`n"
    Write-Host "1 - $l21"
    Write-Host "2 - $l19"
    [string]$Action = Read-Host "$l20"
    if($Action -eq 1){.$Chooselog}
    elseIf($Action -eq 2){exit}
    else{exit}
}
$Invvalue = {
    Write-Host "`n"
    Write-Host "$l22"
    Read-Host "$l23"
    .$Chooselog
}
&$Preload
