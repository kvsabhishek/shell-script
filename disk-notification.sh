SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$(date +%F-%Hh-%Mm-%Ss).log

R="\e[31m"
N="\e[0m"
G="\e[32m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE "tmpfs|Filesystem")
DISK_USAGE_THRESHOLD=1

while IFS= read line
do 
    disk_name=$(echo $line | awk '{print $1}')
    disk_usage=$(echo $line | awk '{print $6}' | cut -d % -f1)

    if [ ${disk_usage} > ${DISK_USAGE_THRESHOLD} ]
    then
        echo -e "$Y WARNING::: Disk $disk_name usage is $disk_usage which is above threshhold $DISK_USAGE_THRESHOLD $N"
    fi
done <<< $DISK_USAGE