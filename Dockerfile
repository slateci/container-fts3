FROM centos:7
COPY crontab /etc/crontab
COPY supervisord.conf etc/supervisord.conf
COPY fts3config etc/fts3/fts3config
COPY fts-msg-monitoring.conf etc/fts3/fts-msg-monitoring.conf
COPY docker-entrypoint.sh tmp/docker-entrypoint.sh 
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://repo.opensciencegrid.org/osg/3.5/osg-3.5-el7-release-latest.rpm
ADD "https://dmc-repo.web.cern.ch/dmc-repo/dmc-rc-el7.repo" "/etc/yum.repos.d/"
#ADD "http://fts-repo.web.cern.ch/fts-repo/fts3-prod-el7.repo" "/etc/yum.repos.d/"
ADD "http://fts-repo.web.cern.ch/fts-repo/fts3-rc-el7.repo" "/etc/yum.repos.d/"
RUN yum update -y
RUN yum install epel-release -y
RUN yum install yum-plugin-priorities -y
RUN yum install --disablerepo=dmc-rc-el7 -y osg-ca-certs
RUN yum install -y gfal2-all osg-gridftp gfal2-util fts-server fts-client fts-rest fts-monitoring fts-mysql fts-server-selinux fts-rest-selinux fts-monitoring-selinux fts-msg fts-infosys cronie crontabs supervisor
# Add all schema files
RUN mkdir /usr/local/fts3
ADD schema /usr/local/fts3/schema
ENTRYPOINT sh tmp/docker-entrypoint.sh
