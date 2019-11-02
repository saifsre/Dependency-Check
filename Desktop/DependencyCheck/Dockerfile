FROM ubuntu AS builder

# Update aptitude with new repo
RUN apt-get update

#Install software
RUN apt-get install -y git python-virtualenv
#Install unzip 
RUN apt-get install zip unzip
# Clone the git repo
RUN git clone https://github.com/saifsre/crayonsclaywebapp.git /home/repo


# Download the dependency-check cmd tool
ADD https://dl.bintray.com/jeremy-long/owasp/dependency-check-5.2.1-release.zip /home

# Unzip the dependency-check zip file
RUN unzip /home/dependency-check-5.2.1-release.zip -d /home


#copy the executable shell script 
COPY entrypoint.sh /home

RUN chmod +x ./home/entrypoint.sh

FROM node as installer
COPY --from=builder /home /home
RUN cd /home/repo && npm install

FROM openjdk
COPY --from=installer /home /home
# Execute
ENTRYPOINT [ "/home/entrypoint.sh" ]
