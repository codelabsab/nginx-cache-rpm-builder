FROM centos:7

RUN yum -y update && yum -y upgrade && yum groupinstall -y 'Development Tools'
RUN yum install rpm-build
RUN yum install -y gperftools-devel \
        openssl-devel pcre-devel zlib-devel \
        GeoIP-devel	gd-devel perl-devel \
        'perl(ExtUtils::Embed)' libxslt-devel
WORKDIR /root/rpmbuild
RUN mkdir /output
ADD rpmbuild /root/rpmbuild
RUN rpmbuild --undefine=_disable_source_fetch -ba SPECS/nginx.spec
