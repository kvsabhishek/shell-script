N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOG_DIR=/tmp
DATE=$(date +%F-%Hh-%Mm-%Ss)
LOG_FILE=$LOG_DIR/$0-$DATE.log

CONFIG_LINES=(relayhost = [smtp.gmail.com]:587, smtp_use_tls = yes, smtp_sasl_auth_enable = yes, smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd, smtp_sasl_security_options = noanonymous, smtp_sasl_tls_security_options = noanonymous)
read -p "Enter gmail password: " PASS
read -p "Enter gmail mail id: " MAIL
SASL_PASSWD="[smtp.gmail.com]:587 $MAIL:$PASS"

VALIDATE(){
    if [ $1 -gt 0]
    then
        echo -e "$2-------->$R FAILURE$N"
        exit 2
    else
        echo -e "$2-------->$G SUCCESS$N"
    fi
}

if [ $(id -u) -gt 0 ]
then
    echo -e "$R ERROR:::Run using sudo access$N"
    exit 1
fi

yum install postfix -y
VALIDATE $? "Installing Postfix"

yum install cyrus-sasl-plain -y
VALIDATE $? "Installing cyrus-sasl-plain"

yum install mailx -y
VALIDATE $? "Installing mailx"

systemctl restart postfix 
VALIDATE $? "Restating postfix"

systemctl enable postfix
VALIDATE $? "Enabling postfix"

for line in "${CONFIG_LINES[@]}"
do
    sed -i '$a\'"$line" "/etc/postfix/main.cf"
done
VALIDATE $? "Configuring postfix gmail"

touch /etc/postfix/sasl_passwd
${SASL_PASSWD} > /etc/postfix/sasl_passwd

postmap /etc/postfix/sasl_passwd
VALIDATE $? "Creating a Postfix lookup table from the sasl_passwd"