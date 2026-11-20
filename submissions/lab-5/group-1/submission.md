# Lab 5 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-5/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save cors-error.png, cors.png, site.png, and throttle.png in the same folder.
4. Crop the AWS console top bar out of cors.png, and cover every ARN.
5. Cover your API ID, the part between https:// and .execute-api, in cors-error.png, cors.png, and throttle.png.
6. Do not add your index.html. It holds your invoke URL.
7. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 1
- Section: IV-ACSAD
- Group IAM user: acsad-g01
- Website endpoint: http://umak-elec3-acsad-g01-linktree.s3-website-ap-southeast-1.amazonaws.com
- HTTP API name: umak-elec3-acsad-g01-api

## Screenshots

![Our page and the Console with the CORS error](cors-error.png)

![The saved CORS settings of our API](cors.png)

![Our website with the guestbook and our new messages](site.png)

![Our terminal with the curl test and its status codes](throttle.png)

## Questions

1. In Lab 4, your API answered `curl` and the address bar of your browser. In Step 3, the same API did not answer your page. Why?

   CORS is a browser rule for scripts on a page, so `curl` and the address bar are not affected by it. Our guestbook script runs on the S3 site's origin and calls the API on a different origin, so the browser blocked our page from reading the answer because the API did not yet send `Access-Control-Allow-Origin` for our site (MDN Web Docs).

2. Which pillar of the AWS Well-Architected Framework does your throttle serve? Explain in two sentences.

   Our throttle serves the Reliability pillar, which says to throttle requests so that sudden spikes do not exhaust a workload's resources (Amazon Web Services). API Gateway answers requests above 2 per second (burst 5) with `429 Too Many Requests` before they reach our Lambda function and DynamoDB table, so normal guestbook use keeps working.

3. Your guestbook shows each message with `textContent`. What could a visitor do if the page put each message into the page as HTML with `innerHTML`?

   A visitor could post a message with HTML that runs JavaScript, such as `<img src="x" onerror="...">`, and it would run for everyone who opens our page (stored cross-site scripting). `textContent` shows the message as plain text, so the code never runs (MDN Web Docs).

## References

Amazon Web Services. *REL05-BP02 Throttle requests*. AWS Well-Architected Framework, Reliability Pillar. https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_throttle_requests.html

MDN Web Docs. *Cross-Origin Resource Sharing (CORS)*. Mozilla. https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS

MDN Web Docs. *Element: innerHTML property*. Mozilla. https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML
