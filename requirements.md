# Requirements

This project was built to meet the following requirements.

---

## Models

- **User**

  - Uses Devise for authentication
  - Can only edit their own profile
  - Associations:
    - `has_many :scores`
    - `has_many :games, through: :scores`

- **Game**

  - Has many scores
  - Has many users through scores
  - Must have a title

- **Score**
  - Belongs to a game
  - Belongs to a user
  - Tracks points and round number
  - Validations:
    - Must be associated with a valid user and game
    - Points must be numeric

---

## Features

- User authentication (sign up, login, logout)
- Users can view all users but only edit their own profile
- Games can be created and associated with scores
- Scores track user performance per game
- Validation errors are displayed in forms

---

## Routes

- **Users**: index, show, edit, update (restricted by `current_user`)
- **Games**: index, show, new, create
- **Scores**: nested under games

---

## Validations

- **User**: requires `name` and `email`
- **Game**: requires `title`
- **Score**: requires `points` (numeric), `user`, and `game`

---

## Scopes

- At least one ActiveRecord scope is defined.  
  Example:
  ```ruby
  scope :high_scores, -> { where("points >= 100") }
  ```
