# Lab 3 Submission

## About us

- Group number: 10 
- Section: IV-ACSAD
- Client: A print shop order portal
- VPC CIDR: 172.22.0.0/16

## Task 1. Equal subnets

New prefix: /19

| # | CIDR | First | Last | Usable | First usable | Last usable |
|---|------|-------|------|--------|--------------|-------------|
| 1 | 172.22.0.0/19 | 172.22.0.0 | 172.22.31.255 | 8,187 | 172.22.0.4 | 172.22.31.254 |
| 2 | 172.22.32.0/19 | 172.22.32.0 | 172.22.63.255 | 8,187 | 172.22.32.4 | 172.22.63.254 |
| 3 | 172.22.64.0/19 | 172.22.64.0 | 172.22.95.255 | 8,187 | 172.22.64.4 | 172.22.95.254 |
| 4 | 172.22.96.0/19 | 172.22.96.0 | 172.22.127.255 | 8,187 | 172.22.96.4 | 172.22.127.254 |
| 5 | 172.22.128.0/19 | 172.22.128.0 | 172.22.159.255 | 8,187 | 172.22.128.4 | 172.22.159.254 |
| 6 | 172.22.160.0/19 | 172.22.160.0 | 172.22.191.255 | 8,187 | 172.22.160.4 | 172.22.191.254 |
| 7 | 172.22.192.0/19 | 172.22.192.0 | 172.22.223.255 | 8,187 | 172.22.192.4 | 172.22.223.254 |
| 8 | 172.22.224.0/19 | 172.22.224.0 | 172.22.255.255 | 8,187 | 172.22.224.4 | 172.22.255.254 |

Reserved addresses of subnet 1: `172.22.0.0`, `172.22.0.1`, `172.22.0.2`, `172.22.0.3`, `172.22.0.255`

Working for subnet 1: 

```
8 subnets = 3 extra bits (2^3 = 8), so
New prefix = /16 + 3 = /19
Host bits = 32 - 19 = 13
Total addresses = 2^13 = 8,192
Usable = 8,192 - 5 = 8,187
First = 172.22.0.0
Last  = first + 8,191 = 172.22.31.255
First usable = first + 4 = 172.22.0.4
Last usable  = last - 1 = 172.22.31.254
```

## Task 2. Subnets of a given size

- 2a. `2^(20 - 16) = 16` subnets
- 2b. `4,096 - 5 = 4,091` usable addresses each
- 2c. `CIDR: 172.22.64.0/20`. Usable range: `172.22.64.4` to `172.22.79.254`

Working for 2c:

```
Subnet size of /20 = 4,096 addresses, so 
Each subnet moves the 3rd octet by 16
Subnet number 5 starts at 172.22.0.0 + (5 - 1) x 4,096 = 172.22.64.0
Last address = 172.22.64.0 + 4,095 = 172.22.79.255
Usable range = 172.22.64.4 to 172.22.79.254
```

- 2d. `172.22.240.0/20`

## Task 3. Subnets from host counts

Private needs `14,877` usable addresses: 14,877 + 5 = 14,882, smallest block is 16,384 = /18 (16,379 usable).

Public needs `5,820` usable addresses: 5,820 + 5 = 5,825, smallest block is 8,192 = /19 (8,187 usable).

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /18 | 172.22.0.0/18 | ap-southeast-1a | 16,379 |
| private-b | /18 | 172.22.64.0/18 | ap-southeast-1b | 16,379 |
| public-a | /19 | 172.22.128.0/19 | ap-southeast-1a | 8,187 |
| public-b | /19 | 172.22.160.0/19 | ap-southeast-1b | 8,187 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 172.22.192.0/30 | Not valid | A /30 is smaller than the /28 limit, so it is outside the allowed range of /16 to /28. |
| P2 | 172.23.0.0/18 | Not valid | It is outside the VPC, which ends at 172.22.255.255. |
| P3 | 172.22.224.0/20 | Valid | It is inside the VPC, starts on a step for a /20 (224 is a multiple of 16), is between /16 and /28, and overlaps none of the subnets, which end at 172.22.191.255. |
| P4 | 172.22.212.202/20 | Not valid | It does not start on a step for a /20. The valid block that holds the address is 172.22.208.0/20. |