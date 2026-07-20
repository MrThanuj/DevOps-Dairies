# Linux Commands Cheat Sheet

Quick reference for commands covered in the DevOps Bootcamp by [TechWorld with Nana](https://www.techworld-with-nana.com/). Not theory, just the commands and what they do.

## Users & Groups

Access control files:
- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`

```bash
sudo adduser [username]         # create a new user
sudo passwd [username]          # change password of a user
su - [username]                 # login as username
su -                            # login as root

sudo groupadd [groupname]       # create new group (auto-assigns next available GID)

sudo usermod [OPTIONS] [username]     # modify a user account
sudo usermod -g devops tom            # set 'devops' as primary group for 'tom'
sudo delgroup tom                     # remove group 'tom'

groups                          # groups the current user belongs to
groups [username]               # groups of a given user

sudo useradd -G devops nicole   # create 'nicole' and add to 'devops' group (-G = secondary group)
sudo gpasswd -d nicole devops   # remove 'nicole' from 'devops' group
```

> Two command families for the same thing:
> - `adduser`, `addgroup`, `deluser`, `delgroup` — interactive, more user-friendly
> - `useradd`, `groupadd`, `userdel`, `groupdel` — low-level, you provide all the details yourself

## File Ownership & Permissions

```bash
ls -l                            # long listing, shows ownership + permissions
```

**Ownership**

```bash
sudo chown [user]:[group] [file]     # change ownership
sudo chown tom:admin test.txt        # owner -> tom, group -> admin
sudo chown admin test.txt            # owner -> admin
sudo chgrp devops test.txt           # group owner -> devops
```

**Symbolic permissions**

| Symbol | Meaning |
|---|---|
| `r` | read |
| `w` | write |
| `x` | execute |
| `-` | no permission |

Applies to three scopes: `u` (owner), `g` (group), `o` (other).

```bash
sudo chmod -x api                # remove execute from all owners on 'api' folder
sudo chmod g-w config.yaml       # remove write from group

sudo chmod g+x config.yaml       # add execute for group
sudo chmod u+x script.sh         # add execute for owner
sudo chmod o+x script.sh         # add execute for other

sudo chmod g=rwx config.yaml     # set group to read+write+execute
sudo chmod g=r-- config.yaml     # set group to read only
```

**Numeric (absolute) permissions**

| Value | Meaning |
|---|---|
| 0 | no permission |
| 1 | execute |
| 2 | write |
| 3 | write + execute |
| 4 | read |
| 5 | read + execute |
| 6 | read + write |
| 7 | read + write + execute |

```bash
sudo chmod 777 script.sh   # rwx for everyone
sudo chmod 740 script.sh   # owner: rwx, group: r--, other: none
```

## Pipes, Less & Grep

```bash
|                                 # pipe: sends output of one command as input to the next
less [filename]                  # view file/output one page at a time, scrollable
```

```bash
cat /var/log/syslog | less       # page through a log file
ls /usr/bin | less               # page through a long directory listing
history | less                   # page through command history
```

**grep** — filters lines matching a pattern

```bash
history | grep sudo                    # history lines containing "sudo"
history | grep "sudo chmod"            # history lines containing the phrase "sudo chmod"
history | grep sudo | less             # filter, then page through the result
ls /usr/bin/ | grep java               # filter ls output for "java"
cat Documents/java-app/config.yaml | grep ports   # find all "ports" occurrences
```

## Redirects

```bash
>     # redirect output to a file (overwrites existing content)
>>    # redirect output to a file (appends to existing content)
```

```bash
history | grep sudo > sudo-commands.txt
cat sudo-commands.txt > sudo-rm-commands.txt

history | grep rm > sudo-rm-commands.txt    # overwrites the file
history | grep rm >> sudo-rm-commands.txt   # appends to the file
```

## Shell Scripting

**Basic script**

```bash
vim setup.sh
```

```bash
#!/bin/bash

echo "Setup and configure server"

# save in vim: ESC then :wq
# make executable: chmod u+x setup.sh
# run it: ./setup.sh   or   bash setup.sh
```

**Variables**

```bash
#!/bin/bash

file_name=config.yaml
config_files=$(ls config)

echo "using file $file_name to configure something"
echo "here are all configuration files: $config_files"
```

**Conditions**

```bash
#!/bin/bash

config_dir=$1

if [ -d "$config_dir" ]
then
  echo "reading config directory contents"
  config_files=$(ls "$config_dir")
else
  echo "config dir not found. Creating one"
  mkdir "$config_dir"
  touch "$config_dir/config.sh"
fi

# check file exists:      if [ -f "config.yaml" ]
# check number equals 10: if [ "$num_files" -eq 10 ]

user_group=$2
if [ "$user_group" == "nana" ]
then
  echo "configure the server"
elif [ "$user_group" == "admin" ]
then
  echo "administer the server"
else
  echo "No permission to configure server. wrong user group"
fi
```

**User input**

```bash
#!/bin/bash

read -p "Please enter your password: " user_pwd
echo "thanks for your password $user_pwd"
```

**Script parameters**

```bash
#!/bin/bash

echo "all params: $*"
echo "number of params: $#"

echo "user $1"
echo "group $2"
```

```bash
./example.sh name lastname     # 2 params
./example.sh "name lastname"   # 1 param (quoted)
bash example.sh name lastname
```

**Loops**

```bash
#!/bin/bash

for param in $*
do
  if [ -d "$param" ]
  then
    echo "executing scripts in the config folder"
    ls -l "$param"
  fi
  echo $param
done
```

```bash
sum=0
while true
do
  read -p "enter a score: " score

  if [ "$score" == "q" ]
  then
    break
  fi

  sum=$(($sum+$score))
  echo "total score: $sum"
done
```

**Functions**

```bash
#!/bin/bash

function score_sum {
  sum=0
  while true
  do
    read -p "enter a score: " score
    if [ "$score" == "q" ]
    then
      break
    fi
    sum=$(($sum+$score))
    echo "total score: $sum"
  done
}

score_sum   # invoke
```

```bash
function create_file() {
  file_name=$1
  is_shell_script=$2
  touch $file_name
  echo "file $file_name created"

  if [ "$is_shell_script" = true ]
  then
    chmod u+x $file_name
    echo "added execute permission"
  fi
}

create_file test.txt
create_file myfile.yaml
create_file myscript.sh
```

```bash
# function with a return value
function sum() {
  total=$(($1+$2))
  return $total
}

sum 2 10
result=$?
echo "sum of 2 and 10 is $result"
```

---

*Notes based on the DevOps Bootcamp by [TechWorld with Nana](https://www.techworld-with-nana.com/).*
