#!/usr/bin/bash

#users=$@
users=$(cat userdb.csv)
for user in $users
do
        if id $user &> /dev/null
        then
                echo "user $user already exists"
        else
                useradd $user
                if [ 0 -eq $? ]
                then
                        echo "user $user is succesfully created!"
                else
                        echo " user creation failed, check with admin"
                fi
        fi
done