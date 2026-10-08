Part A
 
 
A6 — Internet Gateway
The Internet Gateway is Attached to the default VPC. If the Internet Gateway were detached, the VPC would no longer have a working path to the internet through that gateway, so the subnets using the 0.0.0.0/0 route to the gateway would lose their internet connectivity.




A7 — NAT Gateways
There are 0 NAT gateways in the VPC. If a private subnet were added now, a server in that private subnet would not be able to access the internet to download updates, because there is no NAT gateway providing an outbound path to the internet.

A8 — Default Network ACL inbound rules
 
A Network ACL is a firewall at the subnet level that supports both allow and deny rules and is stateless. A Security Group is a firewall at the resource level that only uses allow rules and is stateful.
 
A9 — Default Security Group
Inbound rule: All traffic
Source: The default security group (sg-0c5b6d4081cf0a534)
Resources that can send traffic: Resources that are associated with the same default security group can send traffic to the instance.
  A1: 172.31.0.0/16 — 65,536 IPv4 addresses 
  A2: 3 subnets: 
•	172.31.32.0/20 — ap-southeast-1a — 4090 available 
•	172.31.16.0/20 — ap-southeast-1b — 4091 available 
•	172.31.0.0/20 — ap-southeast-1c — 4091 available 
  A3: /20 has 4,096 addresses; AWS reserves 5, leaving 4,091 usable 
  A4: 0.0.0.0/0 → igw-0943e7e6f88293168; 172.31.0.0/16 → local 
  A5: Default subnets are public because of the route to the Internet Gateway 

  
  A6: Internet Gateway is Attached 
  A7: 0 NAT gateways 
  A8: NACL rule 100 allows 0.0.0.0/0; * denies 0.0.0.0/0 
  A9: Default SG allows all traffic from resources using the same default SG
 
part b
VPC CIDR:
10.126.0.0/16
Public subnet:
10.126.0.0/24
Private subnet:
10.126.1.0/24

Public route table
Destination: 
10.126.0.0/16 
0.0.0.0/0
Target:
local
Internet Gateway

Private route table
Destination: 10.126.0.0/16
Target: local

The assignment asks what happens if you delete: 0.0.0.0/0
If the 0.0.0.0/0 route is deleted, an instance in the public subnet would no longer
have a route to the internet, so I could not open its web page from my laptop.
However, it could still communicate with another instance in the same VPC because the local route remains.

Where should the database go?
The database should be placed in the private subnet because it does not need to be
directly accessible from the internet. Keeping it in the private subnet provides a safer
separation from internet-facing resources.

How can a private subnet access the internet without allowing the internet to initiate
connections to the private instances?

- This question came up while learning about private subnets and NAT gateways,
- especially how a private server can make an outbound connection without becoming
- directly accessible from the internet.


