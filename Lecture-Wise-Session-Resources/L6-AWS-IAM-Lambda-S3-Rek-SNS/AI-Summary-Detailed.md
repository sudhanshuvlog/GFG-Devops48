## Concept

- **IAM (Identity and Access Management):** Controls who can access what in an AWS account using **users**, **groups**, **policies**, and **roles** 
- **Policy:** A JSON document defining allowed/denied actions on specific AWS resources; attached to users, groups, or roles 
- **IAM Role:** Like a policy container assigned to AWS **services** (not users) to enable service-to-service communication 
- **S3 (Simple Storage Service):** Serverless object storage — scalable, highly available, secure, no hardware to manage 
- **Lambda:** Serverless compute — runs code only when triggered by an event; you pay only for execution duration and resources used 
- **SNS (Simple Notification Service):** Broadcasts messages to multiple subscribers (email, SMS, HTTP, etc.) 
- **CloudWatch:** Centralized logging and metrics service for all AWS resources 

---


- **IAM Users & Permissions:** A new user can be created with console access and a password; permissions are assigned via policies (e.g., EC2 read-only) 
- **Least Privilege:** Granting only the minimum required permissions — adding actions one by one (e.g., `RunInstances`, `CreateTags`, `TerminateInstances`) as failures reveal missing permissions 
- **Deny overrides Allow:** If the same action appears in both an allow and a deny statement within a policy, **deny always wins** 
- **Groups simplify management:** Attach a policy to a group; all users in that group inherit it — individual overrides (e.g., explicit deny for one intern) are still possible 
- **Bucket Policy vs IAM Policy:** IAM policies are account-wide; bucket policies are scoped to a single S3 bucket. Both use the same JSON structure 
- **Serverless = no server management:** S3 and Lambda are both serverless — AWS handles infrastructure; you focus on code and data 
- **Lambda trigger from S3:** When a file is uploaded to S3, Lambda auto-executes; the `event` object passed to the function contains bucket name, file key, source IP, and timestamp 
- **Boto3 SDK:** Python library to interact with AWS services programmatically — used to `get_object` from S3 and call `detect_labels` on Rekognition 
- **End-to-end flow built in class:**
    - User uploads image → S3 → triggers Lambda → Lambda calls Rekognition → labels returned → Lambda publishes to SNS → SNS emails subscriber 

---


- **ARN (Amazon Resource Name):** Every AWS resource gets a unique ID in the format `arn:aws:service:region:account-id:resource`. It is used in policies under the `Resource` field to scope permissions to a specific resource rather than all (`*`) 
- **IAM Role vs IAM User:** A *user* is a person; a *role* is assumed by a **service** (like Lambda). When Lambda needs to read from S3, it uses a role with the right policy attached — not a user account 
- **Why recursive invocation warning exists:** If Lambda reads from S3 bucket A and writes output back to the same bucket A, the write triggers Lambda again → infinite loop. Use a separate output bucket to avoid this 
- **Principal in bucket policy:** `"Principal": "*"` means anyone can access; you can restrict to specific user ARNs or source IP ranges for tighter control 
- **Policy validation step:** When saving a bucket policy, AWS runs `access-analyzer:ValidatePolicy` behind the scenes — the Lambda role needs permission for this action too 

---

- **Deny always overrides Allow** — even if the same action is allowed elsewhere in the same policy 
- **IAM Policy structure:** `Effect` (Allow/Deny) + `Action` (e.g., `ec2:RunInstances`) + `Resource` (ARN or `*`) 
- **Role vs User:** Services use **roles**; humans use **users** — Lambda cannot have a user account 
- **Lambda billing model:** Charged only for execution time (milliseconds) × memory used; ~1 million requests/month free in free tier 
- **S3 bucket name must be globally unique** — it appears directly in the object URL 
- **Block Public Access + Bucket Policy:** Disabling block-public-access alone is not enough; a bucket policy must explicitly allow `s3:GetObject` for public reads 
- **CloudWatch log groups:** Auto-created per Lambda function; Lambda needs `logs:CreateLogGroup`, `logs:CreateLogStream`, `logs:PutLogEvents` permissions in its role 
- **Event-driven architecture:** Lambda executes *only* on events (e.g., S3 `ObjectCreated`) — not 24/7 like EC2; ideal for lightweight, sporadic workloads 
- **SNS subscription confirmation:** Subscribers must confirm via email before receiving messages — mirrors real-world notification opt-in flows 
