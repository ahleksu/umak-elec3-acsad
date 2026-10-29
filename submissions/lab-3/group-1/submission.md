# Lab 3 Submission

## About us

- Group number: 1
- Section: IV-ACSAD
- Client: A school canteen ordering app
- VPC CIDR: `10.66.0.0/17`

## Task 1. Equal subnets

New prefix: `/19`

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `10.66.0.0/19` | 10.66.0.0 | 10.66.31.255 | 8,187 | 10.66.0.4 | 10.66.31.254 |
| 2 | `10.66.32.0/19` | 10.66.32.0 | 10.66.63.255 | 8,187 | 10.66.32.4 | 10.66.63.254 |
| 3 | `10.66.64.0/19` | 10.66.64.0 | 10.66.95.255 | 8,187 | 10.66.64.4 | 10.66.95.254 |
| 4 | `10.66.96.0/19` | 10.66.96.0 | 10.66.127.255 | 8,187 | 10.66.96.4 | 10.66.127.254 |

Reserved addresses of subnet 1: `10.66.0.0`, `10.66.0.1`, `10.66.0.2`, `10.66.0.3`, and `10.66.31.255`.

Working for subnet 1:

```text
4 equal subnets require 2 extra prefix bits because 2^2 = 4.
New prefix = 17 + 2 = /19.
Host bits = 32 - 19 = 13.
Total addresses = 2^13 = 8,192.
Usable addresses = 8,192 - 5 = 8,187.
Third-octet step = 2^(24 - 19) = 32.
Subnet 1 starts at 10.66.0.0 and covers third-octet values 0 through 31.
Last address = first address + 8,191 = 10.66.31.255.
First usable = first address + 4 = 10.66.0.4.
Last usable = last address - 1 = 10.66.31.254.
```

## Task 2. Subnets of a given size

- 2a. `2^(23 - 17) = 64` subnets of size `/23` fit in the VPC.
- 2b. Each subnet has `2^(32 - 23) - 5 = 512 - 5 = 507` usable addresses.
- 2c. CIDR: `10.66.28.0/23`. Usable range: `10.66.28.4` to `10.66.29.254`.

Working for 2c:

```text
Subnet size = 2^(32 - 23) = 512 addresses.
Subnet 1 starts at 10.66.0.0.
Subnet 15 offset = (15 - 1) x 512 = 7,168 addresses.
7,168 / 256 = 28, so the offset adds 28 to the third octet.
Subnet 15 starts at 10.66.28.0.
A /23 covers two third-octet values, so it ends at 10.66.29.255.
CIDR = 10.66.28.0/23.
First usable = 10.66.28.0 + 4 = 10.66.28.4.
Last usable = 10.66.29.255 - 1 = 10.66.29.254.
```

- 2d. The last subnet is `10.66.126.0/23`, covering `10.66.126.0` to `10.66.127.255`.

## Task 3. Subnets from host counts

Each private subnet needs 2,975 usable addresses, and each public subnet needs 2,149. A `/21` has only 2,043 usable addresses, which is insufficient for either requirement. A `/20` has 4,091 usable addresses, so `/20` is the smallest block that meets each requirement.

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | `/20` | `10.66.0.0/20` | ap-southeast-1a | 4,091 |
| private-b | `/20` | `10.66.16.0/20` | ap-southeast-1b | 4,091 |
| public-a | `/20` | `10.66.32.0/20` | ap-southeast-1a | 4,091 |
| public-b | `/20` | `10.66.48.0/20` | ap-southeast-1b | 4,091 |

A `/20` advances by 16 in the third octet. The four subnets occupy `10.66.0.0` through `10.66.63.255`, without overlaps or gaps, and all are inside the VPC.

## Task 4. Proposed subnets

The VPC spans `10.66.0.0` to `10.66.127.255`. These proposals are checked against the Task 3 plan.

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | `10.66.8.0/21` | Not valid | It overlaps `private-a` (`10.66.0.0/20`), because its range `10.66.8.0` to `10.66.15.255` lies inside that subnet. |
| P2 | `10.66.128.0/19` | Not valid | It is outside the VPC, whose last address is `10.66.127.255`. |
| P3 | `10.66.96.0/20` | Valid | It is inside the VPC, starts on a valid `/20` boundary, has an allowed prefix, and does not overlap any Task 3 subnet. |
| P4 | `10.66.86.191/20` | Not valid | It does not start on a `/20` boundary; the block of the same size containing its address is `10.66.80.0/20`. |
