"""Chuyển web/be-hoc-toan.html thành android/assets/game.html (dùng font có sẵn, chạy không cần mạng)."""
import os, re, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
src = os.path.join(ROOT, 'web', 'be-hoc-toan.html')
dst = os.path.join(ROOT, 'android', 'assets', 'game.html')
s = open(src, encoding='utf-8').read()
s = s.replace('<meta name="claude:viewport-fit-sides" content="cover">\n', '')
s = re.sub(r'<link rel="stylesheet" href="https://fonts.googleapis.com[^>]*>\n', '', s)
ranges = {
 'latin': 'U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD',
 'latin-ext': 'U+0100-02BA,U+02BD-02C5,U+02C7-02CC,U+02CE-02D7,U+02DD-02FF,U+0304,U+0308,U+0329,U+1D00-1DBF,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20C0,U+2113,U+2C60-2C7F,U+A720-A7FF',
 'vietnamese': 'U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB'}
ff = ''.join("@font-face{font-family:'Baloo 2';font-weight:800;font-display:block;src:url(fonts/baloo-2-%s-800-normal.woff2) format('woff2');unicode-range:%s}\n" % (k, v) for k, v in ranges.items())
s = s.replace('<style>\n', '<style>\n' + ff, 1)
head = '<!doctype html>\n<html lang="vi"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">\n'
s = head + s.replace('</style>\n', '</style>\n</head><body>\n', 1) + '\n</body></html>\n'
open(dst, 'w', encoding='utf-8').write(s)
print('Da tao', dst)
