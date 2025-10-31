# BookIt Project

BookIt is a full-stack web application that allows users to explore experiences, view available slots, and book them online with promo codes.

## Features
- User registration and login with JWT
- Browse and book experiences
- Browse experiences dynamically
- View available slots per experience
- Apply promo codes (SAVE10, FLAT100)
- Confirm and view booking result
- Responsive UI

## Tech Stack
- **Frontend:** React + Vite + TailwindCSS
- **Backend:** Node.js + Express
- **Database:** PostgreSQL

## Setup Instructions
1. Clone the repo:
   ```bash
   git clone https://github.com/rajgit2024/BootIt-Experience-Slots.git

2. ## 🚀 Live Demo
- Frontend & Backend: [https://book-it-frontend-lake.vercel.app/]
- Frontend: [https://book-it-frontend-lake.vercel.app](https://book-it-frontend-lake.vercel.app)
- Backend API: [https://bookit-backend-x71r.onrender.com](https://bookit-backend-x71r.onrender.com)



## 🗂️ Folder Structure

bookit-project/
│
├── backend/ # Express.js Backend
│ ├── controllers/ # Business logic for routes
│ ├── models/ # PostgreSQL models & queries
│ ├── routes/ # API route definitions
│ ├── sql/ # Database table & seed scripts
│ ├── .env # Backend environment variables
│ ├── server.js # App entry point
│
├── frontend/ # React Frontend (Vite)
│ ├── src/
│ │ ├── components/ # Reusable UI components
│ │ ├── pages/ # Application pages
│ │ ├── services/ # Axios API calls
│ │ └── App.jsx # Main component
│ ├── .env # Frontend environment variables
│
└── README.md

yaml
Copy code

---

##  Setup Instructions (Local Development)

### 1. Clone the Repository
```bash
git clone https://github.com/rajgit2024/BootIt-Experience-Slots.git
cd BootIt-Experience-Slots

🛠️ 2. Backend Setup
bash
Copy code
cd backend
npm install
Create a .env file in the backend folder:

env
Copy code
PORT=5000
DATABASE_URL=your_render_postgres_database_url
JWT_SECRET=your_secret_key
Then run:

bash
Copy code
npm run dev
Backend will run on http://localhost:5000

---
💻 
bash
Copy code
cd frontend
npm install
Create a .env file in the frontend folder:

env
Copy code
VITE_API_URL=https://bookit-backend-x71r.onrender.com
Then run:

bash
Copy code
npm run dev
Frontend will run on http://localhost:5173

🌐 Deployment
Frontend: Deployed on Vercel
Push your frontend code to GitHub.

Connect the repo on Vercel Dashboard.

Set environment variable:

ini
Copy code
VITE_API_URL=https://bookit-backend-x71r.onrender.com
Deploy!

🟦 Backend: Deployed on Render
Create a new Web Service on Render.

Link your backend GitHub repo.

Add Environment Variables:

ini
Copy code
PORT=5000
DATABASE_URL=your_render_postgres_database_url
JWT_SECRET=your_secret_key
Deploy and note your backend URL.

🟧 Database: Render PostgreSQL
Hosted on Render’s managed PostgreSQL instance.

Tables created via createTables.sql script.

Seeded with sample data (experiences, users, promo codes).

🧠 API Endpoints Overview
Method	Endpoint	Description
GET	/api/experiences	Fetch all experiences
GET	/api/experiences/:id	Get experience details by ID
POST	/api/users/register	Register a new user
POST	/api/users/login	Login user & return JWT
POST	/api/bookings	Create a new booking
POST	/api/promo/validate	Validate promo code

👨‍💻 Author :-
Raj Dubey
📧 rajdu590@gmail.com
💼 LinkedIn
🌍 Raniganj, West Bengal
🎓 BCA Student at M.I.M.I.T College

Conclusion :-

BookIt is a PERN stack project deployed on Render (Backend & Database) and Vercel (Frontend).
It showcases real-world full-stack concepts like authentication, routing, and deployment — built entirely from scratch.
