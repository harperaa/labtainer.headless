#labtainer.headless

Install
1. Build the fresh-nginx:latest
`docker build -t fresh-nginx:latest .`
2. On labtainer vm, build the labtainer.master file and push it to dockerhub, see instructions in labtainer.master.create.
3. Note: for linux systems as host of docker, you will have to set the following environment variable to the local IP (real IP, not 127.0.0.1 or localhost), DOCKER_IP_for example: Then, on any linux/mac (someday windows), run the containers: `docker-compose up`
4. After about 30 seconds the system should settle, goto http://localhost:3333 to set up realm of "myrealm". 
5. Setup a client called "nginx" with:
* "Access Type" set to "confidential"
* "Direct Access Grants Enabled" to "on"
* "Service Accounts Enabled" to "on"
* "Authorization Enabled" to "on"
* "Root URL" as "http://localhost/"
* "Valid Redirect URIs" as "http://localhost/*"
* "Base URL" as "http://localhost/"
* "Admin URL" as "localhost"
* "Web Origins" as "localhost"
6. Copy client secret to nginx.conf and then restart the system.
7. Create the first user and set password under credentials.
8. Then goto http:\\localhost/vnc_auto.html and authenticate as that user.

