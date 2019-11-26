# Pi-Hole Setup
This repo assumes Pi-Hole running on a *nix distro or Raspberry Pi. The scripts for regex and gravityoptimize were created by https://github.com/mmotti and I made some slight modifications. Once the following steps are completed, you will have a fully functioning Pi-Hole blocking over 1 million domains. 

DNS over HTTPS (DoH) and/or DNS over TLS (DoT) will bypass Pi-Hole since the browser or apps are defining a different DNS server, however Pi-Hole still have its place on your network to help prevent smart devices and other non-DoH or non-DoT devices from calling out to ad trackers/malware sites and other unwanted domains.

## Installation

1. Install Pi-Hole from https://pi-hole.net/ and make sure you can access the admin portal.

2. Clone this repo.

3. Run `sudo ./blockpage.sh` to enable an actionable block page. This step isn't required, but highly recommended as it allows you to add a blocked page to the whitelist when it attempts to load.

4. Enable Conditional Formatting by entering the router IP and the name of the network in Settings. This allows Pi-Hole to report back the device name instead of the IP and makes the dashboard easier to read.

5. Run `sudo ./block_lists.sh` to insert Whitelist, Blacklist, and Block Lists. 

6. Run `sudo ./gravityoptimise.sh` to parse through the gravity lists and remove those that are listed via regex. Note this is a one off script. To have it run on a schedule, copy/paste the following to into terminal:

   >cp gravityoptimise.sh ~/ <br>
 sudo nano crontab -e <br>
 45 3 * * * root PATH="$PATH:/usr/local/bin/" gravityOptimise.sh