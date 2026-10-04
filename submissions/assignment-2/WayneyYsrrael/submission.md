# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: WayneyYsrrael
- Section: IV-ACSAD
- IAM user name that I signed in with: acsad-g09
- X: 139

---

## Part A. Explore

### A1. The VPC

Default VPC IPv4 CIDR:

172.31.0.0/16

Number of addresses in that CIDR:

65,536

### A2. The subnets

| Availability Zone | IPv4 CIDR |
| --- | --- |
| apse1-az2 (ap-southeast-1a) | 172.31.32.0/20 |
| apse1-az1 (ap-southeast-1b) | 172.31.16.0/20 |
| apse1-az3 (ap-southeast-1c) | 172.31.0.0/20 |

Screenshot 1. Save it as screenshot-1-subnets.png in your folder. The image line below shows it.
<img width="1917" height="1032" alt="screenshot-1-subnets" src="https://github.com/user-attachments/assets/e2828888-49f5-4275-9ae2-628662f4bbc8" />


### A3. Available addresses

Available IPv4 addresses in each subnet:

ap-southeast-1a: 4,090, ap-southeast-1b: 4,091, ap-southeast-1c: 4,091.

Why is the number lower than 4,096?

A /20 subnet has 4,096 IPv4 addresses. AWS reserves 5 addresses in every subnet, so an empty subnet normally has 4,091 available addresses.

What uses the missing address in the subnet with the lowest number?

The subnet with the lowest number is ap-southeast-1a, which has 4,090 available addresses. One additional address is being used by a network interface in that subnet, likely from an EC2 instance used in the class labs.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 | igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local |

Screenshot 2. Save it as screenshot-2-routes.png in your folder. The image line below shows it.
<img width="1906" height="1028" alt="screenshot-2-routes" src="https://github.com/user-attachments/assets/9bdca396-6dae-42ab-a880-38a6b59abf82" />



### A5. Public or private

Are the default subnets public or private? Which route proves it?

The default subnets are public. The route 0.0.0.0/0 sends traffic to the internet gateway (igw-0943e7e6f88293168), which proves that the subnets have a route to the internet.

### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

The default subnets will no longer have internet access because the 0.0.0.0/0 route points to the Internet Gateway.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No. There is no NAT gateway, so a server in a private subnet would not have a route through a NAT gateway to reach the internet.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| *   | 0.0.0.0/0 | Deny  |

How is a network ACL different from a security group?

A network ACL controls traffic at the subnet level, while a security group controls traffic at the instance level. A network ACL is stateless, so inbound and outbound traffic need separate rules, and it can have allow and deny rules. A security group is stateful and has allow rules only.

Screenshot 3. Save it as screenshot-3-network-acl.png in your folder. The image line below shows it.

<img width="1908" height="1028" alt="screenshot-3-network-acl" src="https://github.com/user-attachments/assets/cc6d4f0d-f0d9-4688-b67e-ee93ae698331" />


### A9. The default security group

Inbound rule (type and source):

Type All traffic — source: the same security group (sg-0c5b6d4081cf0a534)

Which resources can send traffic to an instance that uses it?

Resources that are associated with the same default security group can send traffic to the instance.

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.139.0.0/24
- Private subnet CIDR: 10.139.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.139.0.0/16 | local |
| 0.0.0.0/0     | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.139.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

Excalidraw

Save your diagram as vpc-diagram.png in your folder. The image line below shows it.

<img width="1558" height="835" alt="vpc-diagram" src="https://github.com/user-attachments/assets/cd343cf1-7932-4736-a7af-472bf163fd94" />


### B4. Predict a change

Can you still open the web page from your laptop? Why?

No, I could not open the web page anymore. The route 0.0.0.0/0 is the route that sends internet traffic to the internet gateway. Without this route, the instance has no path for traffic between itself and my laptop on the internet. Having a public IPv4 address alone is not enough without a route.

Can the instance still reach another instance in the VPC? Why?

Yes, it can. The local route 10.139.0.0/16 is still in the route table. This route allows instances in the VPC to communicate with each other, so deleting the 0.0.0.0/0 route does not affect communication inside the VPC.

### B5. Place a database

Which subnet gets the database? Why?

The database goes in the private subnet, 10.139.1.0/24. Its route table has no route to the internet gateway, so the database cannot be reached directly from the internet. Resources inside the VPC can still communicate with the database through the local route.

### B6. My question about VPCs

What is your question, and what made you think of it?

Can a private subnet access the internet without making the subnet public, and how does a NAT gateway allow this? I thought of it because the private subnet in my VPC does not have a route to the internet gateway, but servers in private subnets may still need to download updates from the internet.
