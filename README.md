# Coffee Brew - Microservices Application

## Project Overview

This project is a microservices-based coffee shop application developed as part of the Cloud Computing and Advanced Application Architectures course assignment for the academic year 2025-2026.

## System Architecture

The application consists of the following containers orchestrated via Docker Compose:

1. **User Interface (UI)**: Appsmith low-code platform
2. **Local Database**: PostgreSQL database
3. **Database Admin**: Adminer for database management
4. **Mock REST API Services**:
   - Images API (svenwal/jsonplaceholder-based)
   - Locations API (custom Docker image)
5. **External Integration**: Firebase Firestore for user activity logging

---

## Prerequisites

- Docker and Docker Compose installed
- Internet connection for pulling images and accessing Firebase

---

## Installation & Setup

### 1. Build and Start Services

```bash
docker compose build
docker compose up -d
```

### 2. Access Appsmith

Navigate to `http://localhost:80` in your browser. Wait for Appsmith to initialize.

### 3. Configure Appsmith

1. Create an Appsmith account (use any credentials you prefer)
2. Skip the "Add Data Source" step
3. Click the Appsmith logo (top left corner)
4. Select **Create New → Import**
5. Choose **Import from file**
6. Select `coffee_brew_appsmith.json`

### 4. Reconnect Data Sources

After importing, reconnect the following data sources:

#### Firestore
- **Database URL**: `https://coffee-brew-5e850.firebaseio.com`
- **Project ID**: `coffee-brew-5e850`
- **Service Account Credentials**: Copy and paste the contents of `firestore_creds.json`
  ```bash
  cat firestore_creds.json
  ```

#### PostgreSQL Database
- **Host Address**: `postgres-db`
- **Port**: `5432`
- **Database Name**: `postgres`
- **Username**: `postgres`
- **Password**: `mysecretpassword`

#### Images API
- **URL**: `http://images-api:3000`

#### Locations API
- **URL**: `http://locations-api:3000/locations`

### 5. Launch Application

1. Click **Continue to Application**
2. Return to Appsmith's projects page
3. Click **Launch** on the Coffee Brew project

---

## Test Credentials

You can use the following test account or create a new user:

- **Email**: `admin@admin.com`
- **Password**: `12345`

Alternatively, sign up with your own information as a new user.

---

## Project Structure

```
.
├── compose.yaml                    # Docker Compose orchestration file
├── REST-APIs folder/
│   ├── locations.Dockerfile        # Custom API image definition
│   ├── menu-images folder          # Menu items image files         
│   └── *.json                      # Mock API data files
├── coffee_brew_appsmith.json       # Appsmith application export
├── firestore_creds.json            # Firebase credentials
├── seed-db.sql                     # PostgreSQL database schema
└── README.md                       # This file
```

---

## Technologies Used

- **Containerization**: Docker, Docker Compose
- **UI Platform**: Appsmith (Low-Code)
- **Local Database**: PostgreSQL
- **Database Administration**: Adminer
- **Mock APIs**: JSON Server, JSONPlaceholder
- **Cloud Database**: Google Firebase Firestore
- **API Integration**: REST APIs

---

## Features

- User authentication and registration
- Coffee product browsing with images
- Location-based services
- Shopping cart functionality
- User activity logging to cloud database
- Real-time data synchronization

---

## Notes

- All containers start simultaneously via Docker Compose
- The system integrates both local and serverless databases
- External APIs provide supplementary functionality
- User actions are logged to Firestore for analytics

---