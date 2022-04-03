FROM ubuntu:16.04
# Install dependencies
RUN apt-get update
RUN apt-get -y install apache2
# Install apache and write hello world message
#RUN echo 'Hello World!Project1 demonstration complete' > /var/www/html/index.html
RUN echo "<br/><h1 align='center' style='color:DeepSkyBlue;font-size:50px'>Welcome </h1><br/><h2 align='center'>Hello there! from EC2 instance</h2><br/><h2 align='center' style='color:blue;font-size:50px'>$(curl -s 'http://169.254.169.254/latest/meta-data/instance-id')<br/>$(curl -s 'http://169.254.169.254/latest/meta-data/local-ipv4')</h2><br/><br/><h2><div id='curdt' align='center'></div></h2><script>var d = new Date(); document.getElementById('curdt').innerHTML=d;</script>" > /var/www/html/index.html
# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh
RUN echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh
RUN echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh
RUN echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh
RUN chmod 755 /root/run_apache.sh
EXPOSE 80
CMD /root/run_apache.sh
