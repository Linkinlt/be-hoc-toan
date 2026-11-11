#!/usr/bin/env bash
# Build APK: ./build.sh  ->  output/BeHocToan.apk
set -e
cd "$(dirname "$0")"
mkdir -p tools/bin output
[ -f tools/bin/apktool.jar ] || curl -sSL -o tools/bin/apktool.jar https://github.com/iBotPeaches/Apktool/releases/download/v2.10.0/apktool_2.10.0.jar
[ -f tools/bin/signer.jar ] || curl -sSL -o tools/bin/signer.jar https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar
python3 tools/make_game_html.py
rm -rf android/build
java -jar tools/bin/apktool.jar b android -o output/unsigned.apk
java -jar tools/bin/signer.jar -a output/unsigned.apk -o output/signed
cp output/signed/unsigned-aligned-debugSigned.apk output/BeHocToan.apk
echo "APK: $(pwd)/output/BeHocToan.apk"
