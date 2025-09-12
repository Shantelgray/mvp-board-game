# MVP Board Games

A Ruby on Rails application for tracking board game scores and users. Users can create an account, log in, view their scores, see total points, and browse games and other users.

## Key Features

### User Accounts & Authentication

- Sign up with an email and password.
- Secure login & session management using Devise.
- User profile shows total points and individual scores.

### Game Management

- View a list of all games with their genres.
- Games have names and are associated with scores.

### Score Tracking

- View all scores.
- Scores are associated with both a user and a game.
- Tracks points and round number for each score.

### Navbar

- Appears after user logs in.
- Quick navigation to Scores, Games, Users, and Logout.

### User Profile

- Displays individual scores.
- Displays total points (computed as the sum of all the user’s scores).

---

## Getting Started

### Prerequisites

- Ruby 3.x
- Rails 7.x
- SQLite3
- Bundler

### Setup & Installation

1. Clone the repository:

```bash
git clone <repo-url>
cd mvp-board-games
```

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
```

```bash
rails server
```

http://localhost:3000

### Usage

1. Create an Account

2. Go to /users/sign_up.

3. Enter your email and password.

Click **_Sign Up_**

### Log In

1. Go to /users/sign_in.

2. Enter your email and password.

3. Click **Login**

### View Games

Go to `/games` to see all games

### View Scores

Go to `/scores` to see all scores

### User Profile

Go to `/users/:id` to view individual scores, associated games, and total points.

### Tech Stack

- Backend: Ruby on Rails
- Database: SQLite3
- Testing: RSpec + FactoryBot
