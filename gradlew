#!/bin/sh

# Adaptation of Gradle start up script for POSIX to Maven

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

##############################################################################

# Attempt to set APP_HOME

# Resolve links: $0 may be a link
app_path=$0

while [ -h "$app_path" ]; do
    ls=$(ls -ld "$app_path")
    link=$(expr "$ls" : '.*-> \(.*\)$')
    if expr "$link" : '/.*' > /dev/null; then
        app_path="$link"
    else
        app_path=$(dirname "$app_path")/"$link"
    fi
done

APP_HOME=$(dirname "$app_path")
APP_HOME=$(cd "$APP_HOME"; pwd)

# Add default JVM options here. You can also use JAVA_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ]; then
    JAVACMD="$JAVA_HOME/bin/java"
    if [ ! -x "$JAVACMD" ]; then
        echo "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
        echo "Please set the JAVA_HOME variable in your environment to match the location of your Java installation."
        exit 1
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || {
        echo "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
        echo "Please set the JAVA_HOME variable in your environment to match the location of your Java installation."
        exit 1
    }
fi

# The Maven wrapper's classpath
CLASSPATH=$APP_HOME/.mvn/wrapper/maven-wrapper.jar

# Construct the command to execute Maven
set -- \
        "-Dmaven.multiModuleProjectDirectory=$APP_HOME" \
        -classpath "$CLASSPATH" \
        org.apache.maven.wrapper.MavenWrapperMain \
        "$@"

# Execute Maven
exec "$JAVACMD" "$@"
