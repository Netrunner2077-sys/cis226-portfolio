# Week 9: Network or host? My troubleshooting card

## The four failures I saw & wWhat each one means
- **Could not resolve:** This is a network/DNS issue. The system couldn't translate the human-readable domain name into an IP address, meaning it didn't even know where to send the traffic.
- **Connection refused:** This is a host problem. The network successfully found the target machine, but the server rejected the connection because nothing was listening on that port or a firewall blocked it.
- **Connection timed out:** This is a network issue (or a silent firewall drop). The request went out, but it got lost or dropped somewhere along the line, and my computer gave up waiting for a response.
- **404 Not Found:** This is a host/application issue. The network connection worked perfectly and reached the server, but the web server software couldn't find the specific page or folder I asked for.

## How it works
- **127.0.0.1:** This is the local loopback address (localhost). It just loops traffic right back into my own operating system, which is useful when testing a local service without actually hitting an external network.
- **0.0.0.0:** This is a wildcard IP used by a server to listen on all interfaces. Instead of just listening on one connection, it tells the app to accept traffic coming from anywhere, like the local machine, the Wi-Fi card, or an Ethernet port.
