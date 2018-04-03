# docker-local

Create a local docker environment with file syncing.

Only tested on MacOS.

Requirements:

You will need docker and docker-sync installed.

https://www.docker.com/

http://docker-sync.io/

Steps:

1. Edit .env file with your desired settings. Additional information available as comments in the file.

2. Set PROJECT_BASE_URL to your prefered URL e.g., mytestsite.localhost

3. Point RELATIVE_ROOT to your wordpress root directory.

4. Use the wp-config-docker.php as your config file.

5. In the docker-local directory run the command "make up".
  (Note: Check the Makefile for all commands. "make down" will bring down you local dockers.) 

6. Open a browser and check the url you set PROJECT_BASE_URL to.

