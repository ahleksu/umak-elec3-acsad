# Lab 3 Submission

## About us

- Group number: 4
- Section: IV-ACSAD
- Client: A sari-sari store point-of-sale chain
- VPC CIDR: 10.170.224.0/20

## Task 1. Equal subnets

New prefix: /23

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.170.224.0/23 | 10.170.224.0 | 10.170.225.255 | 507 | 10.170.224.4 | 10.170.225.254 |
| 2 | 10.170.226.0/23 | 10.170.226.0 | 10.170.227.255 | 507 | 10.170.226.4 | 10.170.227.254 |
| 3 | 10.170.228.0/23 | 10.170.228.0 | 10.170.229.255 | 507 | 10.170.228.4 | 10.170.229.254 |
| 4 | 10.170.230.0/23 | 10.170.230.0 | 10.170.231.255 | 507 | 10.170.230.4 | 10.170.231.254 |
| 5 | 10.170.232.0/23 | 10.170.232.0 | 10.170.233.255 | 507 | 10.170.232.4 | 10.170.233.254 |
| 6 | 10.170.234.0/23 | 10.170.234.0 | 10.170.235.255 | 507 | 10.170.234.4 | 10.170.235.254 |
| 7 | 10.170.236.0/23 | 10.170.236.0 | 10.170.237.255 | 507 | 10.170.236.4 | 10.170.237.254 |
| 8 | 10.170.238.0/23 | 10.170.238.0 | 10.170.239.255 | 507 | 10.170.238.4 | 10.170.239.254 |

Reserved addresses of subnet 1: 10.170.224.0, 10.170.224.1, 10.170.224.2, 10.170.224.3, 10.170.225.255

Working for subnet 1:

```
8 subnets = 3 extra bits, so the new prefix is /20 + 3 = /23
host bits = 32 - 23 = 9, total = 2^9 = 512
first = 10.170.224.0
last  = first + 511 = 1 x 256 + 255 -> 10.170.225.255
usable = 512 - 5 = 507
first usable = 10.170.224.0 + 4 = 10.170.224.4
last usable  = 10.170.225.255 - 1 = 10.170.225.254
```

## Task 2. Subnets of a given size

- 2a. 2^(24 - 20) = 16 subnets
- 2b. 256 - 5 = 251 usable addresses each
- 2c. CIDR: 10.170.237.0/24. Usable range: 10.170.237.4 to 10.170.237.254

Working for 2c:

```
a /24 has 256 addresses, so each subnet moves the 3rd octet by 1
subnet number 14 starts at 10.170.224.0 + (14 - 1) x 256 = 10.170.237.0
last address = 10.170.237.255
usable = 10.170.237.4 to 10.170.237.254
```

- 2d. 10.170.239.0/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /24 | 10.170.224.0/24 | ap-southeast-1a | 251 |
| private-b | /24 | 10.170.225.0/24 | ap-southeast-1b | 251 |
| public-a | /26 | 10.170.226.0/26 | ap-southeast-1a | 59 |
| public-b | /26 | 10.170.226.64/26 | ap-southeast-1b | 59 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.170.231.27/26 | Not valid | It does not start on a step for a /26. The valid block that holds the address is 10.170.231.0/26. |
| P2 | 10.170.235.192/26 | Valid | It is inside the VPC, starts on a step, is between /16 and /28, and overlaps none of our Task 3 subnets. |
| P3 | 10.170.240.0/22 | Not valid | It is outside the VPC, which ends at 10.170.239.255. |
| P4 | 10.170.225.128/25 | Not valid | It overlaps private-b, 10.170.225.0/24. |
