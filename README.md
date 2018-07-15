 # English
 ### RAM-Logger
 Simple PowerShell script for monitoring RAM usage.
 
 ### Requirements:
 - OS: Microsoft Windows
 - PowerShell: 6.0 (Recommended)
 - Login / Password of administrator account
 
 ### Features:
 - Easy to use
 - Light-weight script with ~15KB size and ~35MB RAM usage
 - RAM usage monitoring with live displaying in console
 - Recording log to *.txt file
 - Monitoring current / minimum / maximum RAM usage (displaying size / percentage)
 - Ability to manually choose logging interval (logging frequency)
 - Log your current PC or any PC in local network
 - Three languages to select (English, Ukrainian, Russian)
 
 ### Things to do before execution:
 1. Make sure PowerShell 6.0 or newer version is installed on your PC. </br>
    If version does'nt meet requirements, you can download newer version from official repo: </br>
    https://github.com/PowerShell/PowerShell/releases
    
 2. Make sure you have access to administrator's account. </br>
    If you're about to monitor remote PC, you need to have login and password from administrator's account on remote PC. </br>
    If remote PC account doesn't have password, you'll be unable to use remote monitoring function, until you set password.
    
 3. Configure trusted hosts settings. </br>
    Run PowerShell as administrator, type in following command and hit Enter: </br>
    ```Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force```
    
 4. Set up WinRM. </br>
    In PowerShell command promp run this command with administrator rights: </br>
    ```WinRM quickconfig``` </br>
    Answer "Yes" to all next questions.
    
 5. Give permission for script execution. </br>
    Open PowerShell once again under administrator rights and execute following command: </br>
    ```Set-ExecutionPolicy Unrestricted -Force```
 
 6. To avoid problems while using app, it is recommended to disable firewall or any other program, which can block internet-connections.
 
 # Українська
 ### RAM-Logger
 Простий PowerShell скрипт, що дає змогу відстежити використання оперативної пам'яті.
 
 ### Вимоги:
 - ОС: Microsoft Windows
 - PowerShell: 6.0 (Рекомендовано)
 - Логін / Пароль від облікового запису адміністратора
 
 ### Особливості:
 - Скрипт легкий у використанні
 - Скрипт розміріром ~15КБ, який використовує ~35МБ оперативної пам'яті
 - Моніторинг RAM з миттєвим відображенням в консолі
 - Запис логу до *.txt файлу
 - Моніторинг поточного / мінімального / максимального використання RAM (вивід розміру / відсотків)
 - Можливість вручну виставити інтервал логування (частота логування)
 - Логування поточного ПК чи будь-якого ПК в локальній мережі
 - Три мови для вибору (Англійська, Українська, Російська)
 
 ### Що слід зробити перед запуском:
 1. Переконайтеся, що на ПК встановлена версія PowerShell 6.0 або новіша. </br>
    Якщо версія не відповідає вимогам, ви можете завантажити новішу версію з офіційної репозиторії: </br>
    https://github.com/PowerShell/PowerShell/releases
    
 2. Переконайтеся, що ви маєте доступ до облікового запису адміністратора. </br>
    Якщо ви плануєте моніторити віддалений ПК, необхідно мати логін та пароль від облікового запису адміністратора віддаленого ПК. </br>
    Якщо на обліковому записі віддаленого ПК не встановлено пароль, ви не зможете використовувати функцію віддаленого моніторингу, поки не встановите пароль.
    
 3. Відконфігуруйте налаштування довірених хостів. </br>
    Для цього запустіть PowerShell від імені адміністратора, введіть наступну команду та натисніть Enter: </br>
    ```Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force```
    
 4. Налаштуйте WinRM. </br>
    В строці PowerShell від імені адміністратора запустіть команду: </br>
    ```WinRM quickconfig``` </br>
    Відповідайте "Yes" на всі наступні запитання.
    
 5. Надайте дозвіл для запуску скрипта. </br>
    Знову відкрийте PowerShell з правами адміністратора та введіть наступну команду: </br>
    ```Set-ExecutionPolicy Unrestricted -Force```
 
 6. Щоб уникнути проблем під час використання програми, рекомендовано відключити брандмауер чи будь-яку іншу програму, що може блокувати інтернет-підключення.
 
 # Русский
 ### RAM-Logger
 Простой PowerShell скрипт для мониторинга использования оперативной памяти.
 
 ### Требования:
 - ОС: Microsoft Windows
 - PowerShell: 6.0 (Рекомендуется)
 - Логин / Пароль от учетной записи администратора
 
 ### Особенности:
 - Скрипт легкий в использовании
 - Скрипт размером ~15КБ, который использует ~35МБ оперативной памяти
 - Мониторинг RAM с мгновенным отображением в консоли
 - Запись лога в *.txt файл
 - Мониторинг текущего / минимального / максимального использования RAM (вывод размера / процентов)
 - Возможность вручную выставить интервал логирования (частота логирования)
 - Логирование текущего ПК или любого ПК в локальной сети
 - Три языка на выбор (Английский, Украинский, Русский)
 
 ### Что следует сделать перед запуском:
 1. Убедитесь, что на ПК установлена версия PowerShell 6.0 или новее. </br>
    Если версия не соответствует требованиям, вы можете загрузить более новую версию с оффициальной репозитории: </br>
    https://github.com/PowerShell/PowerShell/releases
    
 2. Убедитесь, что вы имеете доступ к учетной записи администратора. </br>
    Если вы планируете мониторить удаленный ПК, необходимо иметь логин и пароль от учетной записи администратора удаленного ПК. </br>
    Если на учетной записи удаленного ПК не установлен пароль, вы не сможете использовать функцию удаленного мониторинга, пока не установите пароль.
    
 3. Отконфигурируйте настройки доверенных хостов. </br>
    Для этого запустите PowerShell от имени администратора, введите следующую команду и нажмите Enter: </br>
    ```Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force```
    
 4. Настройте WinRM. </br>
    В строке PowerShell от имени администратора запустите команду: </br>
    ```WinRM quickconfig``` </br>
    Отвечайте "Yes" на все следующие вопросы.
    
 5. Надайте разрешение для запуска скрипта. </br>
    Снова откройте PowerShell с правами администратора и введите следующую команду: </br>
    ```Set-ExecutionPolicy Unrestricted -Force```
 
 6. Чтобы избежать проблем во время использования программы, рекомендуется отключить брандмауэр или любую другую программу, которая может блокировать интернет-соединения.
