# nfl-stats-react

This is a spring boot reactjs application using a postgresql database.  This application uses the 
[nfl.com](http://www.nfl.com/liveupdate/game-center/) live updates api.  This is just a little pet project for learning
ReactJS in a Spring Boot application.  I'm also learning Postgresql since that is a popular AWS database.  The 
application will gather game center data from the nfl api and use it to help with my fantasy football team.

## Version 0.0.1
This is the initial version with all of the three main pieces (Spring Boot, ReactJS & Postgresql) working together.

## Technologies
- Spring Boot - `v2.2.2-RELEASE`
- Java - `v1.8`
- ReactJS - `v16.12.0`
- Postgresql - `v12.1`
- Gradle - `v6.0.1`
- Yarn - `v1.19.2`

## How to run locally
I use a Mac and IntelliJ IDEA so these instructions are for that setup.
After you clone the repository then follow the steps below.

### Start DB in docker container
First step is to start the Postgresql database in a docker container.  To do that run the following command of course
replace the `<password>` with your own:

`docker run --name nflstats -e POSTGRES_PASSWORD=<password> -d -p 5432:5432 postgres`

### Initialize the database
Next you will need to setup the database and initialize the tables.

### Build the ReactJS application

### Build the spring boot application

### Start the application



