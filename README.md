# pushnotification

implementing real time push notification using (postgres pub/sub, firebase, nodejs)

download the files and run those commands
import the .sql file to create the testing database.
make sure to have the .env file containing 


export DATABASE_NAME=               //database
export PASSWORD=                   //database
export USER_NAME=                 //database
export HOST=                     //database
export PORT=                    //database
export FIREBASE_DATABASE_URL=  //from firebase 
export FIREBASE_CONFIG_FILE=  //from firebase 


-- npm install 
-- node server.js

- update FCM tokens in users table as needed

- run any update statment for bus status in buses table (update buses set bus_status ='' where bus_id ='';)  

DONE :))
