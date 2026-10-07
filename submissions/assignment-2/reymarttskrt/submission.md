# Assignment 2 Submission

## About me

- GitHub username: reymarttskrt
- Section: IV-ACSAD
- IAM user name that I signed in with: acsad-g03
- X: 170

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
| apse1-az1 (ap-southeast-1b) | 172.31.16.0/20  |
| apse1-az3 (ap-southeast-1c) | 172.31.0.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.

<img width="1919" height="1008" alt="screenshot-1-subnets" src="https://github.com/user-attachments/assets/c378f543-4a63-4352-b18a-08ddcd1536b4" />

### A3. Available addresses

Available IPv4 addresses in each subnet: 

4090, 4091, 4091

Why is the number lower than 4,096?

AWS reserves 5 IP addresses in every subnet for its own networking management (network address, VPC router, DNS, future use, and broadcast), leaving 4,091 usable addresses out of 4,096.

What uses the missing address in the subnet with the lowest number?

An active or stopped EC2 instance (or elastic network interface / ENI) provisioned in that subnet is using the 1 missing IP address.

### A4. The route table

| Destination | Target |
| --- | --- |
| 172.31.0.0/16 | local |
| 0.0.0.0/0 | igw-0943e7e6f88293168 |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

<img width="1676" height="307" alt="screenshot-2-routes" src="https://github.com/user-attachments/assets/d95a71ab-3cc8-49ab-ab99-19f6cdf0df37" />

### A5. Public or private

Are the default subnets public or private? Which route proves it?

They are public subnets. The route with destination `0.0.0.0/0` targeting the internet gateway (`igw-0943e7e6f88293168`) proves it, because it directs all external internet traffic to the internet gateway.

### A6. The internet gateway

State of the internet gateway:

attached

What happens to the default subnets if the gateway is detached?

The default subnets will lose their connection to the internet and become private subnets. Instances in those subnets will no longer be able to communicate with or receive traffic from the internet.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No. A private subnet does not have a direct route to an internet gateway, and without a NAT gateway to translate and forward outbound requests, instances in the private subnet cannot reach the internet to download updates.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | allow |
| * | 0.0.0.0/0 | deny |

How is a network ACL different from a security group?

A network ACL is a stateless firewall at the subnet level that evaluates numbered allow and deny rules in order, whereas a security group is a stateful firewall at the instance level that evaluates only allow rules.

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

<img width="1920" height="606" alt="screenshot-3-network-acl" src="https://github.com/user-attachments/assets/d6b3011b-afd0-47ef-a756-5493b96cf453" />

### A9. The default security group

Inbound rule (type and source):

type: All traffic 
source: sg-0c5b6d4081cf0a534 / default

Which resources can send traffic to an instance that uses it?

Only other instances and resources within the VPC that are assigned the exact same default security group (`sg-0c5b6d4081cf0a534`).

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.170.0.0/24
- Private subnet CIDR: 10.170.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.170.0.0/16 | local |
| 0.0.0.0/0 | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.170.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

Excalidraw

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

<img width="761" height="648" alt="vpc-diagram" src="https://github.com/user-attachments/assets/a1a028c3-f713-4876-832c-2d90884a7a42" />

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No. Without the `0.0.0.0/0` route pointing to the internet gateway, the VPC has no path to route traffic back and forth between the internet and the instance.

Can the instance still reach another instance in the VPC? Why?

Yes. The `172.31.0.0/16 -> local` route remains in the route table, which allows all instances in the VPC to communicate internally with each other.

### B5. Place a database

Which subnet gets the database? Why?

The private subnet (`10.170.1.0/24`). A database stores sensitive data and should be isolated from direct internet access to prevent unauthorized attacks. It only needs to communicate internally with application/web servers in the VPC via the local route.

### B6. My question about VPCs

What is your question, and what made you think of it?

Question: When two instances in different private subnets located in different Availability Zones communicate using the local route, does the traffic travel across AWS's private physical fiber backbone without ever touching the public internet?

What made me think of it: Since subnets are isolated per data center (AZ) and private subnets have no internet access, I wondered how AWS securely routes high-speed internal traffic across physical data center buildings.<img width="1919" height="1008" alt="screenshot-1-subnets" src="https://github.com/user-attachments/assets/84472618-2459-4871-acb1-1051bd5f46d2" />
