# nfl-stats-react

This is a spring boot reactjs application using a postgresql database.  This application uses the 
[nfl.com](http://www.nfl.com/liveupdate/game-center/) live updates api.  This is just a little pet project for learning
ReactJS in a Spring Boot application.  I'm also learning Postgresql since that is a popular AWS database.  The 
application will gather game center data from the nfl api and use it to help with my fantasy football team.

## Version 0.0.2
Add Team Entity and Team Repository to represent the team data in the database.  Add a Rest endpoint to provide 
a list of all teams in the database.  And finally added code to display the teams as JSON in the UI.

## Version 0.0.1
This is the initial version with all of the three main pieces (Spring Boot, ReactJS & Postgresql) working together.
Not much functionality yet just the initial shell of the application.  The database tables have been defined and
the basic user interface layout has been defined.

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
Next you will need to setup the database and initialize the tables.  I do this from IntelliJ and the database init
scripts can be found in `nfl-stats-react/miscellaneous/database/init.sql`

### Build the ReactJS application
To build the React application follow the following steps:
- open a terminal
- navigate to `nfl-stats-react/src/webapp`
- install react dependencies with this command `yarn install` (you only have to do this once)
- run the following command `yarn build`

### Build the spring boot application
Next build the Spring Boot application with these steps:
- open a terminal
- navigate to `nfl-stats-react/`
- run the following command `./gradlew clean build`

### Start the application
Once the application is built you can run it with the following command:
- In the terminal from the same location you ran the build from
- run the following command `./gradlew boot-run`
- navigate to the [application](http://localhost:8080)

**NOTE:** You can also build and run the application from IntelliJ
