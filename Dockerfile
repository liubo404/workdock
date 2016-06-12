FROM debian:latest
MAINTAINER liubo


###0.add apt-cacher proxy
RUN  echo 'Acquire::http { Proxy "http://192.168.1.200:3142"; };' >> /etc/apt/apt.conf.d/01proxy


# 1.update the system and install some tools needed
RUN rm -rf /etc/apt/sources.list
ADD ./sources.list /etc/apt/sources.list


RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y emacs
RUN apt-get install -y build-essential
RUN apt-get install -y python
RUN apt-get install -y python3
RUN apt-get install -y ruby
RUN apt-get install -y ruby-dev
RUN apt-get install -y subversion
RUN apt-get install -y libapache2-svn
RUN apt-get install -y apt-utils
RUN apt-get install -y dtrx


# Install nodejs
#RUN  curl -sL https://deb.nodesource.com/setup_4.x | bash -
#RUN apt-get install -y nodejs


# Change ruby gem sources & install sass compass
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/
RUN gem install sass
RUN gem install compass

# Install purcell emacs.d
#RUN git clone https://github.com/purcell/emacs.d.git ~/.emacs.d

# Install spacemacs
RUN git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#install lein
RUN wget -O /bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod a+x /bin/lein

RUN mkdir /benwork




CMD ["bash"]



 
