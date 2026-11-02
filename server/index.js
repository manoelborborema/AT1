import "dotenv/config";
import express from "express";

const app = express();
const port = Number(process.env.PORT) || 3000;

app.get("/api/health", (_request, response) => {
  response.status(200).json({
    status: "ok",
    timestamp: new Date().toISOString(),
  });
});

app.listen(port, () => {
  console.log(`API da ONG disponível em http://localhost:${port}`);
});
