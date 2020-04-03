#labtainer.headless

Install
1. Build the fresh-nginx:latest
`docker build -t fresh-nginx:latest .`
2. On labtainer vm, build the labtainer.master file and push it to dockerhub, see instructions in labtainer.master.create.
3. On any linux/mac (someday windows), run the containers: `docker-compose up`
4. After about 30 seconds the system should settle, goto http://localhost:3333 to set up the first user and client for nginx.
5. Copy client secret to nginx.conf and then restart the system.
6. Then goto http:\\localhost/vnc_auto.html and authenticate as that user.
