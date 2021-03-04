const express = require('express');
const bodyparser =require('body-parser');
const { Client } = require('pg')
var admin = require("firebase-admin");
const app = express();
app.use(bodyparser.json())

//process.env.FIREBASE_CONFIG_FILE firebase configiration file
var serviceAccount = require(process.env.FIREBASE_CONFIG_FILE);

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: process.env.FIREBASE_DATABASE_URL
  })
  
  
  const notification_options = {
      priority: "high",
      timeToLive: 60 * 60 * 24
    };

//using postgress to capture the real time database changes by using pg listen notify which act as pub/sub
const client = new Client({
    user:process.env.USER_NAME,
    database:process.env.DATABASE_NAME,
    password: process.env.PASSWORD,
    host:process.env.HOST,
    port:process.env.PORT
})
client.connect()
client.query('LISTEN change_status');
client.on('notification',async (data)=>{    
    console.log("data changed",JSON.parse(data.payload));
    var busData = JSON.parse(data.payload);
    //get the id of changed bus, get all fcm tokens related to this bus for notification push can be one or many
    const query = {
        text: 'select * from testnotify.users u join testnotify.buses b on u.bus =  b.bus_id where b.bus_id = $1',
        values: [busData.bus_id]
      }
    client
    .query(query)
    .then(res => {
    const  registrationToken = res.rows.map( row => row.token);
        console.log(registrationToken);
        
    const message ={
        notification: {
         title: "SWVL",
         body: busData.bus_status,
         sound: 'default',
         badge: '1',
        },
       };
    const options =  notification_options
    //push notification using firebase 
      admin.messaging().sendToDevice(registrationToken, message, options)
      .then( response => {
       console.log("Notification sent successfully")
      })
      .catch( error => {
          console.log(error);
      });
    })
    .catch(e => console.error(e.stack))
});

const PORT = process.env.PORT || 8000;

// :) tested and successfully running 

app.listen(PORT, ()=> console.log("server started"))
