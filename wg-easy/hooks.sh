#/usr/bin/env bash

get_wg0_ip() {
    ip addr show dev wg0 | grep inet | awk '{print $2}' | awk -F / '{print $1}'
}

get_coredns_ip() {
    getent hosts coredns | awk '{print $1}'
}

PostUp() {
    iptables -t nat -A POSTROUTING -s $WG_ALLOWED_IPS -o eth0 -j MASQUERADE
    iptables -A INPUT -p udp -m udp --dport $WG_PORT -j ACCEPT
    iptables -A FORWARD -i wg0 -j ACCEPT
    iptables -A FORWARD -o wg0 -j ACCEPT

    # 如需将 DNS 请求转发到 CoreDNS，取消下面一行的注释
    # iptables -t nat -A PREROUTING -d $(get_wg0_ip) -p udp --dport 53 -j DNAT --to-destination $(get_coredns_ip):53
}

PostDown() {
    iptables -t nat -D POSTROUTING -s $WG_ALLOWED_IPS -o eth0 -j MASQUERADE
    iptables -D INPUT -p udp -m udp --dport $WG_PORT -j ACCEPT
    iptables -D FORWARD -i wg0 -j ACCEPT
    iptables -D FORWARD -o wg0 -j ACCEPT

    # 如需将 DNS 请求转发到 CoreDNS，取消下面一行的注释
    # iptables -t nat -D PREROUTING -d $(get_wg0_ip) -p udp --dport 53 -j DNAT --to-destination $(get_coredns_ip):53
}

$1
