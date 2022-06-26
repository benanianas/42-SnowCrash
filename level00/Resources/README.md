# Flag 00
After watching the video in the Intra we noticed that in level00 they have a readme file that don't exist in our VM, the file contains a small sentence.

```
FIND this first file WHO can run only as flag00...
```
with a capitalized word FIND 😉

so we used the find command to find that file

```
cat $(find / -user flag00 2>/dev/null | head -1)
```

we tried connecting to user flag00 with that but it didn't work, so we thought that it could be hashed and after trying sooo many hashing decryption finally we got our password using the `Rot11` algorithm

And we got our flag00
```
flag00@SnowCrash:~$ getflag
Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias

```
