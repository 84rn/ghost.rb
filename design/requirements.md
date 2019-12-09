## Requirements
---
1. The app must allow a user to make a VPN connection by using the official _cyberghostvpn_ linux application (CLI only)
2. User can connect to any server from the CyberGhost server list
3. User can choose to connect to a random server without specifying country/city/server type
4. User can connect to any server of given `country` 
5. User can connect to any `city` server 
6. User can connect to any  `type` of server
7. List of cities and countries available must be downloaded from CyberGhost site
8. Types of server are: `streaming`, `traffic`, `torrent` - these 3 values are provided by the official app
9. User is presented with list boxes for choosing `country`/`city`/`type`
10. User can connect or disconnect with a button
11.  _CyberGhost_ logo must be presented at the top
12. User can see the connection status indicator (red/green)
13. When user is connected, no actions are possible until he disconnects. Widgets must be disabled and reenabled on state change.
14. Last connection information must be saved.
15. Last connection information must be retrieved on app start.
16. App must be able to monitor the connection status 
17. When `country` is chosen, `city` list must be updated
18. When `country` is not set, all `cities` are available
19. App must be able to interact with the official app's `--connect`, `--status` and `--disconnect`
20. User must be able to disconnect
21. Problems must be communicated to the user via modal error windows
22. After starting the state of the app must check and represent the connection status if vpn was previously up