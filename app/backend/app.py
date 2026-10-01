import os

from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)


# ==========================================
# Basic API
# ==========================================

@app.route("/")
def home():
    return jsonify({
        "message": "Backend API is running"
    })


# ==========================================
# Health Check
# ==========================================

@app.route("/api/health")
def health():
    return jsonify({
        "status": "healthy"
    })


# ==========================================
# API Message
# ==========================================

@app.route("/api/message")
def api_message():
    return jsonify({
        "message": "Backend API is running"
    })


# ==========================================
# Users API
# ==========================================

@app.route("/api/users")
def users():
    return jsonify([
        {
            "id": 1,
            "name": "Rakesh"
        },
        {
            "id": 2,
            "name": "DevOps User"
        }
    ])


# ==========================================
# Database Test
# ==========================================

@app.route("/api/db-test")
def db_test():

    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            port=int(os.getenv("DB_PORT", "3306")),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME")
        )

        cursor = connection.cursor()

        cursor.execute("SELECT 1")

        result = cursor.fetchone()

        cursor.close()
        connection.close()

        return jsonify({
            "database": "connected",
            "result": result[0]
        })

    except Exception as e:

        return jsonify({
            "database": "connection failed",
            "error": str(e)
        }), 500


# ==========================================
# Start Application
# ==========================================

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000
    )
