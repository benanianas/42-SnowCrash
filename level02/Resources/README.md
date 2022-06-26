# Flag 02

After connecting width user level02, we found a file in the level02 home directory 

```
level02@SnowCrash:~$ ls
level02.pcap
```

It's a file withe the extentsion `.pcap`, The .pcap file extension is mainly associated with Wireshark; a program used for analyzing networks.

So we downloaded Wireshark and copied the file to the host machine 

we followed the the TCP stream and we got what it looks like a sign in attempt

```
..%..%..&..... ..#..'..$..&..... ..#..'..$.. .....#.....'........... .38400,38400....#.SodaCan:0....'..DISPLAY.SodaCan:0......xterm.........."........!........"..".....b........b....	B.
..............................1.......!.."......"......!..........."........"..".............	..
.....................
Linux 2.6.38-8-generic-pae (::ffff:10.1.1.2) (pts/10)

..wwwbugs login: l.le.ev.ve.el.lX.X
..
Password: ft_wandr...NDRel.L0L
.
..
Login incorrect
wwwbugs login: 
```

Non-printable characters are replaced by dots, so the dots in the Password could be the backspace key pressed  `Password: ft_waNDReL0L`

And yes 🎉

```
level02@SnowCrash:~$ su flag02
Password: 
Don't forget to launch getflag !
flag02@SnowCrash:~$ getflag
Check flag.Here is your token : kooda2puivaav1idi4f57q8iq
```

