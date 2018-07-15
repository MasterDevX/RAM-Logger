 # English
 ### RAM-Logger
 Simple PowerShell script for monitoring RAM usage.
 
 ### Requirements:
 - OS: Microsoft Windows
 - PowerShell: 6.0 (Recommended)
 - Login / Password of administrator account
 
 ### Features:
 - Easy to use
 - Light-weight script with ~12KB size and ~35MB RAM usage
 - RAM usage monitoring with live displaying in console
 - Recording log to *.txt file
 - Monitoring current / minimum / maximum RAM usage (displaying size / percentage)
 - Ability to manually choose logging interval (logging frequency)
 - Log your current PC or any PC in local network
 - Two languages to select (English, Ukrainian)
 
 # Українська
 ### RAM-Logger
 Простий PowerShell скрипт, що дає змогу відстежити використання оперативної пам'яті.
 
 ### Вимоги:
 - ОС: Microsoft Windows
 - PowerShell: 6.0 (Рекомендовано)
 - Логін / Пароль від облікового запису адміністратора
 
 ### Особливості:
 - Скрипт легкий у використанні
 - Скрипт розміріром ~12КБ, який використовує ~35МБ оперативної пам'яті
 - Моніторинг RAM з миттєвим відображенням в консолі
 - Запис логу до *.txt файлу
 - Моніторинг поточного / мінімального / максимального використання RAM (вивід розміру / відсотків)
 - Можливість вручну виставити інтервал логування (частота логування)
 - Логування поточного ПК чи будь-якого ПК в локальній мережі
 - Дві мови для вибору (Англійська, Українська)
 
 ### Що слід зробити перед запуском:
 1. Переконайтеся, що на ПК встановлена версія PowerShell 6.0 або новіша. </br>
    Якщо версія не відповідає вимогам, ви можете завантажити новішу версію з офіційної репозиторії: </br>
    https://github.com/PowerShell/PowerShell/releases
    
 2. Переконайтеся, що ви маєте доступ до облікового запису адміністратора. </br>
    Якщо ви плануєте моніторити віддалений ПК, необхідно мати логін та пароль від облікового запису адміністратора віддаленого ПК. </br>
    Якщо на обліковому записі віддаленого ПК не встановлено пароль, ви не зможете використовувати функцію віддаленого моніторингу, поки не встановите пароль.
    
 3. Відконфігуруйте налаштування довірених хостів. </br>
    Для цього запустіть PowerShell від імені дміністратора, введіть наступну команду та натисніть Enter: </br>
    ```Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force```
    
 4. Налаштуйте WinRM. </br>
    В строці PowerShell від імені адміністратора запустіть команду: </br>
    ```WinRM quickconfig```
    Відповідайте "Yes" на всі наступні запитання.
    
 5. Надайте дозвіл для запуску скрипта. </br>
    Знову відкрийте PowerShell з правами адміністратора та введіть наступну команду: </br>
    ```Set-ExecutionPolicy Unrestricted -Force```
 
 6. Щоб уникнути проблем під час використання програми, рекомендовано відключити брандмауер чи будь-яку іншу програму, що може блокувати інтернет-підключення.
