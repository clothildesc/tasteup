# TasteUp

Your personal online recipe book. Save, organize, and share your favorite recipes with friends and family.

## 📋 About The Project

**TasteUp** is a web application developed during Le Wagon bootcamp that allows users to build and manage their own digital recipe collection. Whether you're importing recipes from popular cooking websites like Marmiton or creating your own from scratch, TasteUp makes it easy to keep all your culinary creations in one place.

**This project was developed as a team project during Le Wagon bootcamp.**

**Original repository: [ZenaGiulia/tasteup](https://github.com/ZenaGiulia/tasteup)**

<img width="2161" height="1156" alt="tasteup" src="https://github.com/user-attachments/assets/202087ff-2043-4284-9e01-701291d81dac" />

## ✨ Features

- **Import recipes** from Marmiton or create custom recipes manually
- **Edit and organize** your recipe collection
- **Share recipes** with friends and family
- **Discover** recipes from other users
- **Save favorites** from the community

## 🛠️ Built With

### Backend
![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

### Frontend
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![Stimulus](https://img.shields.io/badge/Stimulus-77E8B9?style=for-the-badge&logo=stimulus&logoColor=black)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

### Tools & Services
![Cloudinary](https://img.shields.io/badge/Cloudinary-3448C5?style=for-the-badge&logo=cloudinary&logoColor=white)
![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

## 🚀 Getting Started

### Prerequisites

- Ruby 3.1.2
- Rails 7+
- PostgreSQL
- Node.js & Yarn

### Installation

1. Clone the repository
```bash
git clone https://github.com/clothildesc/tasteup.git
cd tasteup
```

2. Install dependencies
```bash
bundle install
yarn install
```

3. Setup the database
```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the server
```bash
rails server
```

5. Visit `http://localhost:3000` in your browser

## 💻 Usage

### Creating a Recipe

1. Sign up or log in to your account
2. Click on "New Recipe"
3. Choose to either:
   - Import from a URL (Marmiton supported)
   - Create manually

### Importing from Marmiton

Simply paste the recipe URL from Marmiton, and TasteUp will automatically extract:
- Recipe title
- Ingredients list
- Step-by-step instructions
- Cooking time
- Difficulty level
- Photos

### Managing Your Collection

- **Browse** your recipes from your personal dashboard
- **Search** by name, ingredient, or tag
- **Edit** or **delete** recipes anytime
- **Browse** the community feed for inspiration

## 👥 Team

This project was developed by a team of 4 developers during Le Wagon bootcamp:

- **Clothilde** - [@clothildesc](https://github.com/clothildesc)
- **Zena** - [@ZenaGiulia](https://github.com/ZenaGiulia)
- **Pierre** - [@abele17](https://github.com/abele17)
- **Isaiah** - [@IsaiahZalc](https://github.com/IsaiahZalc)

## 📄 License

This project was created as part of Le Wagon bootcamp curriculum.

---

*Made with ❤️ and 🍝 during Le Wagon bootcamp*
