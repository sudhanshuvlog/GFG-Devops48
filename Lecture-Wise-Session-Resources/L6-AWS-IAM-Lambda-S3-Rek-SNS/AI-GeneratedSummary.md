## Topic

- **Lecture #6 focused on core AWS services**: IAM (Identity and Access Management), S3 (object storage), Lambda (serverless compute), CloudWatch (logging), SNS (notifications), and Amazon Rekognition (AI image labeling)
- Session goal: demonstrate how these services interconnect in a real event-driven application

## Ideas & contributions

### IAM – Users, Groups, Roles & Policies

- **IAM users** can access AWS via Web UI, CLI, or API; console access requires a password set at creation 
- **Policies** are JSON documents defining `Effect` (Allow/Deny), `Action`, and `Resource`; AWS provides 1,600+ managed policies 
- **Explicit Deny always wins**: if the same action is both allowed and denied in a policy, deny takes priority 
- **IAM Groups** allow bulk permission assignment; individual users inherit group policies, with user-level deny overrides possible for specific members 
- **IAM Roles** are used for service-to-service access (e.g., Lambda → S3) since services cannot have user accounts 
- **MFA** recommended for high-privilege accounts; supports authenticator apps (e.g., Microsoft Authenticator), hardware tokens, or passkeys 

### S3 – Object Storage

- Buckets must have **globally unique names**; bucket name appears directly in the object URL 
- **Block Public Access** is on by default; access is managed via **bucket policies** (bucket-scoped) vs. **IAM policies** (account-wide) 
- **Bucket versioning** prevents file overwrites by maintaining multiple versions of the same object 
- **ACLs are deprecated**; bucket policies are the recommended access control method 
- **Principal field** in bucket policy controls who can access: `*` = everyone, or specific user ARNs for whitelist/deny patterns 

### Lambda – Serverless Compute

- **Serverless**: AWS manages all server infrastructure; users only provide code (Python, Node.js, Java, etc.) 
- **Pay-per-execution**: charged only for actual runtime duration and memory used (e.g., 1.75 ms billed) 
- **Triggers** (event sources) include S3, API Gateway, IoT, CodeCommit, and more; S3 trigger fires on object creation 
- **Recursive invocation risk**: storing Lambda output back to the same S3 bucket that triggered it causes infinite loops 
- Lambda auto-creates a **default IAM role** with CloudWatch log permissions on function creation 

### Service-to-Service Permissions (IAM Roles)

- Every cross-service call requires explicit policy attachment to the Lambda role 
- Permissions added incrementally during the demo: S3 `GetObject` → Rekognition `DetectLabels` → SNS publish 
- Resource-scoped policies (specific bucket ARN + `/*`) preferred over wildcard `*` for least-privilege 

### End-to-End Serverless Application Built

- **Flow**: User uploads image to S3 → S3 triggers Lambda → Lambda calls Rekognition → labels returned → SNS sends email notification 
- **Boto3** (AWS Python SDK) used in Lambda to interact with S3 (`get_object`) and Rekognition (`detect_labels`) 
- **CloudWatch** captures all Lambda execution logs, organized by log group per function 
- **SNS subscription** confirmed via email; supports email, SMS, HTTP, SQS as delivery endpoints 

## Worth exploring

- **IAM Access Analyzer / Last Accessed data**: AWS shows which permissions a user has never used, enabling least-privilege cleanup — worth applying to reduce over-permissioned accounts 
- **Resource-specific ARN policies**: scoping Lambda's S3 access to a single bucket (rather than `*`) is a strong security pattern demonstrated live and worth standardizing across all service roles 

## Action items / follow-ups

- [ ] Replicate the full S3 → Lambda → Rekognition → SNS pipeline using the shared Lambda Python code (Assigned to: All students)
- [ ] Complete Shell scripting tasks: (1) user/group administration from CSV, (2) directory creation with permissions, (3) system performance monitoring with output redirection (Assigned to: All students) 
- [ ] Learn **cron jobs** for scheduling the performance monitoring script — to be covered in next class or upcoming session 
- [ ] Review step-by-step document to be shared by instructor covering all IAM/S3/Lambda/SNS configurations 
- [ ] Prepare for next class topics: **API Gateway, Auto Scaling, Load Balancer** (Assigned to: All students) 
