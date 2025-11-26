## Create VPC
A VPC is an isolated portion of the AWS Cloud populated by AWS objects, such as Amazon EC2 instances

![VPC](../public/vpc%20diagram.jpg)

AWS setting

![VPC](../public/VPC.jpg)
    1. VPC only
![VPC only](../public/VPConly.jpg)
    2.Name tag 
    
-  se-kaki-2tier-vpc
- IPv4 CIDR blockk
- Ipv4 CIDR
- no IPV6 CIDR block

        10.0.0.0/16
    ![nametag and CIDR](../public/Name%20tag%20and%20CIDR.jpg)
- **Tenancy** -> Default
- **Tag** -> default
    ![VPC tag](..//public/Name%20tag%20and%20CIDR.jpg)

    **VPC Shell is created!!**

## Next - create 2 subnets, Public and Private
Select the VPC that has just created
![create subnet VPC_ID](..//public/create%20subnet.jpg)

 Subnet settings - we can create many subnets in one time (both public and private for this demo case)

    Specify the CIDR blocks and Availability Zone for the subnet
- IPv4 VPC CIDR block for Public

```        
10.0.2.0/24
```
- AZ euw1-az1(eu-west-1a)

![subnet settings 1](../public/subenet%20setting.jpg)

- IPv4 VPC CIDR block for Private
        
        10.0.3.0/24
- AZ euw1-az1(eu-west-1b)

![subnet setting 2](../public/subnet%202%20privite.jpg)
![AZone](../public/AZ%20.jpg)

Both Public and Private subnets are created and shown on console
![subnets console](../public/subnet%20-created.jpg)



## Create an Internet gateway

- Internet gateway is used for connect internet in and out to the VPC
![IG setting](..//public/Create%20internet%20gateway.jpg)

    Attach the Internet Gateway to a VPC
![internetGateway](../public/Attached%20to%20a%20VPC.jpg)

    Attached
![attached](../public/attached.jpg)
![state attached](../public/State_attach.jpg)

## Create RouteTable
- To facilitate the flow of traffic

Public Route Table setting

![create public RouteTable](../public/createroute%20table.jpg)

Go to the **Subnet associations** Tab

Press the Edit subnet associations button
![RouteTable](../public/subnet%20associations_pick%20the%20publicSubnet_save_it.jpg)
![subnet associations setting](../public/subnet%20associations_public.jpg)

Press edit Route button
![RouteTableroute](../public/RouteTable_route.jpg)
![Edit Route](../public/editRoute_add%20route%20to%20internet%20gatway.jpg)

Go back to the console and check the VPC shell
![rosourcemap](../public/resource%20map.jpg)


