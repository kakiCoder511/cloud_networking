In a new markdown file, cover the following:

# VPCs
 ## What are **VPCs**?
    
A **Virtual Private Cloud (VPC)** is a secure, isolated, and customisable private network inside AWS. 

It allows you to design your own networking environment, including:
- the **IP address range** (CIDR block)
- the **subnets** within the network
- how **traffic flows** between components
- which resources are **public** or **private**
- the **security rules** that protect the network (Security Groups & NACLs)

A VPC is essentially **your own private section of the cloud**, where you control the architecture and security.

##  Why use/create/customise them?
        
    We create custom VPCs to gain security, control, and proper cloud architecture:
- **Stronger security**  
  - isolate databases in private subnets  
  - restrict inbound/outbound traffic  
  - prevent public exposure  
- **Full control over networking**  
  - choose IP ranges  
  - create public/private subnets  
  - control internet access via IGW/NAT  
- **Scalable, production-ready architecture**  
  - multi-AZ setup  
  - separate tiers (web/app/db)  
- **Compliance and best practices**  
  - follows industry standards  
  - suits real-world cloud deployments  

Default VPCs are okay for beginners—but **real systems require custom VPCs**.

        Default VPC = AWS decides.
        Custom VPC = you decide.
    

## What would a default VPC looklike?

    A default VPC is automatically created by AWS for convenience.  
It usually includes:

- one large CIDR block (e.g., **10.0.0.0/16**)
- multiple **public subnets** (one per AZ)
- an **Internet Gateway** already attached
- a **main route table** routing all traffic to the IGW
- a basic **Security Group**
- DNS support enabled by default

Characteristics:

- everything is **public by default**  
- quick to use  
- **not suitable for production**  
- limited control

**Create a new VPC**
![VPCS create a new VPC](./public/vpc_default.jpg)
- What are the core components?

        A VPC is made up of several networking components that work together to create a **secure** and **controllable** cloud environment. The key components are:
    - **VPC** (the overall private network)
- **CIDR Block** (IP address range)
- **Subnets**  
  - public subnets  
  - private subnets  
- **Internet Gateway (IGW)**
- **NAT Gateway**
- **Route Tables**
- **Security Groups**
- **Network ACLs (NACLs)**
- **Availability Zones (AZs)**


# IP addresses:

## Public vs Private IP addresses

🔹 Public IP Address

    🧑‍💻A public IP is an address that is reachable on the internet.

- Globally unique

- Assigned by ISPs or cloud providers

- Required for internet-facing resources

- Used by load balancers, NAT gateways, public EC2 instances, websites, DNS servers

Example:
8.8.8.8 (Google DNS)

Use case:
A web server that needs to be accessible across the internet.

---

🔹 Private IP Address

    🔐 A private IP is an address used inside a private network, such as your home WiFi or an AWS VPC.

 - Not reachable from the public internet

- Can be reused across different networks

 - Safer for internal communication

 - Used for databases, backend services, internal EC2 instances, containers

    **Private IP ranges:**

        10.0.0.0 – 10.255.255.255

        172.16.0.0 – 172.31.255.255

        192.168.0.0 – 192.168.255.255

Example:
10.0.1.12
192.168.0.1

Use case:
A database inside a private subnet communicating only with backend services.

---

## IPv4 vs IPv6

🔹 IPv4

    The original and most widely-used version of the Internet Protocol.

    Format:
    x.x.x.x (4 numbers between 0–255)

    Size:
    32-bit total → ~4.3 billion possible addresses

    Example:
    192.168.1.10
    54.23.180.55


**Pros:**

 - Simple

  - Compatible everywhere

   - Easy to manage

   - Used by the majority of cloud setups (including most AWS VPCs)

**Cons:**

 - Running out of addresses globally

 - Needs NAT to handle scaling

--- 
 🔹 IPv6

    The next-generation protocol designed to solve IPv4 exhaustion.

    Format:
    2001:0db8:85a3:0000:0000:8a2e:0370:7334

    Size:
    128-bit total → almost infinite addresses

👍🏻**Pros:**

- Huge address space

- No need for NAT

- Faster routing in some cases

- Designed for modern internet scale (IoT, cloud, etc.)

👎🏻**Cons:**

- Not fully adopted everywhere

- More complex address format

- Many systems still rely on IPv4

```
🧑‍💻 Public IP = reachable on the internet
🔐 Private IP = internal-only, not internet accessible

🛜IPv4 = older, 32-bit, widely used
☁️IPv6 = newer, 128-bit, huge address space
```


## CIDR Blocks

A **CIDR block** defines how many bits of an IP address belong to the **network** portion.  
The remaining bits are used for **hosts** (EC2 instances, containers, load balancers, etc.).

- The **larger** the CIDR number → the **smaller** the subnet.  
- The **smaller** the CIDR number → the **bigger** the network.

Examples:
- **/8** → very large network  
- **/16** → common size for VPCs  
- **/24** → common size for subnets

```
[8 bits].[8 bits].[8 bits].[8 bits] = 32 bits
10.0.0.0/24
10.0.0.0/16
10.0.0.0/8
/24 last number 10.0.0.1 - 10.0.0.254
/16 last two numbers 10.0.0.1 - 10.0.255.254
/8 last  three numbers 10.0.0.1 - 10.255.255.254

 https://www.youtube.com/watch?v=2doSoMN2xvI&t=127s

```
## Subnet masks
    A **subnet mask** defines which part of an IP address is the **network** portion and which part is the **host** portion.

- Works together with CIDR notation  
- Converts the CIDR (e.g., /24) into a binary mask  

Common examples:

| CIDR | Subnet Mask         | Meaning                          |
|------|----------------------|----------------------------------|
| /8   | 255.0.0.0            | Very large network               |
| /16  | 255.255.0.0          | Typical VPC size                 |
| /24  | 255.255.255.0        | Typical subnet size              |

A subnet mask of **/24** means:
- First 24 bits = network  
- Last 8 bits = host  

This is how AWS knows which IPs belong inside the same subnet.
## Reserved IP Ranges

There are two types of reserved IP ranges:

### 1. Private IP ranges (RFC1918)
These ranges are used inside private networks like VPCs, offices, and home WiFi:

- 10.0.0.0 – 10.255.255.255
- 172.16.0.0 – 172.31.255.255
- 192.168.0.0 – 192.168.255.255

They **cannot be reached from the internet** and are safe for internal communication.

---

### 2. Reserved IPs inside each AWS subnet
AWS also reserves **5 IP addresses** inside every subnet:

- Network address (first IP)
- AWS VPC router
- Reserved for AWS
- Reserved for AWS
- Broadcast address (last IP)

This means the usable range is always “**between**” the first and last IP.


## What is NAT?

**NAT (Network Address Translation)** allows resources in **private subnets** to access the internet **outbound**, while preventing the internet from initiating connections **inbound**.

Private subnets do not have public IP addresses, so they cannot reach the internet directly. 

A NAT device solves this by acting as a bridge.

---

### Why NAT is needed

**Private EC2 instances** often need to:

- **download software updates**
- access external APIs
- connect to package repositories (npm, apt, yum)
- send telemetry or logs

But they must remain **unreachable** from the public internet for security.  
            
        NAT enables this exact behaviour.

---

### NAT Gateway (AWS)

In AWS, the most common NAT solution is the **NAT Gateway**.

Key characteristics:

- Deployed in a **public subnet**
- Has a **public IP**
- Receives outbound traffic from private subnets
- Sends traffic to the internet on their behalf
- Returns responses back to the private instances
- The internet **cannot** initiate traffic through a NAT gateway

---

### How it works (simple flow)
Private EC2 → Route Table → NAT Gateway → Internet
Internet → NAT Gateway → Private EC2 (response only)

## Subnets

### Public and Private Subnets

A **subnet** is a smaller section of a VPC’s IP range.  
  
    A subnet is a defined set of network IP addresses that are used to increase the security and efficiency of network communications. You can think them like a postal codes, used for routing packages from one location to another.


We normally create two types:

![EC2 Instances in Public subnet](./public/Ec2%20instance%20in%20a%20public%20subnet.jpg)

#### **Public Subnet**
- Has a route to an **Internet Gateway (IGW)**
- Resources inside can receive traffic from the internet
- Used for: load balancers, NAT gateways, bastion hosts, public-facing apps

#### **Private Subnet**
- No direct route to the internet
- Can only reach the internet through a **NAT Gateway**
- Used for: databases, internal services, backend application servers

This separation improves security and follows cloud best practices.

---

### How do Availability Zones (AZs) relate to Subnets?

- A **subnet always lives inside exactly one Availability Zone**
- You **cannot** span a subnet across multiple AZs
- If you want high availability, you create **one subnet per AZ**
  - e.g., `public-subnet-a` in `eu-west-1a`
  - e.g., `public-subnet-b` in `eu-west-1b`

AWS recommends using **multiple AZs** so your architecture can survive datacentre failures.

In short:

**Subnets belong to AZs, and we create pairs of public/private subnets across AZs for resilience.**


## Gateways

### NAT Gateways vs Internet Gateways

**Internet Gateway (IGW)**  
- A gateway that allows resources in **public subnets** to send and receive traffic from the internet.  
- Required for public-facing services like load balancers or bastion hosts.  
- Does not perform NAT or hide IPs.

**NAT Gateway (NGW)**  
- Allows resources in **private subnets** to access the internet **outbound only**.  
- Prevents inbound connections from the internet.  
- Used for backend servers or databases that need updates but must remain private.

---

Resources in that subnet:
- Usually have a **public IPv4 address**  
- Can receive inbound connections from the internet  
- Can send outbound traffic directly

---

### Why do private subnets need NAT?

Private subnets do **not** have a route to the Internet Gateway.  
They cannot access the internet directly.

A **NAT Gateway** solves this by:

- Forwarding outbound traffic to the internet on behalf of private instances  
- Ensuring no inbound traffic can reach those instances  
- Keeping databases and backend services private and secure

This is essential for secure architectures.

---

### Cost Differences

- **Internet Gateway (IGW):**  
  - **Free** (no hourly charge)  
  - Only pays for data transfer

- **NAT Gateway:**  
  - **Paid service**  
  - Hourly charge + per-GB data processing fee  
  - More expensive due to managed NAT functionality

For cost-sensitive architectures, people sometimes replace NGW with:
- NAT **instances** (EC2 acting as NAT)  
- IPv6 (does not require NAT)

---

### Different Architectures

Common patterns include:

1. **Simple 2-tier architecture**
   - Public subnet: IGW, Load Balancer, NAT Gateway  
   - Private subnet: EC2, DB, backend services

2. **Multi-AZ architecture**
   - One public + one private subnet per AZ  
   - One NAT per AZ for high availability

3. **Cost-optimised architecture**
   - One NAT for multiple private subnets (less resilient but cheaper)

4. **IPv6 architecture (no NAT)**
   - Uses egress-only internet gateways  
   - Instances get globally routable IPv6 addresses  
   - No need for NAT

Each structure depends on cost, availability, and security needs.


### How do public subnets access the internet?

A subnet becomes **public** when its **route table** includes:
0.0.0.0/0 → Internet Gateway


## Route Tables

### What does a "default" route table look like?
A default VPC comes with a **main route table** that contains only one route:
Destination: 10.0.0.0/16 (VPC CIDR)
Target: local
```
This means:
- All traffic **inside the VPC** can communicate freely  
- No internet access until additional routes are added
```
---

### Local routing
Every route table always includes:
Destination: <VPC CIDR>

Target: local

```
This “local” route:
- Cannot be removed  
- Ensures all subnets inside the same VPC can talk to each other  
- Is the foundation of internal communication (EC2 ↔ RDS ↔ EC2 etc.)

---

### 0.0.0.0/0 routing
`0.0.0.0/0` means **any IP address** (all traffic that is not local).
```
Where this traffic goes defines the subnet type:
**Public subnet**


0.0.0.0/0 → Internet Gateway (IGW)
**Private subnet**
0.0.0.0/0 → NAT Gateway (NGW)
```

This single line decides whether a subnet is public or private.

---

### Routes to NAT gateway vs Internet gateway

| Subnet Type | 0.0.0.0/0 Route Goes To | Purpose |
|-------------|-------------------------|---------|
| **Public Subnet** | IGW | Public-facing apps, load balancers, bastion hosts |
| **Private Subnet** | NAT Gateway | Backend services needing outbound internet but no inbound access |

**IGW = inbound + outbound**  
**NAT Gateway = outbound only, inbound blocked**

---

### How do route table associations work?
- Every **subnet must be associated** with exactly **one** route table  
- A route table may be associated with **multiple** subnets  
- If a subnet is not manually associated, it automatically uses the **Main Route Table**

So normally:
- Public subnets → associated with a **public route table**
- Private subnets → associated with a **private route table**

This is how AWS decides:
- which subnets can access the internet  
- which must stay private  
- how traffic flows between subnets or out of the VPC
```


**Public subnet**




## SGs and NACLs:
- What are ports?
- Inbound vs Outbound rules
- Stateful vs stateless
- SG referencing
- Common SG architectures

## Bonus:
- DNS
- Route53
- Different VPC designs

## Reminders:
- Use images
- Make/link diagrams where possible
- Keep things fairly concise
- Guide should be usable by others
- Be ready to present your work tomorrow