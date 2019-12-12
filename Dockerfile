FROM openshift/jenkins-slave-base-centos7

LABEL com.redhat.component="jenkins-agent-docker" \
      io.k8s.description="The jenkins agent image has the tools buildings Docker images on top of the jenkins slave base image." \
      io.k8s.display-name="Jenkins Agent - DockerInDocker" \
      io.openshift.tags="openshift,jenkins,agent,dockerindocker" \
      architecture="x86_64" \
      name="ci/jenkins-agent-dind" \
      maintainer="Samuel MARTIN MORO <faust64@gmail.com>" \
      help="For more information visit https://github.com/CI/docker-jenkins-agent-dind" \
      version="1.0"

# Install Build Dependencies
RUN if test "$DO_UPGRADE"; then \
	yum -y upgrade; \
    fi \
    && yum -y install docker \
    && yum clean all -y \
    && rm -rf /var/cache/yum /usr/share/doc /usr/share/man
