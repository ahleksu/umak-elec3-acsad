# Lab 3 Submission

## About us

- Group number: 5
- Section: IV-ACSAD
- Client: A campus library reservation system
- VPC CIDR: 10.192.64.0/18

## Task 1. Equal subnets

New prefix: /20

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.192.64.0/20 | 10.192.64.0 | 10.192.79.255 | 4,091 | 10.192.64.4 | 10.192.79.254 |
| 2 | 10.192.80.0/20 | 10.192.80.0 | 10.192.95.255 | 4,091 | 10.192.80.4 | 10.192.95.254 |
| 3 | 10.192.96.0/20 | 10.192.96.0 | 10.192.111.255 | 4,091 | 10.192.96.4 | 10.192.111.254 |
| 4 | 10.192.112.0/20 | 10.192.112.0 | 10.192.127.255 | 4,091 | 10.192.112.4 | 10.192.127.254 |

Reserved addresses of subnet 1: 10.192.64.0, 10.192.64.1, 10.192.64.2, 10.192.64.3, 10.192.79.255

Working for subnet 1:

```
The VPC is 10.192.64.0/18. 4 subnets = 2 extra bits, so the new prefix is /18 + 2 = /20
host bits = 32 - 20 = 12, total = 2^12 = 4,096 addresses per subnet
a /20 covers 4,096 / 256 = 16 values of the 3rd octet
first = 10.192.64.0 (the first address of the VPC)
last  = first + 4,095 = 64 + 15 = 79 in the 3rd octet, 255 in the 4th -> 10.192.79.255
usable = 4,096 - 5 = 4,091
first usable = 10.192.64.0 + 4 = 10.192.64.4
last usable  = 10.192.79.255 - 1 = 10.192.79.254
reserved = first four (.64.0 to .64.3) and the last address (10.192.79.255)
next subnets start 16 higher in the 3rd octet: 80, 96, 112
check: the last subnet ends at 10.192.127.255, which is the end of the VPC
```

## Task 2. Subnets of a given size

- 2a. 2^(24 - 18) = 64 subnets
- 2b. 256 - 5 = 251 usable addresses each
- 2c. CIDR: 10.192.68.0/24. Usable range: 10.192.68.4 to 10.192.68.254

Working for 2c:

```
a /24 has 256 addresses, so each subnet moves the 3rd octet by 1
subnet number 5 starts at 10.192.64.0 + (5 - 1) x 256 = 10.192.68.0
check by counting: subnet 1 = .64, 2 = .65, 3 = .66, 4 = .67, 5 = .68
last address = 10.192.68.255
usable = 10.192.68.0 + 4 = 10.192.68.4 to 10.192.68.255 - 1 = 10.192.68.254
```

- 2d. 10.192.127.0/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /20 | 10.192.64.0/20 | ap-southeast-1a | 4,091 |
| private-b | /20 | 10.192.80.0/20 | ap-southeast-1b | 4,091 |
| public-a | /21 | 10.192.96.0/21 | ap-southeast-1a | 2,043 |
| public-b | /21 | 10.192.104.0/21 | ap-southeast-1b | 2,043 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.192.128.0/20 | Not valid | It starts at 10.192.128.0, which is past the end of the VPC at 10.192.127.255. |
| P2 | 10.192.72.0/21 | Not valid | It covers 10.192.72.0 to 10.192.79.255, which lies inside private-a (10.192.64.0/20). |
| P3 | 10.192.120.0/21 | Valid | It covers 10.192.120.0 to 10.192.127.255, which is inside the VPC, on a step for a /21, between /16 and /28, and clear of public-b, which ends at 10.192.111.255. |
| P4 | 10.192.112.0/29 | Not valid | A /29 is smaller than /28, which is the smallest subnet size AWS allows. |
