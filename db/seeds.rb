# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin2@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts "Deleting old data..."
User.destroy_all
Quiz.destroy_all
Question.destroy_all
Option.destroy_all

puts "Creating sample user..."
user = User.create!(
  email: "test@example.com",
  password: "password",
  password_confirmation: "password"
)

puts "Creating quizzes..."

# ============================================
# QUIZ 1
# ============================================
quiz1 = Quiz.create!(
  title: "Sports Knowledge Quiz",
  description: "Test your basic knowledge of popular sports."
)

# Q1: MCQ
q1 = quiz1.questions.create!(
  content: "Which of the following is a sport played with a bat?",
  question_type: "msq",
  correct_answer: nil
)

q1.options.create!(content: "Cricket", correct: true)
q1.options.create!(content: "Football", correct: false)
q1.options.create!(content: "Basketball", correct: false)

# Q2: True/False
q2 = quiz1.questions.create!(
  content: "Football is played with eleven players per team.",
  question_type: "true_false",
  correct_answer: "true"
)

# Q3: Text Answer
q3 = quiz1.questions.create!(
  content: "Name any sport played indoors.",
  question_type: "text",
  correct_answer: "table tennis"
)

# ============================================
# QUIZ 2
# ============================================
quiz2 = Quiz.create!(
  title: "General Knowledge Quiz",
  description: "A short quiz to test general awareness."
)

# Q1 MCQ
q4 = quiz2.questions.create!(
  content: "Which planet is known as the Red Planet?",
  question_type: "msq"
)

q4.options.create!(content: "Mars", correct: true)
q4.options.create!(content: "Jupiter", correct: false)
q4.options.create!(content: "Earth", correct: false)

# Q2 True/False
quiz2.questions.create!(
  content: "The sun rises in the west.",
  question_type: "true_false",
  correct_answer: "false"
)

# Q3 Text
quiz2.questions.create!(
  content: "Who wrote the national anthem of India?",
  question_type: "text",
  correct_answer: "Rabindranath Tagore"
)

puts "Seeding complete! 🎉"
puts "Login using: test@example.com / password"
