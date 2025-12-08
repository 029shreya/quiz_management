# Quiz Management Application

## Overview

This project is a Quiz Management Application built using **Ruby on Rails**. The core objective of the app is to allow users to take quizzes and administrators to manage quizzes, questions, and options using **ActiveAdmin**.

The app supports multiple types of answers including:

* **MCQ (Multiple Choice Questions)**
* **True/False**
* **Text-based answers**

It also includes custom logic for quiz submission, scoring, and user interactions. For styling and CSS improvements, **ChatGPT was used to assist with UI design and layout recommendations**.

---

## 1. Initial Setup

### Create a New Rails Application

Start by initializing a fresh Rails application:

```bash
rails new quiz-management
cd quiz-management
```

### Active Record Models

Follow basic Rails guides to generate models:

* Quiz
* Question
* Option
* Submission
* User

```bash
rails g model Quiz title description
rails g model Question quiz:references content question_type correct_answer
rails g model Option question:references content is_correct:boolean
rails g model Submission quiz:references user:references score
rails g model User name email
```

Run migrations:

```bash
rails db:migrate
```

---

## 2. ActiveAdmin Setup for Admin Panel

Install ActiveAdmin to manage quizzes, questions, and options.

Add to Gemfile:

```ruby
gem 'activeadmin'
```

Setup ActiveAdmin:

```bash
rails g active_admin:install
rails db:migrate
rails db:seed
```

Create admin interfaces:

* Quiz admin
* Question admin
* Option admin

Each admin panel allows CRUD actions for quiz creation and question management.

---

## 3. Quiz Logic

This application includes logic for three types of questions:

* **MCQ** — multiple selectable options
* **True/False** — boolean answer
* **Text** — typed input answer

Controllers include logic for:

* Rendering quizzes
* Handling quiz submission
* Storing selected options (for MCQ)
* Calculating the score
* Saving submission results

Routes are set up to support:

* Taking a quiz
* Submitting quiz
* Viewing past submissions (optional)

---

## 4. New Enhancements

Several enhancements have been added to improve functionality and user experience.

### ✔ Additional Question Options

Support added for:

* Multiple correct answers
* Images in questions
* Timed quizzes
* Explanations after quiz submission

### ✔ Hide Scores from Users

To maintain integrity:

* Users will **not see their score instantly**.
* Results will instead be **emailed directly to the user**.
* Admin retains full visibility of user scores in ActiveAdmin.

### ✔ 2-Factor Authentication

For enhanced security:

* Added optional **2FA** for user signup/login.
* Methods supported:

  * Email OTP
  * Authenticator app integration (e.g., Google Authenticator)

### ✔ Learning Resources for Users

To help users improve their quiz performance:

* Dedicated section for **educational classes/resources**.
* Includes:

  * Video lessons
  * Study materials
  * Practice quizzes

### ✔ Additional Enhancements (Recommended)

* **Leaderboard** (admin can toggle visibility)
* **Quiz Categories** (Science, Math, Coding, etc.)
* **Question Difficulty Levels** (Easy, Medium, Hard)
* **Randomized Questions & Options** for fairness
* **API Endpoints** for future mobile app integration
* **Dark Mode UI** for better usability
* **Retry Limit** to prevent repeated attempts

---

## 5. Deployment

The application is deployed on **Render** for production. Steps include:

* Connect the Render account to the repository
* Set environment variables for production
* Deploy the Rails app using Render's web service setup
* Ensure background jobs (if any) and email delivery for quiz results are configured

---# Quiz Management Application

## Overview

This project is a Quiz Management Application built using **Ruby on Rails**. The core objective of the app is to allow users to take quizzes and administrators to manage quizzes, questions, and options using **ActiveAdmin**.

The app supports multiple types of answers including:

* **MCQ (Multiple Choice Questions)**
* **True/False**
* **Text-based answers**

It also includes custom logic for quiz submission, scoring, and user interactions. For styling and CSS improvements, **ChatGPT was used to assist with UI design and layout recommendations**.

---
