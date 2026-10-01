import React, { useState } from "react";
import ReactDOM from "react-dom/client";

function App() {
  const [message, setMessage] = useState("");
  const [health, setHealth] = useState("");

  // Backend is accessed through the same ALB.
  // Example:
  // /api/message
  // /api/health
  const backendUrl = import.meta.env.VITE_BACKEND_URL || "/api";

  const checkBackend = async () => {
    try {
      const response = await fetch(`${backendUrl}/message`);

      const data = await response.json();

      setMessage(data.message);
    } catch (error) {
      console.error(error);
      setMessage("Backend connection failed");
    }
  };

  const checkHealth = async () => {
    try {
      const response = await fetch(`${backendUrl}/health`);

      const data = await response.json();

      setHealth(data.status);
    } catch (error) {
      console.error(error);
      setHealth("unhealthy");
    }
  };

  return (
    <div>
      <h1>EKS DevOps Project</h1>

      <p>Frontend application is running.</p>

      <hr />

      <h2>Backend Test</h2>

      <button onClick={checkBackend}>
        Check Backend
      </button>

      <p>{message}</p>

      <h2>Backend Health</h2>

      <button onClick={checkHealth}>
        Check Backend Health
      </button>

      <p>{health}</p>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
