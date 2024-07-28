const express = require("express");
const app = express();

app.get("/", function (req, res) {
  return res.json({ "docker-and-containers-from-scratch": req.ip });
});

app.listen(5000, function () {
  console.log("Web application is listening on port 5000");
});
