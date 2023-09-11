#!/bin/sh

cat > /tmp/webos_privkey_tv << END_OF_PRIVKEY
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAsjnaGoeNdok+dWpCn2SChW1QtvF1Jkni66QjWiMjV+36kRS/
fPOCU3iTdECcZeHLJKZSizyUf2DhNOFwLHTZWSMkeykguQcaQoJk68/ZLw8+sdY8
t0wcPo6FSDO+aPMurRXGvUbZ7zrXiDKBk2sese8V/WhDb9oKRn/QROu2LD3BNmGo
c16LD76VXPBWdwQcosfk4P3Tf3BhN5sz8P/ipXpZrxiOGWeKkk/VCdJVWSJikKVf
T9P8TS1A/jOgkwzKKIQvgcYJd6wPDjnMmV3DSUO3zsXgro8hQCbQH8sePBR7VpDE
QooJgFbAT2PsJSJCTmBRczwVndhKmzbCdCviSwIDAQABAoIBABz9VACks9noEQTA
N/39N03ErjBTrh6APizeEfIDbShMSUl3+n20jipNno52Q/o+c/COLTcAr5bYh0k2
sixJBWF+Wdy+n9f408iltQy2TjldXXFHy7B07NMwE3XfFMW1aI420JDRCXnkNFKv
BGyaK+/9V7JUV0PGT42QFKxhOsyPKVZXJKri2BwEaYLAj4reU7kqdWP/sMVVvtEt
dTKqW0Gba3MXwV7wGP8em9wiAYTbszq+8C9YAe7CrdmAW10tVn3ijdDgzJMOFvgi
fFxG+3M+tczU8QNm8bmRrtVVcOXvs8B3i4Al2VAICXQnVP6q8uv9rmxon+zSOOmn
iW2S3KECgYEA4pOAfMZrCoc5GvJQVFBxVWv5BYvHNkByBeH3ubp2QpM+Z06Bx11n
0pKByX9WAWdjKdZApTOpY4vuH0licxa+VC1CIADyuDZ1MJc/SN+ZyE3m4ZPFbTsd
2a5kKEfdkXt24GjX78O5Oko36KqJC7O7T3eeuKKOwxRDFbQpR1PKKj0CgYEAyV70
HkZGVHgVJbYsrmZoi6tGyjyYk7YkxvKYFdPMb9mXLa6b2zn+kU5LnrwzL8HIoiSu
C+X74YB8yZ1r6NyjSjJfE++FFvMmTE3Udn/C1Y+goU/5GyncjTNY+tzqnUoowXHS
SWhmuVxR6R9QCtp+QMTf5NgxTQb8VV+xejw7bycCgYEAm+2C6Vvr4oz5AdBs8/mA
ZZcvA2AUswNa9S1zvL/UDzEiKxpeOgPQJZxp8W/OkpzCI9KtHoQVOMreD24DcMzg
IzIaZcgBQkFIGS6dgNtRDAaAtBFsNyYN/vcDOq1qkGp1fy7oHLuHx9O38kkak5EX
gTMDanGE6kARgug/2DST1skCgYAxRc6t6bwjxw5FoAHm2qASLOKxcYpT+mmdVJbq
IF0RsUhQoTz5s4MawvG18Y8EzIHvStJbjvbHAs2F98MDw5kg+ppRInaKWwyv9wtZ
w4FFCFPhpNPrVZ7l3f6Tw6KUwiSe0N8Hn0gjaveP9116imQCLSorsMq/ckokCbo/
kqVoWQKBgDVPRKeX5iMXd4jNe4uKZW5mGCpWPToyBdRYe9YLgYbmukB2UXzpDFCE
D6MKB/wpb5Cn7Tr090xvM8fZiKOrNi0uqZ3r3mZhrwFE7rNzQZPwrd4JGuexClUD
5ei6O7ykRkP5t8mnAacCYL/MRYZMip33/KDRuyWDH7+Abhc3UjGhCQkJCQkJCQkJ
-----END RSA PRIVATE KEY-----
END_OF_PRIVKEY

chmod 600 /tmp/webos_privkey_tv

sessionToken=$(ssh -i /tmp/webos_privkey_tv \
 -o ConnectTimeout=3 -o StrictHostKeyChecking=no \
 -p 9922 prisoner@192.168.178.34 \
 cat /var/luna/preferences/devmode_enabled)
if [ -z "$sessionToken" ]; then
  sessionToken=$(cat /tmp/webos_devmode_token_tv.txt)
else
  echo $sessionToken > /tmp/webos_devmode_token_tv.txt
fi

if [ -z "$sessionToken" ]; then
  echo "Unable to get token" >&2
  exit 1
fi

checkSession=$(curl --max-time 3 -s "https://developer.lge.com/secure/ResetDevModeSession.dev?sessionToken=$sessionToken")

echo $checkSession
