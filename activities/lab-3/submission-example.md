# Lab 3 Submission (EXAMPLE)

*Note: This is an example of what your submission looks like. It uses the default VPC from the worked example in [`README.md`](README.md), not a client from the table in [`lab.md`](lab.md). Your group's numbers are different, so do not copy these answers.*

## About us

- Group number: 0 (example)
- Section: IV-XCSAD (example)
- Client: a campus coffee kiosk app (example)
- VPC CIDR: 172.31.0.0/16

## Task 1. Equal subnets

The example divides the VPC into 16 subnets. Your row says 4 or 8, so your table has 4 or 8 rows.

New prefix: /20

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 172.31.0.0/20 | 172.31.0.0 | 172.31.15.255 | 4,091 | 172.31.0.4 | 172.31.15.254 |
| 2 | 172.31.16.0/20 | 172.31.16.0 | 172.31.31.255 | 4,091 | 172.31.16.4 | 172.31.31.254 |
| 3 | 172.31.32.0/20 | 172.31.32.0 | 172.31.47.255 | 4,091 | 172.31.32.4 | 172.31.47.254 |
| 4 | 172.31.48.0/20 | 172.31.48.0 | 172.31.63.255 | 4,091 | 172.31.48.4 | 172.31.63.254 |
| 5 | 172.31.64.0/20 | 172.31.64.0 | 172.31.79.255 | 4,091 | 172.31.64.4 | 172.31.79.254 |
| 6 | 172.31.80.0/20 | 172.31.80.0 | 172.31.95.255 | 4,091 | 172.31.80.4 | 172.31.95.254 |
| 7 | 172.31.96.0/20 | 172.31.96.0 | 172.31.111.255 | 4,091 | 172.31.96.4 | 172.31.111.254 |
| 8 | 172.31.112.0/20 | 172.31.112.0 | 172.31.127.255 | 4,091 | 172.31.112.4 | 172.31.127.254 |
| 9 | 172.31.128.0/20 | 172.31.128.0 | 172.31.143.255 | 4,091 | 172.31.128.4 | 172.31.143.254 |
| 10 | 172.31.144.0/20 | 172.31.144.0 | 172.31.159.255 | 4,091 | 172.31.144.4 | 172.31.159.254 |
| 11 | 172.31.160.0/20 | 172.31.160.0 | 172.31.175.255 | 4,091 | 172.31.160.4 | 172.31.175.254 |
| 12 | 172.31.176.0/20 | 172.31.176.0 | 172.31.191.255 | 4,091 | 172.31.176.4 | 172.31.191.254 |
| 13 | 172.31.192.0/20 | 172.31.192.0 | 172.31.207.255 | 4,091 | 172.31.192.4 | 172.31.207.254 |
| 14 | 172.31.208.0/20 | 172.31.208.0 | 172.31.223.255 | 4,091 | 172.31.208.4 | 172.31.223.254 |
| 15 | 172.31.224.0/20 | 172.31.224.0 | 172.31.239.255 | 4,091 | 172.31.224.4 | 172.31.239.254 |
| 16 | 172.31.240.0/20 | 172.31.240.0 | 172.31.255.255 | 4,091 | 172.31.240.4 | 172.31.255.254 |

Reserved addresses of subnet 1: 172.31.0.0, 172.31.0.1, 172.31.0.2, 172.31.0.3, 172.31.15.255

Working for subnet 1:

```
16 subnets = 4 extra bits, so the new prefix is /16 + 4 = /20
host bits = 32 - 20 = 12, total = 2^12 = 4,096
first = 172.31.0.0
last  = first + 4,095 = 15 x 256 + 255 -> 172.31.15.255
usable = 4,096 - 5 = 4,091
first usable = 172.31.0.0 + 4 = 172.31.0.4
last usable  = 172.31.15.255 - 1 = 172.31.15.254
```

## Task 2. Subnets of a given size

The example uses subnets of size /24 and subnet number 5.

- 2a. 2^(24 - 16) = 256 subnets
- 2b. 256 - 5 = 251 usable addresses each
- 2c. CIDR: 172.31.4.0/24. Usable range: 172.31.4.4 to 172.31.4.254

Working for 2c:

```
a /24 has 256 addresses, so each subnet moves the 3rd octet by 1
subnet number 5 starts at 172.31.0.0 + (5 - 1) x 256 = 172.31.4.0
last address = 172.31.4.255
usable = 172.31.4.4 to 172.31.4.254
```

- 2d. 172.31.255.0/24

## Task 3. Subnets from host counts

The example uses private subnets that need 1,000 usable addresses and public subnets that need 200.

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /22 | 172.31.0.0/22 | ap-southeast-1a | 1,019 |
| private-b | /22 | 172.31.4.0/22 | ap-southeast-1b | 1,019 |
| public-a | /24 | 172.31.8.0/24 | ap-southeast-1a | 251 |
| public-b | /24 | 172.31.9.0/24 | ap-southeast-1b | 251 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 172.31.12.70/26 | Not valid | It does not start on a step for a /26. The valid block that holds the address is 172.31.12.64/26. |
| P2 | 172.31.10.0/24 | Valid | It is inside the VPC, starts on a step, is between /16 and /28, and overlaps none of our Task 3 subnets. |
| P3 | 172.31.9.128/25 | Not valid | It overlaps public-b, 172.31.9.0/24. |
| P4 | 172.32.0.0/24 | Not valid | It is outside the VPC, which ends at 172.31.255.255. |
