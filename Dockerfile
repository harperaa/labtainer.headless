
FROM debian:latest

#Installation des paquets
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends ca-certificates sudo wget locales x11-xserver-utils xterm \
    gnome-terminal dbus-x11 tigervnc-standalone-server tigervnc-common xfwm4 xfce4-panel at-spi2-core libxtst6 host

#Mise à jour des locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN sudo locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

#Copie dynamique du group_id "docker"
ARG DOCKER_GROUP_ID
RUN groupadd docker

#Ajout de l'utilisateur labtainer
RUN useradd -ms /bin/bash labtainer && sed -i "21i\labtainer ALL=(root) NOPASSWD:ALL\n" /etc/sudoers
RUN usermod -aG docker labtainer
USER labtainer
WORKDIR /home/labtainer

#Téléchargement et installation de Labtainer
RUN wget https://my.nps.edu/documents/107523844/109121513/labtainer.tar/6fc80410-e87d-4e47-ae24-cbb60c7619fa && \
    tar -xf 6fc80410-e87d-4e47-ae24-cbb60c7619fa
COPY install-labtainer.sh /home/labtainer/labtainer/install-labtainer.sh
RUN rm 6fc80410-e87d-4e47-ae24-cbb60c7619fa
RUN cd labtainer/ && \
    ./install-labtainer.sh

#Utilisation de docker
VOLUME /var/run/docker.sock /var/run/docker.sock

#Export des variables pour le lancement du serveur VNC
ENV DISPLAY=:0
ENV NO_AT_BRIDGE=1
USER root
COPY ./motd /etc/motd
COPY ./docker-entrypoint /
ENTRYPOINT ["/docker-entrypoint"]
