param(
    [string]$folderPath  # Параметр для каталога
)

# Указанное качество сжатия
$quality = 90

# Выводим информацию о папке и качестве, используя разные цвета
Write-Host -NoNewline "Обрабатываем папку: $folderPath " -ForegroundColor Cyan
Write-Host "| Качество сжатия: $quality " -ForegroundColor DarkRed

# Получаем все .jpg и .jpeg файлы в указанном каталоге и его подкаталогах
$files = Get-ChildItem -Path $folderPath -Recurse | Where-Object { $_.Extension -match "\.jpe?g$" }
$totalFiles = $files.Count
$processedFiles = 0

foreach ($file in $files) {
    # Получаем имя файла без расширения и его расширение
    $fileName = $file.BaseName
    $fileExtension = $file.Extension

    # Получаем относительный путь к каталогу файла (относительно переданного каталога)
    $relativeDirectory = $file.DirectoryName.Substring($folderPath.Length).TrimStart('\')

    # Если файл находится в самой целевой папке, убираем слэш перед именем
    if ($relativeDirectory -eq "") {
        $relativeDirectory = $fileName
    }
    else {
        $relativeDirectory = $relativeDirectory + "\" + $fileName
    }
    
    # Формируем путь для выходного файла
    $output = $file.DirectoryName + "\" + ($file.BaseName + ".webp")
    
    # Конвертация в WebP
    magick "$($file.FullName)" -quality $quality "$output"
    
    # Удаление исходного файла
    Remove-Item -LiteralPath "$($file.FullName)"
    
    # Увеличение счётчика обработанных файлов
    $processedFiles++
    
    # Вычисление процента завершения
    $percentage = [math]::Round(($processedFiles / $totalFiles) * 100, 2)
    
    # Строка для вывода
    $outputString = "Обрабатываем файл: "

    # Имя файла
    $fileNameString = "$relativeDirectory$fileExtension, "

    # Прогресс
    $progressString = " прогресс: $percentage%"

    # Выводим строку с данными разными цветами
    Write-Host -NoNewline $outputString -ForegroundColor DarkYellow
    Write-Host -NoNewline $fileNameString -ForegroundColor White
    Write-Host $progressString -ForegroundColor Green
}

# Вывод сообщения о завершении обработки
Write-Host "Завершена обработка папки: $folderPath" -ForegroundColor Cyan
Write-Host "Обработано файлов: $processedFiles" -ForegroundColor Blue
Write-Host "Качество произведенного сжатия: $quality" -ForegroundColor DarkRed

# Звуковой эффект "ты ды"
[console]::beep(1200, 130)  # "Ты" - короткий высокий звук
[console]::beep(300, 130)  # "Ды" - короткий низкий звук
