
![VPC Diagram](../public/vpc%20diagram.jpg)

# public app instance setting on AWS

## name a instance
se-kaki-app-public

## Application and OS images 

se-luke-nodejs20-app-image

## Instance type

t3.mirco

## keypair
se-kaki@!$!@

## **Network Setting**
click **edit** to select your VPC 

### VPC
key things
- se-kaki-2tier-vpc

- **Auto-assign public IP** - disable
 
        choose the correct **Subnet** !!!! 

![Public Subnet security group](../public/Networksetting_publicsubnet%20.jpg)



## Advanced details
```
#!/bin/bash

# Wait for everything to be ready - User Data runs very fast! 
sleep 15

# user data runs as root!
cd /home/ubuntu

# cd to correct folder
cd se-sparta-test-app
cd app

<!-- Private IPv4 addresses
10.0.3.131
 -->

# DB connection env var
export DB_HOST=mongodb://10.0.3.17:27017/posts

# npm install
sudo npm install

# seed database
node seeds/seed.js

# start app
pm2 start app.js
```


# Private instance
## name a instance
se-kaki-app-private
## Application and OS images 
se-luke-mongodb-image
## Instance type

t3.mirco

## keypair
se-kaki@!$!@
## Network setting
![private Nework Setting](../public/Network%20setting_inEC2%20instance.jpg)