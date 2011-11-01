local_username="your_username"
ssh_username="your_ssh_username"
ssh_server="your_ssh_server.com"
share_name="ssh iTunes"

kill `ps -U "$local_username" | grep ssh | grep ":36890:127.0.0.1:3689 $ssh_username@$ssh_server" | awk '{ print $1 }'`
kill `ps -U "$local_username" | grep dns-sd | grep "$share_name" | awk '{ print $1 }'`
ssh -p 23 -fNL :36890:127.0.0.1:3689 "$ssh_username@$ssh_server"
dns-sd -R "$share_name" _daap._tcp local 36890 &
