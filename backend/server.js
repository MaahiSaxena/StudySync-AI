const express = require("express");
const cors = require("cors");
require("dotenv").config();
const { connectDB } = require("./config/db");
const authRoutes = require("./routes/authRoutes");
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());
app.use("/api/auth", authRoutes);

// Test route
app.get("/", (req, res) => {
  res.json({
    message: "StudySync AI backend is running"
  });
});

// API test route
app.get("/api", (req, res) => {
  res.json({
    message: "StudySync AI API is working"
  });
});
// Health check route
app.get("/api/health", (req, res) => {
  res.json({
    status: "OK",
    service: "StudySync AI Backend",
    timestamp: new Date().toISOString()
  });
});
connectDB();
// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});