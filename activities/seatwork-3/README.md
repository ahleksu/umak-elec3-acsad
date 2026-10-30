# Seatwork 3: Host Your Linktree Page on Amazon S3

This is a self-guided activity. You take your page from [Seatwork 2](../seatwork-2/README.md) and put it on the internet. You do not run a server for it. Amazon S3 stores the file and sends it to every visitor.

Work through this page first. It explains the S3 ideas that each step uses. Then follow the steps in [`seatwork.md`](seatwork.md). Finish Seatwork 2 first.

## What you do

This is group work. You sign in with your group IAM user, the same user from Lab 1 and Lab 2. Your group submits one Pull Request.

1. Create one S3 bucket in Asia Pacific (Singapore), with the exact name `umak-elec3-<group user>-linktree`.
2. Upload your Seatwork 2 `index.html`.
3. Turn on static website hosting.
4. Turn off Block Public Access for this bucket only.
5. Add a bucket policy that lets anyone read the page.
6. Open the website endpoint, take three screenshots, and submit.

## Key ideas

### Buckets and objects

S3 stores files as objects. An object lives in a bucket, and its name in the bucket is its key. Your `index.html` becomes one object with the key `index.html`. A bucket name must be unique across all AWS accounts, so your bucket name includes your group user.

### Static website hosting

A static website is a set of files that a server sends as they are. No code runs on a server. S3 can serve the objects in a bucket as a website. You turn this on for one bucket and name the index document, the file that opens first.

### The website endpoint

When hosting is on, S3 gives the bucket a website endpoint:

```text
http://umak-elec3-<group user>-linktree.s3-website-ap-southeast-1.amazonaws.com
```

The endpoint uses HTTP only, so the browser shows "Not secure". That is expected for this seatwork.

### Private by default

A new bucket is private. Two settings make your page public, and your page needs both:

| Setting | What it does |
| --- | --- |
| Block Public Access | A safety switch. While it is on, S3 blocks every setting that makes the bucket public. You turn it off for your website bucket only. |
| Bucket policy | The rule that grants access. Yours lets anyone read (`s3:GetObject`) the objects in your bucket. It does not let anyone write, list, or delete. |

If you open the endpoint before both settings are in place, you get `403 Forbidden`.

### What your group IAM user can do

Your user can create and change only a bucket whose name starts with `umak-elec3-` and your user name. Any other name gets `Access Denied`. Your user works until the deadline.

## Cost

One small page costs well under one cent a month. Keep your bucket until grading is done. After grading, I delete every website bucket, and your page goes offline.

## How you submit

Submit one Pull Request per group to this repository. Then one groupmate submits the Pull Request link in the Google Form that I post in the group chat. Both are due on Friday, November 6, 2026, at 11:59 PM (Asia/Manila).

## Files in this folder

| File | What it is |
| --- | --- |
| [`README.md`](README.md) | This page: what you do and the S3 ideas behind each step. |
| [`seatwork.md`](seatwork.md) | The six steps with screenshots, what to submit, the scoring, and what to check when you get stuck. |
| [`submission-template.md`](submission-template.md) | Copy it to your submission folder as `submission.md`. |
