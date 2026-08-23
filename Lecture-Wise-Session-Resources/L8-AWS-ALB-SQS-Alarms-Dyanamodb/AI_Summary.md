## Concept

- **Auto Scaling Group (ASG):** Automatically launches or terminates EC2 instances based on load, using a **Launch Template** (with a custom AMI) as the blueprint for new instances. 
- **Application Load Balancer (ALB):** Operates at **OSI Layer 7**, enabling routing decisions based on path, host, HTTP method, headers, query strings, or IP address. 
- **Target Group:** A logical bundle of EC2 instances (or Lambdas) that an ALB forwards traffic to; health checks determine which targets receive traffic. 
- **SQS (Simple Queue Service):** A managed message queue that **decouples** producer and consumer services, enabling asynchronous communication so a downstream service being down does not cause data loss. 

---



**EC2 vs Lambda — When to Use Which**

- Use **Lambda** for unpredictable, event-driven workloads (OTP, image processing); billed per invocation + execution time, max 15-minute runtime. 
- Use **EC2** for predictable, constant, or long-running workloads where OS-level control is needed. 

**Auto Scaling Group Setup**

- Requires a custom **AMI** → **Launch Template** → **ASG configuration** (desired/min/max capacity, availability zones, scaling policy). 
- Scale-out triggered when average CPU > 70%; **instance warm-up time** prevents a newly launched instance from skewing metrics before it's ready. 
- **Instance Maintenance Policy** options: launch new before terminating (highest availability) vs. terminate-and-launch simultaneously (cost-controlled). 

**ALB Path-Based Routing**

- A single ALB can route to multiple target groups using rules; e.g., `/search` → Search Target Group, `/gmail` → Gmail Target Group, default → fallback group. 
- Health checks run every 30 seconds; 5 consecutive failures = unhealthy; unhealthy targets receive no traffic. 

**EC2 Pricing Models**

- **On-Demand:** Pay as you go, no commitment. 
- **Reserved Instances:** 1–3 year commitment, up to 72% discount. 
- **Capacity Reservation:** Guarantees capacity with no long-term commitment, but billed at on-demand rate even if unused. 
- **Spot Instances:** Up to 90% discount on unused capacity; can be reclaimed with ~30 seconds notice when on-demand demand rises. 
- **Real-world strategy:** Run baseline on reserved/on-demand; use spot for burst traffic handled via load balancer. 

**SQS & Microservice Decoupling**

- Without a queue, if the **Shipping Service** is down when Billing Service sends a request, the order is lost (tightly coupled). 
- With SQS in between, Billing Service pushes to the queue; Shipping Service pulls when available, then **deletes** the message to prevent duplicate processing. 
- **Visibility timeout** hides a message from other consumers while one consumer is processing it. 
- **Dead Letter Queue (DLQ):** Stores undeliverable/unprocessed messages for debugging. 

**Observability Pipeline (CloudFormation Demo)**

- Architecture: EC2 → **CloudWatch Alarm** (CPU > 70%) → **SNS** → **SQS** → **Lambda** (Python consumer) → **DynamoDB** (stores alert records). 
- Lambda pulls up to **10 messages per batch** from SQS, processes each, stores to DynamoDB, then deletes the message. 
- IAM role on Lambda grants: `SQS:ReceiveMessage`, `SQS:DeleteMessage`, `DynamoDB:PutItem`, and CloudWatch Logs access. 

---



- **Availability Zone capacity errors:** `t2.micro` may not be available in all AZs (e.g., `ap-south-1c`). Selecting only AZs where the instance type is confirmed available avoids launch failures.  Using larger instance types (medium/large) reduces this risk. 
- **CloudFormation** **`Ref`** **/** **`GetAtt`****:** When the template references `!Ref MySNSTopic` or retrieves an ARN, it dynamically links resources so you don't hardcode IDs — this is how SNS→SQS subscription and SQS queue policy are wired together automatically. 
- **SQS Queue Policy vs IAM Policy:** The queue policy controls *who can send to the queue* (producer side — SNS is explicitly allowed). The Lambda IAM role controls *who can read from the queue* (consumer side). Both are needed. 
- **DynamoDB** **`Decimal`** **requirement:** Python's `float` type is not accepted by DynamoDB's SDK; numeric values must be cast to `Decimal` before calling `put_item`. 

---


- Lambda max execution time: **15 minutes** 
- ALB operates at **Layer 7** (HTTP-aware); can route on path, host, method, header, query string, IP 
- Spot instance reclaim warning: **~30 seconds** 
- Reserved Instances discount: **up to 72%**; Spot discount: **up to 90%** 
- Health check marks instance **unhealthy after 5 consecutive failures** (configurable) 
- ASG replaces unhealthy instances automatically; ALB stops routing to them independently 
- SQS **visibility timeout** prevents duplicate processing across multiple consumers 
- SQS message retention default: **4 days**, max **14 days** 
- **Capacity Reservation** = no discount, just capacity guarantee; **Reserved Instances** = discount + long-term commitment 
- Dead Letter Queue captures messages that **fail to be consumed** after max retries 
