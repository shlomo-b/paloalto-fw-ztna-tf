# PaloAlto project and ZTNA Connector setup

# Check if the TFkey.pem file exists
Get-ChildItem -Path C:\Users\Shlomo\Desktop\test\ -Filter TFkey.pem

# Rename the file if it does not have a .pem extension
Rename-Item -Path C:\Users\Shlomo\Desktop\test\TFkey -NewName TFkey.pem

# Check file permissions
icacls C:\Users\Shlomo\Desktop\test\TFkey.pem

# Set appropriate permissions if needed
icacls C:\Users\Shlomo\Desktop\test\TFkey.pem /grant:r "$($env:USERNAME):(R)"

# Open the known_hosts file for manual editing
notepad C:\Users\Shlomo\.ssh\known_hosts

# Remove the old server key from known_hosts
ssh-keygen -R ec2-52-70-201-79.compute-1.amazonaws.com

# Remove the old key from known_hosts in case it was not removed automatically
(Get-Content C:\Users\Shlomo\.ssh\known_hosts) | Where-Object {$_ -notmatch "ec2-52-70-201-79.compute-1.amazonaws.com"} | Set-Content C:\Users\Shlomo\.ssh\known_hosts

# Attempt to reconnect to the EC2 server
ssh -i "C:\Users\Shlomo\Desktop\test\TFkey.pem" root@ec2-52-70-201-79.compute-1.amazonaws.com

# Enter configuration mode (e.g., in Palo Alto)
configure

# Add an additional command (e.g., change admin password settings)
set mgt-config users admin password <new_password>

# Exit configuration mode and save changes if necessary
commit
exit
