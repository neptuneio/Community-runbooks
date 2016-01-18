# Clean tomcat log file
sudo find /home/user1/apache-tomcat-7.0.65/logs/ -name '*.log' |sudo xargs rm -f
sudo find /home/user1/apache-tomcat-7.0.65/logs/ -name '*.txt' |sudo xargs rm -f

# Restart tomcat service
pid=`ps aux | grep tomcat | grep -v grep | grep -v retomcat | awk '{print $2}'`

if [ -n "$pid" ]
then
    {
        echo "Tomcat is running with PID : $pid"
        echo 'Shutting down tomcat'
        sudo /home/user1/apache-tomcat-7.0.65/bin/shutdown.sh
        sleep 2
        pid=`ps aux | grep tomcat | grep -v grep | grep -v retomcat | awk '{print $2}'`
        if [ -n "$pid" ]
        then
            {
                sleep 2
                echo 'Tomcat did not gracefully shutdown, so killing it'
                sudo kill -9 $pid
            }
        fi
        sleep 2
        echo 'Starting tomcat now'
        sudo /home/user1/apache-tomcat-7.0.65/bin/startup.sh
    }
else
    echo 'Starting tomcat now'
    sudo /home/user1/apache-tomcat-7.0.65/bin/startup.sh
fi
