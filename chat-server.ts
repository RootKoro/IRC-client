const http = require('http').createServer();
const io = require('socket.io')(http);
const PORT = 3000;
import { db } from "./db";


  db.connect(function(err) {
    if (err) throw err;
      console.log("Connecté à la base de données MySQL!")
    db.query("USE chat", function (err, result) {
        if (err) throw db.query("CREATE DATABASE chat"); 
          console.log("Base de données créée !");
   });
});

io.on('connection', (socket:any) => {
    console.log('connected')
    socket.on('message', (evt:any) => {
        console.log(evt)
        // les informations envoyées depuis le clients sont recus par le server et dispatchés par ici
        socket.emit('message', evt)
    })
})
io.on('disconnect', (evt:any) => {
    console.log('disconnected')
})
http.listen(PORT, () => console.log(`server listening on port: ${PORT}`))