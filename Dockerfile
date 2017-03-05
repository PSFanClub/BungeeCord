FROM java:8-jdk

WORKDIR /home/

ADD configs/* ./
ADD translations translations

ADD http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar BungeeCord.jar
ADD start.sh start.sh

RUN /bin/bash -c 'jar -uf ./BungeeCord.jar -C ./translations messages.properties'

ENV MC_MIN_RAM=256M
ENV MC_MAX_RAM=512M

CMD ["bash","start.sh"]
