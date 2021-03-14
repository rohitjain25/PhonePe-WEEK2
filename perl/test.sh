
logfile=/Users/rohitj.intern/Desktop/task2.log
logfile1=/Users/rohitj.intern/Desktop/task2.log
write_file=record.txt

# .ip=$(awk '{print $1}' $logfile)
# # printf "$ip\n"
# # date=$(awk '{print $2}' $logfile)
# # printf "$date\n"
# awk -F: '/:$/ {print $2}' $logfile


# printf "\nHighest Requested Hosts, Upstream IP's and Paths Date-Wise\n===============================================================================\n"
highest_requested(){
    date=$1
	cat $logfile | grep $date | awk '{print $NF}' | sort | uniq -c | sort -r | head -1 > $write_file
    host_times=$(awk '{print $1}' $write_file)
	host_name=$(awk '{print $2}' $write_file)
    
    cat $logfile | grep $date | awk '{print $9}' | sort | uniq -c | sort -r | head -1 > $write_file
    upstream_ip_times=$(awk '{print $1}' $write_file)
	upstream_ip=$(awk '{print $2}' $write_file)

    cat $logfile | grep $date | awk '{print $5}' | sort | uniq -c | sort -nr | head -1 > $write_file
    path_times=$(awk '{print $1}' $write_file)
    path=$(awk '{print $2}' $write_file)

  
    printf "\n+++++++++++++++++++\n On \"$date\"\n+++++++++++++++++++\n\n"
    echo "\"$host_name\" was the highest requested upstream_ip and it was requested $host_times times."
	echo "\"$upstream_ip\" was the highest requested upstream_ip and it was requested $upstream_ip_times times."
    echo "\"$path\" was highest requested path and it was requested $path_times times."
    printf "\n\n"
}

#Function Call- highest requested(date)
# highest_requested 12/Feb/20
# highest_requested 06/Mar/2021
# highest_requested 07/Mar/2021
# highest_requested 08/Mar/2021

#Total Requests per status code.
printf "\nTotal Requests per status code.\n==================================\n"
cat $logfile | awk '{print $7}' | sort | uniq -c > $write_file
while read line; do
	set -- $line
	printf "Total requests on status code \"$2\" is $1.\n"
done < $write_file

#Top 5 Requested Upstream IP, Host, BodyByteSent and Path
top_5_requested() {
    awkval=$1
    name=$2

    cat $logfile | awk '{print $'$awkval'}' | sort | uniq -c | sort -nr | head -5 > $write_file
    # cat $logfile | awk '{print $9}' | sort | uniq -c | sort -nr | head -5 > $write_file
    
    printf "\n\nTop 5 Requested $name:\n++++++++++++++++++++++++++\n"

    while read line; do
	    set -- $line
	    printf "$name : \"$2\" requested $1 times.\n"
    done < $write_file

}
#Function Call- top_5_requested(awkValue, Name)
top_5_requested 9 Upstream_ip
top_5_requested NF Host
top_5_requested 10 BodyBytesSent
top_5_requested 5 Path

top_5_highest_response(){
    cat $logfile | awk '{print $8, $NF}' | sort -nr | uniq | head -5 > $write_file
    printf "\n\nTop 5 Requested Response:\n+++++++++++++++++++++++\n"

    while read line; do
	    set -- $line
	    echo "Response Time : \"$1\" requested by: \"$2\"."
    done < $write_file
}

top_5_highest_response 

#Top 5 requests returning 200/5xx/4xx per host
top_5_requested_stat_by_host(){
    cat $logfile | awk '{print $7, $NF}' | sort | uniq -c| sort -nr | head -5 > $write_file
    printf "\n\nTop 5 Requested Paths:\n++++++++++++++++++++\n"

    while read line; do
        set -- $line
        printf "Status Code : \"$2\" Host : \"$3\" requested $1 times.\n"
    done < $write_file
}
top_5_requested_stat_by_host

# cat $logfile1 | awk '/Mar/{print $2}' | sort | uniq | sort -nr > $write_file


echo "Get all the requests taking more than 2/5/10 secs to respond"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
echo "All requests taking more than 10 seconds"
echo "----------------------------------------"

cat $logfile \
| awk '{if ($8 >= 10) print $8,$1,$NF}'\
| sort \
| uniq -c \
| sort \
| head -5 

echo""


echo "All requests taking more than 5 seconds"
echo "----------------------------------------"


cat $logfile \
| awk '{if ($8 >= 5) print $8,$1,$NF}'\
| sort \
| uniq -c \
| sort \
| head -5

echo""


echo "All requests taking more than 2 seconds"
echo "----------------------------------------"


cat $logfile \
| awk '{if ($8 >= 2) print $8,$1,$NF}'\
| sort \
| uniq -c \
| sort \
| head -5

echo""

##########################################################################



