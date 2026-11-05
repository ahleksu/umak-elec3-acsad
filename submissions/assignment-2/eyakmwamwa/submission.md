# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: eyakmwamwa
- Section: IV-ACSAD
- IAM user name that I signed in with: acsad-g02
- X: 115

---

## Part A. Explore

### A1. The VPC

Default VPC IPv4 CIDR:

172.31.0.0/16

Number of addresses in that CIDR:

65536

### A2. The subnets

| Availability Zone | IPv4 CIDR |
| --- | --- |
| ap-southeast-1a | 172.31.32.0/20 |
| ap-southeast-1b | 172.31.16.0/20 |
| ap-southeast-1c | 172.31.0.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.

<img width="1919" height="764" alt="image" src="https://github.com/user-attachments/assets/29e3246b-17c8-4a32-a03c-d12f4bc7cf95" />


### A3. Available addresses

Available IPv4 addresses in each subnet:

4091

Why is the number lower than 4,096?

AWS reserves 5 addresses in every subnet for internal networking (the first four and the last one).

What uses the missing address in the subnet with the lowest number?

AWS reserves them for IP routing, DNS, and network management within the subnet.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 | igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

<img width="1517" height="670" alt="image" src="https://github.com/user-attachments/assets/ab55189d-75ef-4aa5-9615-f51495cc42da" />


### A5. Public or private

Are the default subnets public or private? Which route proves it?

Public subnets. The route pointing 0.0.0.0/0 to the internet gateway proves it.

### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

They lose their direct connection to the internet, turning them effectively into private subnets.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No, because a private subnet has no route to an internet gateway or NAT gateway.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny |

How is a network ACL different from a security group?

Network ACLs act as a stateless firewall at the subnet level and support deny rules, whereas security groups are stateful firewalls attached to individual resources and have allow rules only.

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

<img width="1516" height="693" alt="image" src="https://github.com/user-attachments/assets/5442bc31-3f83-4ac1-8b67-90b6da621194" />

### A9. The default security group

Inbound rule (type and source):

All traffic from its own security group ID (or default settings allowing internal traffic).

Which resources can send traffic to an instance that uses it?

Other resources associated with the same default security group.

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.115.1.0/24
- Private subnet CIDR: 10.115.2.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.115.0.0/16 | local |
| 0.0.0.0/0 | Internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.115.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

Excalidraw

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

<img width="927" height="543" alt="image" src="https://github.com/user-attachments/assets/e7e461f0-cd3a-432a-a5c9-43be9af386cc" />

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No, because removing or changing the 0.0.0.0/0 route to the internet gateway breaks the external path for incoming web traffic.

Can the instance still reach another instance in the VPC? Why?

Yes, because the local route (10.115.0.0/16 to local) remains intact.

### B5. Place a database

Which subnet gets the database? Why?

The private subnet, because databases handle sensitive data and should never be directly exposed to the internet.

### B6. My question about VPCs

What is your question, and what made you think of it?

How does VPC Peering securely connect two completely separate VPCs without exposing traffic to the public internet?
