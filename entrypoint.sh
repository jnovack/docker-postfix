#!/usr/bin/dumb-init /bin/sh

/bin/sed -i "s/variable-myhostname/${HOSTNAME:=mail.contoso.localdomain}/" /etc/postfix/main.cf
/bin/sed -i "s/variable-mydomain/${DOMAIN:=contoso.localdomain}/" /etc/postfix/main.cf
/bin/sed -i "s/variable-aliases/${ALIASES:=fabrikam.localdomain}/" /etc/postfix/main.cf

echo "postlog   unix n  -       n       -       1       postlogd" >> /etc/postfix/master.cf


/usr/sbin/postconf maillog_file=/dev/stdout
/usr/sbin/postmap /etc/postfix/virtual

/usr/bin/tail -3 /etc/postfix/main.cf

exec /usr/sbin/postfix start-fg
