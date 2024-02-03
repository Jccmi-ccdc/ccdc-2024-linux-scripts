

# Flush existing rules and set default policies
iptables -F
iptables -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Allow ICMP echo requests (ping)
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Allow specific ports (e.g., HTTP on port 80 and HTTPS on port 443)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Log dropped packets
iptables -A INPUT -j LOG --log-prefix 'Dropped: '

# Drop all other incoming packets
iptables -A INPUT -j DROP

echo "iptables rules have been set."
