#variables
LOGFILE="/Users/rohitj.intern/Desktop/task2.log"


echo "-----------------"
echo "|TASK FOR WEEK 2|"
echo "-----------------"
echo""

###################################################
echo "1.summary for the month:"
echo "========================="
echo""
echo "*highest requested host:"
cat $LOGFILE \
| grep -s Feb \
| awk '{print $NF}'\
| sort \
| uniq -c \
| sort -r \
| head -1 

echo""

echo "*highest requested upstream_ip:"
cat $LOGFILE \
| grep -s Feb \
| awk '{print $9}'\
| sort \
| uniq -c \
| sort -r \
| head -1

echo""

echo "*highest requested path:"
cat $LOGFILE \
| grep -s Feb \
| awk '{print $5}'\
| sort \
| uniq -c \
| sort -r \
| head -1
###################################################
echo""
echo "2.Total requests per status code"
echo "================================="
echo""
cat $LOGFILE \
| awk '{print $7}'\
| sort \
| uniq -c \
| sort 

echo""
###################################################
echo""
echo "3.Top requests:"
echo "==============="
echo""
echo "*top 5 requests by upstream_ip:"
cat $LOGFILE \
| awk '{print $9}'\
| sort \
| uniq -c \
| sort -r \
| head -5

echo""

echo "*top 5 requests by host:"
cat $LOGFILE \
| awk '{print $NF}'\
| sort \
| uniq -c \
| sort -r \
| head -5

echo""

echo "*top 5 requests by bodyBytesSent:"
cat $LOGFILE \
| awk '{print $10}'\
| sort \
| uniq -c \
| sort -r \
| head -5

echo""

echo "*top 5 requests by path:"
cat $LOGFILE \
| awk '{print $5}'\
| sort \
| uniq -c \
| sort -r \
| head -5

echo""

echo "*top 5 requests with the highest response time"
cat $LOGFILE \
| awk '{print $8}'\
| sort \
| uniq -c \
| sort -r \
| head -5

echo""

echo "*get top 5 requests returning 200/5xx/4xx per host"
cat $LOGFILE \
| awk '{print $7}'\
| sort \
| uniq -c \
| sort \
| head -5

echo""
################################################### 

echo "4.)Print Status Code received by each host"
echo "==========================================="

cat $LOGFILE \
| awk '{print $15 " " $7}' \
| sort \
| uniq -c \
| sort -rn \
| head -20

echo""



################################################### 

echo "5.)Get all request for the last 10 minutes"
echo "==========================================="

cat $LOGFILE \
| awk "/^$(date --date="-10 min" "+%b %_d %H:%M")/{p++} p"\
| sort \
| uniq -c \
| sort \
| head -5

###################################################
echo"" 


echo "6.)Get all the requests taking more than 2/5/10 secs to respond"
echo "================================================================" 
echo "*All requests taking more than 10 seconds"

cat $LOGFILE \
| awk '{if ($8 >= 10) print $8,$1,$NF}'\
| sort \
| uniq -c \
| sort \
| head -5

echo""


echo "*All requests taking more than 5 seconds"

cat $LOGFILE \
| awk '{if ($8 >= 5) print $8,$1,$NF}'\
| sort \
| uniq -c \
| sort \
| head -5


echo""


echo "*All requests taking more than 2 seconds"

cat $LOGFILE \
| awk '{if ($8 >= 2) print $8,$1,$NF}'\
| sort \
| uniq -c \
| sort \
| head -5


echo""


###################################################
















