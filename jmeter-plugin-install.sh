#!/bin/sh

# Purpose: Install JMeter Plugins

# Download CMDRunner
echo "Downloading CMDRunner"
curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${JMETER_CMD_RUNNER_VERSION}/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar --output ${JMETER_HOME}/lib/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar

# Download Plugin Manager
echo "Downloading Plugin Manager"
curl -L https://jmeter-plugins.org/get/ --output ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGIN_MANAGER_VERSION}.jar

# Install Plugin Manager
java -cp /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGIN_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

# Install JMeter plugins
cd /opt/apache/apache-jmeter-${JMETER_VERSION}/bin/
java -jar ${JMETER_HOME}/lib/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar --tool org.jmeterplugins.repository.PluginManagerCMD install ${JMETER_PLUGIN_INSTALL_LIST}

# Set execute permissions for JMeter shell scripts
chmod a+x ${JMETER_HOME}/bin/*.sh