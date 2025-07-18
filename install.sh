# 1. Update the package list
sudo apt update
# 2. Install OpenJDK 11 (required for JMeter)
sudo apt install openjdk-11-jdk
# 3. Verify Java installation
java -version
# 4. Install the initial JMeter package from Ubuntu repository (version likely outdated)
sudo apt install jmeter
# 5. Set ownership and permissions for the existing JMeter directory
sudo chown -R root:root /usr/share/jmeter
sudo chmod -R a+rX /usr/share/jmeter
# 6. Download the latest Apache JMeter binary (replace version if newer available)
wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
# 7. Extract the latest JMeter archive directly over the existing installation
sudo tar --strip-components=1 -xvzf apache-jmeter-5.6.3.tgz -C /usr/share/jmeter
# 8. Verify the updated JMeter version
jmeter --version
