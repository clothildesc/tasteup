# TasteUp

Your personal online recipe book. Save, organize, and share your favorite recipes with friends and family.

## 📋 About The Project

**TasteUp** is a web application developed during Le Wagon bootcamp that allows users to build and manage their own digital recipe collection. Whether you're importing recipes from popular cooking websites like Marmiton or creating your own from scratch, TasteUp makes it easy to keep all your culinary creations in one place.

**👥 This project was developed as a team project during Le Wagon bootcamp.**

**📦 Original repository: [ZenaGiulia/tasteup](https://github.com/ZenaGiulia/tasteup)**

## ✨ Features

- **Import recipes** from Marmiton or create custom recipes manually
- **Edit and organize** your recipe collection
- **Share recipes** with friends and family
- **Discover** recipes from other users
- **Save favorites** from the community

## 🛠️ Built With

- **Ruby on Rails** - Web application framework
- **PostgreSQL** - Database
- **Stimulus** - JavaScript framework
- **Bootstrap** - CSS framework
- **Cloudinary** - Image hosting and management
- **Web scraping** - For importing recipes from external websites

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
