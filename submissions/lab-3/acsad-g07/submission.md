# Lab 3 Submission

## About us

- Group number: 7
- Section: IV-ACSAD
- Client: A bakery delivery app
- VPC CIDR: 192.168.160.0/21

## Task 1. Equal subnets

New prefix: /24 (8 subnets need 3 extra bits, so /21 + 3 = /24)

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 192.168.160.0/24 | 192.168.160.0 | 192.168.160.255 | 251 | 192.168.160.4 | 192.168.160.254 |
| 2 | 192.168.161.0/24 | 192.168.161.0 | 192.168.161.255 | 251 | 192.168.161.4 | 192.168.161.254 |
| 3 | 192.168.162.0/24 | 192.168.162.0 | 192.168.162.255 | 251 | 192.168.162.4 | 192.168.162.254 |
| 4 | 192.168.163.0/24 | 192.168.163.0 | 192.168.163.255 | 251 | 192.168.163.4 | 192.168.163.254 |
| 5 | 192.168.164.0/24 | 192.168.164.0 | 192.168.164.255 | 251 | 192.168.164.4 | 192.168.164.254 |
| 6 | 192.168.165.0/24 | 192.168.165.0 | 192.168.165.255 | 251 | 192.168.165.4 | 192.168.165.254 |
| 7 | 192.168.166.0/24 | 192.168.166.0 | 192.168.166.255 | 251 | 192.168.166.4 | 192.168.166.254 |
| 8 | 192.168.167.0/24 | 192.168.167.0 | 192.168.167.255 | 251 | 192.168.167.4 | 192.168.167.254 |

Reserved addresses of subnet 1: 192.168.160.0, 192.168.160.1, 192.168.160.2, 192.168.160.3, 192.168.160.255

Working for subnet 1:

```
8 subnets = 2^3, so extra bits = 3, new prefix = 21 + 3 = /24
total = 2^(32 - 24) = 256
first = 192.168.160.0 (start of the VPC)
last = first + 255 = 192.168.160.255
usable = 256 - 5 = 251
first usable = first + 4 = 192.168.160.4
last usable = last - 1 = 192.168.160.254
```

## Task 2. Subnets of a given size

- 2a. 2^(25 - 21) = 16 subnets
- 2b. 128 - 5 = 123 usable addresses each
- 2c. CIDR: 192.168.164.128/25. Usable range: 192.168.164.132 to 192.168.164.254

Working for 2c:

```
size of a /25 = 128
subnet number 10 starts at 192.168.160.0 + (10 - 1) x 128 = + 1,152
1,152 = 4 x 256 + 128, so add 4 to the 3rd octet and 128 to the 4th
first = 192.168.164.128, last = 192.168.164.255
first usable = first + 4 = 192.168.164.132
last usable = last - 1 = 192.168.164.254
```

- 2d. 192.168.167.128/25 (subnet 16 starts at 192.168.160.0 + 15 x 128 = + 1,920 = 7 x 256 + 128)

## Task 3. Subnets from host counts

Private needs 473 usable: 473 + 5 = 478, smallest block is 512 = /23 (507 usable).
Public needs 70 usable: 70 + 5 = 75, smallest block is 128 = /25 (123 usable).

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /23 | 192.168.160.0/23 | ap-southeast-1a | 507 |
| private-b | /23 | 192.168.162.0/23 | ap-southeast-1b | 507 |
| public-a | /25 | 192.168.164.0/25 | ap-southeast-1a | 123 |
| public-b | /25 | 192.168.164.128/25 | ap-southeast-1b | 123 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 192.168.166.128/25 | Valid | Inside the VPC, starts on a /25 step (.128), is between /16 and /28, and does not overlap the Task 3 plan, which ends at 192.168.164.255. |
| P2 | 192.168.168.0/23 | Not valid | It is outside the VPC, which ends at 192.168.167.255. |
| P3 | 192.168.167.0/30 | Not valid | A /30 is smaller than /28, the smallest subnet that AWS allows. |
| P4 | 192.168.165.164/25 | Not valid | A /25 must start at .0 or .128, and .164 is not on a step. The /25 that holds .164 is 192.168.165.128/25. |
