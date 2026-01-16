const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("🚀CD pipeline is Running successfully!");
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
