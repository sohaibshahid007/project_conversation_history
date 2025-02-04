# 🚀 Project Conversation History

This is a **Ruby on Rails 7.2.2** application that allows users to:
- **Create projects** with a title, description, and status.
- **Comment on projects** to track discussions.
- **Change project status** (Active, On Hold, Completed).
- **View project conversation history** (comments & status changes).

The application is built using:
- **Ruby 3.1.2**
- **Rails 7.2.2**
- **Node.js 18.20.4**
- **Yarn**
- **Bootstrap 5.3**
- **RSpec for testing**
- **Turbo & Hotwire for instant UI updates**

---

## **📌 Installation Guide**

### ** Prerequisites**
Ensure you have the following installed:

- **Ruby**: `3.1.2`
- **Rails**: `7.2.2`
- **Node.js**: `18.20.4`
- **Yarn**: `Latest Version`
- **PostgreSQL** (or SQLite for local development)

---

### ** Clone the Repository**
```bashgit
clone https://github.com/yourusername/project-conversation-history.git cd project-conversation-history


### ** Install Dependencies**

bundle install
yarn install


### ** Set Up the Database**

rails db:create
rails db:migrate
rails db:seed


### **  Start the Server**

rails s

Then open your browser and go to:

http://localhost:3000

### ** Run Rspecs**

bundle exec rspec



