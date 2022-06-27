#FLAG09

Again in the level09 we found two file a binary and a token file except this time we have the read permission over the token file
```
level09@SnowCrash:~$ ls -l
total 12
-rwsr-sr-x 1 flag09 level09 7640 Mar  5  2016 level09
----r--r-- 1 flag09 level09   26 Mar  5  2016 token
level09@SnowCrash:~$ cat token 
f4kmm6p|=�p�n��DB�Du{��
```

the binary is taking a string as argument and printing it after adding the index of each character to the character (we can see it by using the binary ninja or just give it a simple string).

```
level09@SnowCrash:~$ ./level09 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
abcdefghijklmnopqrstuvwxyz{|}~����������
```
So it's possibly that the token is modified using the same binary, so we reverse it and boom we got our token.

The reverse program:
```c
#include <stdio.h>

int main(int argc, char **argv)
{
    if(argc == 2)
    {
        int i = 0;
        while(argv[1][i] != '\0')
        {
            printf("%c", argv[1][i]-i);
            i++;
        }
        printf("\n");
    }
}
```
We created a script to make it easy!
```
#!/bin/sh

if [$1 = ""];then
	echo "usage ./crack <ip>"
	exit 1
else
	scp -P 4242 level09@$1:~/token .
    chmod a=r token
	gcc crack.c -o reverse
    ./reverse $(cat token)
fi
```

After running the script we got our token
```
$ ./crack.sh 192.168.1.70
./crack.sh: 3: [192.168.1.70: not found
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.70 
level09@192.168.1.70's password: 
token                                                                                                                                                              100%   26    64.7KB/s   00:00    
f3iji1ju5yuevaus41q1afiuq
```
And then we got the flag using the token:
```
level09@SnowCrash:~$ su flag09
Password: 
Don't forget to launch getflag !
flag09@SnowCrash:~$ getflag
Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z

```
