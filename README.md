#WEEK-2\
PhonePe Task week#2\
Logfile:

[https://raw.githubusercontent.com/aratik711/nginx-log-generator/main/access.log](https://raw.githubusercontent.com/aratik711/nginx-log-generator/main/access.log)

The format of the logs is as follows:

ip, time, httpMethod, path, httpVersion, statusCode, responseTime, upstream\_ip:port, bodyBytesSent, referrer, userAgent, ssl\_protocol, content\_type, host

Write a bash script to part the logs and provide the stats mentioned below:

1. summary for the day/week/month:

highest requested host

highest requested upstream\_ip

highest requested path (upto 2 subdirectories ex: /check/balance)

2. total requests per status code (Ex: count of requests returning 404/401/502/504/500/200)

3. Top requests

top 5 requests by upstream\_ip

top 5 requests by host

top 5 requests by bodyBytesSent

top 5 requests by path (upto 2 subdirectories ex: /check/balance)

top 5 requests with the highest response time

get top 5 requests returning 200/5xx/4xx per host

4. find the time last 200/5xx/4xx was received for a particular host

5. get all request for the last 10 minutes

6. get all the requests taking more than 2/5/10 secs to respond
