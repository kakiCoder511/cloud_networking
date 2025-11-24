In a new markdown file, cover the following:

# VPCs
- What are **VPCs**?
    
    - A Virtual Private Cloud is a secure, individual,private network inside AWS.
        - the IP address range
        - the subnets
        - how traffic flows
        - which resources are public or private
        - and the security rules between everything

- Why use/create/customise them?
        
        A VPC is essential because it gives you control, security, and structure over how your cloud resources behave.
1. **Security** 
            
    A custom VPC lets you design a secure network boundary:
        
    - Put sensitive services (like databases) in private subnets

    - Prevent direct internet access

    - Control traffic using route tables

    - Use Security Groups and NACLs for protection

    - Limit exposure of public-facing resources

    🧱In other words:
        **A custom VPC protects your application the way walls protect a house.**
    
 2. **Full Control of Networking**

    You decide:

   - the IP address range (CIDR block)

  - the number of subnets

  - which subnets are public vs private

  - how resources reach the internet (IGW / NAT Gateway)

  - how resources communicate with each other

Default VPC = AWS decides.
Custom VPC = you decide.
    

- What would a default VPC looklike?

    The default AWS network is convenient for beginners, but it isn’t suitable for real systems.
![VPCS Default](./public/vpc_default.jpg)
- What are the core components?

## IP addresses:
- Public vs Private IP addresses
- IPv4 vs IPv6

 **CIDR blocks**

 A CIDR like /8, /16, /24 tells us how many bits represent the network.
The larger the number, the smaller the subnet.
/8 is a huge network, /16 is common for VPCs, and /24 is ideal for subnets.


 - Subnet masks
- Reserved IP ranges
- What is NAT?

## Subnets:
- Public and Private subnets
- How do AZs relate to subnets?

## Gateways:
- NAT Gateways vs Internet Gateways
- How do public subnets access the internet?
- Why do private subnets need NAT?
- Are there cost differences?
- Different architectures?

## Route Tables:
- What does a "default" route table look like?
- Local routing
- 0.0.0.0/0 routing
- Routes to NAT gateway vs internet gateway
- How do RT association work?

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