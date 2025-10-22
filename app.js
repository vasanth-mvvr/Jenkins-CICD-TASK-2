const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send(" Hello from Node.js CI/CD Pipeline!");
});

const port = process.env.PORT || 3000;

// This keeps the server running
app.listen(port, () => {
  console.log(` Server running on port ${port}`);
});
