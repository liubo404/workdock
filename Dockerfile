FROM debian:latest

MAINTAINER liubo

RUN mkdir /tools
ENV tools /tools


#ADD ./tools/*.gz $tools/

ADD apache-maven-3.3.3-bin.tar.gz $tools/
ADD apache-tomcat-8.0.26.tar.gz $tools/
ADD jdk-8u60-linux-x64.tar.gz $tools/


#RUN ls

#RUN tar -xzvf $tools/apache-maven-3.3.3-bin.tar.gz  
#RUN tar -xzvf $tools/apache-tomcat-8.0.26.tar.gz  
#RUN tar -xzvf $tools/jdk-8u60-linux-x64.tar.gz

WORKDIR $tools


RUN echo "export JAVA_HOME=/tools/jdk1.8.0_60" >>~/.bashrc
RUN echo "export MVN_HOME=/tools/apache-maven-3.3.3" >>~/.bashrc
RUN echo "export CATALINA_HOME=/tools/apache-tomcat-8.0.26" >>~/.bashrc

RUN echo "export PATH=/tools/jdk1.8.0_60/bin:/tools/apache-maven-3.3.3/bin:$PATH" >>~/.bashrc

#RUN source ~/.bashrc

RUN echo "" >/etc/apt/sources.list
RUN echo "deb http://ftp.cn.debian.org/debian/ jessie main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://ftp.cn.debian.org/debian/ jessie-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://ftp.cn.debian.org/debian/ jessie-backports main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.cn.debian.org/debian/ jessie main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.cn.debian.org/debian/ jessie-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.cn.debian.org/debian/ jessie-backports main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://ftp.cn.debian.org/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.cn.debian.org/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y wget curl

#update sources.list
#RUN mv /etc/apt/sources.list /etc/apt/sources.list_bak
#RUN wget http://mirrors.163.com/.help/sources.list.jessie /etc/apt/sources.list
#RUN  sed -i 's/mirrors.163.com/ftp.cn.debian.org/g' /etc/apt/sources.list

#RUN apt-get update
RUN apt-get -y install build-essential ruby ruby-dev python emacs git python3


#install nodejs
RUN  curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs


#change ruby gem sources
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/
RUN gem install sass
RUN gem install compass


#install svn
#RUN  apt-get update
RUN apt-get -y  install subversion
RUN apt-get -y install libapache2-svn



RUN mkdir /benwork

EXPOSE 80 8080 18080 28080  38080 48080 58080 8081 8082 8083 8083 8085 8086 
CMD ["bash"]
 
