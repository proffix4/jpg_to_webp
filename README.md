# jpg_to_webp
# СКРИПТЫ ДЛЯ WINDOWS POWERSHELL, ПРЕОБРАЗУЮЩИЕ ИЗОБРАЖЕНИЯ ИЗ "JPG/JPEG" В ФОРМАТ "WEBP"

### Пример запуска обработки:
- **Сжатием 90%**  
  (экономия места ~50%, качество отличное, быстрая обработка):  
  ```powershell
  C:\Users\tsn\Temp\jpg_to_webp90.ps1 "F:\Фотографии\2011 ГОД"
  ```

- **Сжатием 95%**  
  (меньшая экономия места ~40%, качество наилучшее, более медленная обработка):  
  ```powershell
  C:\Users\tsn\Temp\jpg_to_webp95.ps1 "F:\Фотографии\2012 ИЗБРАННОЕ"
  ```

---

## ⚠️ [!] ВНИМАНИЕ [!] ⚠️

1. **Необходим дополнительный софт и доступ к нему:**  
   - Конвертер изображений **ImageMagick**: https://imagemagick.org/script/download.php#windows версии *"Win64 dynamic at 16 bits-per-pixel component with High-dynamic-range imaging enabled"*.
   - Добавьте в системную переменную ***Path*** путь к команде **magick.exe**, например: ``C:\Program Files\ImageMagick-7.1.1-Q16-HDRI``, 
     чтобы с любого каталога запускалась команда **"magick"**.

2. **Исходные файлы будут удалены!**  
   После обработки останутся только файлы с расширением `.webp`.

3. **Требуются права администратора!**  
   - Скрипты нужно запускать в **PowerShell с правами администратора**.  
   - Каталог, где лежит скрипт, не должен содержать **пробелов** или **русских букв** в пути.

4. **Файлы с атрибутом "Только чтение":**  
   - Такие изображения **не будут удалены**, но всё равно будут сконвертированы.

5. **Подкаталоги**  
   - Скрипты обрабатывают **все вложенные каталоги** относительно указанной папки.
 
6. **Ориентация изображений после конвертации:**  
   - Файлы корректно отображаются в программах:  
     - **"Фотографии"**  
     - **"XnViewMP"**  
     - **"IrfanView"**  
   - Однако, в **Проводнике** и **FastStone Image Viewer** ориентация может отображаться неверно.

---

### ✅ Надёжность скриптов:
- Скрипты протестированы на **более 10 000 файлов**.  
- Обработка выполнена **без проблем**!  

---

## ⚠️ ОТВЕТСТВЕННОСТЬ
**Внимание!** Вы выполняете действия на **свой страх и риск**.  
Убедитесь, что у вас есть резервные копии исходных файлов!

---
