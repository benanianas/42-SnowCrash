# Flag 14

In level 14 we found nothing to work with, after lot of searching in the vm we found ourselfs just with the /bin/getflag that can help us to get the last flag.

so we used some reverse engineering magic with gdb.
we used both binary ninja and and gdb cause the main function was more complex than the last one (level13).
After reading it's pseudo c code in binary ninja we figure out that we need to surpass three main obstacles.

* the "ptrace() condition" that detect if we reversing the program and exit with a "You should not reverse this" message.
```
08048990      if (ptrace(request: PTRACE_TRACEME, 0, 1, 0, 0) s< 0)
```
* after surpassing the first condition we found ourselve in infinite loop and there two conditions that can get us out from it first one break the loop and the program exit the second helps to get to our flag.
```
08048a9f                   if (isLib(&var_114, 0x8049063) != 0)  {"libc"}
08048aa1                      var_120 = 1
```
* now all we have to do is changing the getuid result to the flag14 uid we got from the `/etc/passwd`: 3014 in hexadecimal => `0xbc6`

```(gdb) b *0x0804898e
Breakpoint 1 at 0x804898e
(gdb) b *0x08048acd
Breakpoint 2 at 0x8048acd
(gdb) b *0x08048b15
Breakpoint 3 at 0x8048b15
(gdb) r
Starting program: /bin/getflag 

Breakpoint 1, 0x0804898e in main ()
(gdb) set $eax=0x5
(gdb) continue
Continuing.

Breakpoint 2, 0x08048acd in main ()
(gdb) set $eax=0x4
(gdb) continue
Continuing.

Breakpoint 3, 0x08048b15 in main ()
(gdb) set $eax=0xbc6
(gdb) continue
Continuing.
Check flag.Here is your token : 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
[Inferior 1 (process 3624) exited normally]
(gdb) ```

We got our flag!
🎉🎉🎉🎉🎉🎉🎉🎉🎉🥳🥳🥳🥳
