#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
export CHATID="5862048483"
export KEY="6307367714:AAG_Gae1CEjB-BDTYLzHSb89kbmLxzln7mk"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/namydeveloper/permission/main/ipvps"
checking_sc() {
useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
echo -e "            ${RED}PERMISSION DENIED !${NC}"
echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
echo -e "             \033[0;33mContact Admin :${NC}"
echo -e "      \033[0;36mTelegram${NC} t.me/Namydev"
echo -e "      ${GREEN}WhatsApp${NC} wa.me/6287859431410"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
exit
fi
}
checking_sc
clear
domain=$(cat /etc/xray/domain)
PUB=$( cat /etc/slowdns/server.pub )
NS=`cat /etc/xray/dns`
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
Quota=1
masaaktif=1
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@isi_bug_disini:80?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws#${user}"

cat > /home/vps/public_html/$user-TRTLS.yaml <<EOF
port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: rule
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
  store-selected: true
dns:
  enable: true
  ipv6: false
  enhanced-mode: redir-host
  listen: 0.0.0.0:7874
  nameserver:
    - 8.8.8.8
    - 1.0.0.1
    - https://dns.google/dns-query
  fallback:
    - 1.1.1.1
    - 8.8.4.4
    - https://cloudflare-dns.com/dns-query
    - 112.215.203.254
  default-nameserver:
    - 8.8.8.8
    - 1.1.1.1
    - 112.215.203.254
proxies:
  - name: ${user}
    server: ${sts}
    port: 443
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: ${domain}
    network: ws
    ws-opts:
      path: /trojan-ws
      headers:
        Host: ${domain}
    udp: true
proxy-groups:
  - name: FASTSSH-SSHKIT-HOWDY
    type: select
    proxies:
      - ${user}
      - DIRECT
rules:
  - MATCH,FASTSSH-SSHKIT-HOWDY
EOF

cat > /home/vps/public_html/$user-TRTLSCDN.yaml <<EOF
- name: Trojan-$user
  server: Isi-Bug
  port: 443
  type: trojan
  password: $uuid
  network: ws
  sni: $domain
  skip-cert-verify: true
  udp: true
  ws-opts:
   path: /trojan
   headers:
    Host: $domain
EOF

cat > /home/vps/public_html/$user-TRNOTLSCDN.yaml <<EOF
- name: Trojan-$user
  type: trojan
  server: Isi-Bug
  port: 80
  uuid: ${uuid}
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  network: ws
  ws-opts:
   path: /trojan
   headers:
    Host: ${domain}
EOF

cat > /home/vps/public_html/$user-TRGrpcCDN.yaml <<EOF
- name: Trojan-$user
  server: Isi-Bug
  port: 443
  type: trojan
  password: $uuid
  network: grpc
  sni: $domain
  skip-cert-verify: true
  udp: true
   grpc-opts:
    grpc-service-name: "trojan-grpc"
EOF

cat >/var/www/html/trojan-$user.txt <<-END

#Format OpenClash

port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: rule
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
  store-selected: true
dns:
  enable: true
  ipv6: false
  enhanced-mode: redir-host
  listen: 0.0.0.0:7874
  nameserver:
    - 8.8.8.8
    - 1.0.0.1
    - https://dns.google/dns-query
  fallback:
    - 1.1.1.1
    - 8.8.4.4
    - https://cloudflare-dns.com/dns-query
    - 112.215.203.254
  default-nameserver:
    - 8.8.8.8
    - 1.1.1.1
    - 112.215.203.254
proxies:
  - name: ${user}
    server: ${sts}
    port: 443
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: ${domain}
    network: ws
    ws-opts:
      path: /trojan-ws
      headers:
        Host: ${domain}
    udp: true
proxy-groups:
  - name: FASTSSH-SSHKIT-HOWDY
    type: select
    proxies:
      - ${user}
      - DIRECT
rules:
  - MATCH,FASTSSH-SSHKIT-HOWDY

#Format CDN TLS

- name: Trojan-$user
  server: ${sts}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: $domain
  skip-cert-verify: true
  udp: true
  ws-opts:
   path: /trojan
   headers:
    Host: ${domain}

#Format CDN None TLS

- name: Trojan-$user
  type: trojan
  server: ${sts}
  port: 80
  uuid: ${uuid}
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  network: ws
  ws-opts:
   path: /trojan
   headers:
    Host: ${domain}

#Format CDN GRPC

- name: Trojan-$user
  server: ${sts}
  port: 443
  type: trojan
  password: $uuid
  network: grpc
  sni: $domain
  skip-cert-verify: true
  udp: true
   grpc-opts:
    grpc-service-name: "trojan-grpc"

-------------------------------------------------------
               Link Akun Trojan
-------------------------------------------------------
Link TLS         : ${trojanlink}
-------------------------------------------------------
Link none TLS    : ${trojanlink2}
-------------------------------------------------------
Link GRPC        : ${trojanlink1}
-------------------------------------------------------
END

service cron restart

if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^#!" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "#! ${user} ${exp} ${uuid}" >>/etc/trojan/.trojan.db

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m           TRIAL TROJAN           \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Host/IP        : ${domain}"
echo -e "Host XrayDNS   : ${NS}" 
echo -e "Pub Key        : ${PUB}" 
echo -e "User Quota     : ${Quota} GB"
echo -e "Wildcard       : (bug.com).${domain}"
echo -e "Port TLS       : ${tls}"
echo -e "Port none TLS  : 80"
echo -e "Port gRPC      : ${tls}"
echo -e "OpenClash Ws   : 443"
echo -e "CDN TLS        : 443"
echo -e "CDN No TLS     : 80"
echo -e "CDN Grpc       : 443"
echo -e "Key            : ${uuid}"
echo -e "Path           : /trojan-ws"
echo -e "ServiceName    : trojan-grpc"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS       : ${trojanlink}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link none TLS  : ${trojanlink2}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link gRPC      : ${trojanlink1}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Yaml Clash Ws  : http://${domain}:81/$user-TRTLS.yaml"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "CDN TLS        : http://${domain}:81/$user-TRTLSCDN.yaml"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "CDN No TLS     : http://${domain}:81/$user-TRNOTLSCDN.yaml"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "CDN Grpc       : http://${domain}:81/$user-TRGrpcCDN.yaml"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Link CDN & OpenClash : https://${domain}:81/trojan-$user.txt"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Link Via Qris  :https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=${trojanlink}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Aktif Selama     : 60 Menit"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo "killtrial trojan ${user}" | at now +60 minutes &> /dev/null

read -n 1 -s -r -p "Press any key to back on menu"

menu
