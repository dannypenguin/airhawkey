const express = require("express");
const app = express();
const http = require("http").Server(app);
const io = require("socket.io")(http);

app.set("port", process.env.PORT);

io.on("connection", socket => {
    console.log("Connected")
});

http.listen(app.get("port"), () => console.log("Server is listening"));