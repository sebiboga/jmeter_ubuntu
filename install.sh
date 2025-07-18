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

# 6. Set ownership and permissions for the existing JMeter directory
sudo chown -R root:root /usr/share/jmeter
sudo chmod -R a+rX /usr/share/jmeter

# 7. Download the latest Apache JMeter binary (update version if needed)
wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz

# 8. Extract the latest JMeter archive over the existing installation
sudo tar --strip-components=1 -xvzf apache-jmeter-5.6.3.tgz -C /usr/share/jmeter

# 9. Download the JMeter Plugins Manager JAR into the extensions directory
sudo wget -O /usr/share/jmeter/lib/ext/plugins-manager.jar https://jmeter-plugins.org/get/

# 10. Set ownership and permissions for plugins-manager.jar
sudo chown root:root /usr/share/jmeter/lib/ext/plugins-manager.jar
sudo chmod a+r /usr/share/jmeter/lib/ext/plugins-manager.jar

# 11. Backup jmeter.properties (no log file changes since no extra log dir needed)
sudo cp /usr/share/jmeter/bin/jmeter.properties /usr/share/jmeter/bin/jmeter.properties.backup

# 12. Verify the updated JMeter version and final message
jmeter --version
echo "Installation complete. Start JMeter using the 'jmeter' command."
echo "Remember to run JMeter from a directory where you have write permissions to avoid log file permission issues."
