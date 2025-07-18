#!/bin/bash

# 1. Update the package list
sudo apt update

# 2. Install OpenJDK 11 (required for JMeter)
sudo apt install -y openjdk-11-jdk

# 3. Verify Java installation
java -version

# 4. Install the initial JMeter package from Ubuntu repository (may be outdated)
sudo apt install -y jmeter

# 5. Install GTK module to suppress "canberra-gtk-module" warnings
sudo apt install -y libcanberra-gtk3-module

# 6. Set ownership and permissions for the entire JMeter directory to the current user
sudo chown -R $USER:$USER /usr/share/jmeter
sudo chmod -R a+rX /usr/share/jmeter

# 7. Download the latest Apache JMeter binary (update version if needed)
wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz

# 8. Extract the latest JMeter archive over the existing installation
tar --strip-components=1 -xvzf apache-jmeter-5.6.3.tgz -C /usr/share/jmeter

# 9. Download the JMeter Plugins Manager JAR into the extensions directory
wget -O /usr/share/jmeter/lib/ext/plugins-manager.jar https://jmeter-plugins.org/get/

# 10. Ensure Plugins Manager JAR has correct permissions
chmod a+r /usr/share/jmeter/lib/ext/plugins-manager.jar

# 11. Verify updated JMeter version and show final message
jmeter --version
echo "Installation complete. Run JMeter as your user with: jmeter"
echo "Since you own /usr/share/jmeter, Plugins Manager can now install plugins properly."
