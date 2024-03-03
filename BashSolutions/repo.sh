#!/bin/bash

# Create and populate a local repository
mkdir -p /Myrepo                    # Create a directory for the local repository
cd /media/RHEL*/Packages            # Navigate to the directory containing RPM packages
cp * -v /Myrepo                      # Copy all RPM packages to the local repository
rpm -ivh deltar*                    # Install the deltarpm package
rpm -ivh python-deltar*             # Install the Python bindings for deltarpm
rpm -ivh createrepo*                # Install the createrepo package
createrepo -v /Myrepo                # Create metadata for the local repository

# Configure a YUM repository for the local repository
cat <<EOF | sudo tee /etc/yum.repos.d/Bertrand.repo > /dev/null
[Server]
name=Linux Server
baseurl=file:///Myrepo
enabled=1
gpgcheck=0
EOF

# Install and configure DHCP server
cd /etc/yum.repos.d/                # Navigate to the directory containing YUM repository configurations
yum install dhcp -y                 # Install DHCP server package
cp /usr/share/doc/dhcp-4.1.1/dhcpd.conf.sample /etc/dhcp/dhcpd.conf  # Copy sample DHCP configuration file

# Modify DHCP configuration file
sed -i "47s/.*/subnet 192.168.10.0 netmask 255.255.255.0 {/" "/etc/dhcp/dhcpd.conf"
sed -i "48s/.*/  range 192.168.10.20 192.168.10.30;/" "/etc/dhcp/dhcpd.conf"
sed -i "51s/.*/  option routers 192.168.10.1;/" "/etc/dhcp/dhcpd.conf"
sed -i "52s/.*/  option broadcast-address 192.168.10.31;/" "/etc/dhcp/dhcpd.conf"

# Start the DHCP service
service dhcpd start
