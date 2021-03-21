#!/bin/bash
logfile=/Users/rohitj.intern/Desktop/access.log
logfile1=/Users/rohitj.intern/Desktop/access.log
write_file=record.txt

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


#Total Requests per status code.
printf "\nTotal Requests per status code.\n+++++++++++++++++++++++++++++++++++++++\n"
printf "Status code,Times\n"
cat $logfile | awk '{print $7}' | sort | uniq -c  > $write_file
while read line; do
	set -- $line
	printf "$2,$1\n"
done < $write_file

#Top 5 Requested Upstream IP, Host, BodyByteSent and Path
top_5_requested() {
    awkval=$1
    name=$2

    cat $logfile | awk '{print $'$awkval'}' | sort | uniq -c | sort -nr | head -5 > $write_file
    # cat $logfile | awk '{print $9}' | sort | uniq -c | sort -nr | head -5 > $write_file
    
    printf "\n\nTop 5 Requested $name:\n++++++++++++++++++++++++++++++\n"
    printf "$name,Count\n"
    while read line; do
	    set -- $line
	    printf "$2,$1\n"
    done < $write_file

}
#Function Call- top_5_requested(awkValue, Name)
top_5_requested 9 Upstream_ip
top_5_requested NF Host
#top_5_requested 10 BodyBytesSent
top_5_requested 5 Path

top_5_highest_response(){
    cat $logfile | awk '{print $8, $NF}' | sort -nr | uniq | head -5 > $write_file
    printf "\n\nTop 5 Requested Response:\n+++++++++++++++++++++++\n"
    printf "Response Time,Host \n"

    while read line; do
	    set -- $line
	    echo "$1,$2"
    done < $write_file
}

top_5_highest_response 

#Top 5 requests returning 200/5xx/4xx per host
top_5_requested_stat_by_host(){
    cat $logfile | awk '{print $7, $NF}' | sort | uniq -c| head -10 > $write_file
    printf "\n\nGet top requests returning 200/5xx/4xx per host :\n++++++++++++++++++++\n"
    printf "Status Code,Host_Name,Count\n"
    while read line; do
        set -- $line
        printf "$2,$3,$1\n"
    done < $write_file
}
top_5_requested_stat_by_host









