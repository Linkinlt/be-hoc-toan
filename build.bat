@echo off
rem Build APK tren Windows: can Java va Python. Ket qua: output\BeHocToan.apk
cd /d "%~dp0"
if not exist tools\bin mkdir tools\bin
if not exist output mkdir output
if not exist tools\bin\apktool.jar curl -L -o tools\bin\apktool.jar https://github.com/iBotPeaches/Apktool/releases/download/v2.10.0/apktool_2.10.0.jar
if not exist tools\bin\signer.jar curl -L -o tools\bin\signer.jar https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar
python tools\make_game_html.py || exit /b 1
if exist android\build rmdir /s /q android\build
java -jar tools\bin\apktool.jar b android -o output\unsigned.apk || exit /b 1
java -jar tools\bin\signer.jar -a output\unsigned.apk -o output\signed || exit /b 1
copy /y output\signed\unsigned-aligned-debugSigned.apk output\BeHocToan.apk
echo APK: %cd%\output\BeHocToan.apk
pause
