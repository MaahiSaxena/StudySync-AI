# StudySync AI - API Design

## Base URL

http://localhost:5000/api


# 1. Authentication

## Register User

POST /auth/register

### Request

```json
{
  "name": "Maahi",
  "email": "maahi@example.com",
  "password": "password123",
  "branch": "CSE",
  "semester": 3
}