# TasteUp 🍳

Your personal online recipe book. Save, organize, and share your favorite recipes with friends and family.

## 📋 About The Project

**TasteUp** is a web application developed during Le Wagon bootcamp that allows users to build and manage their own digital recipe collection. Whether you're importing recipes from popular cooking websites like Marmiton or creating your own from scratch, TasteUp makes it easy to keep all your culinary creations in one place.

**👥 This project was developed as a team project during Le Wagon bootcamp.**

**📦 Original repository: [ZenaGiulia/tasteup](https://github.com/ZenaGiulia/tasteup)**

## ✨ Features

### Recipe Management
- 📥 **Import recipes** from Marmiton and other cooking websites
- ✍️ **Create custom recipes** manually with your own instructions
- 📝 **Edit and organize** your recipe collection
- 🖼️ **Add photos** to your recipes
- 🏷️ **Tag and categorize** recipes for easy searching

### Social Features
- 👫 **Share recipes** with friends and family
- 🌐 **Discover** recipes from other users
- ❤️ **Save favorites** from the community
- 💬 **Comment and rate** recipes

### User Experience
- 🔍 **Smart search** to quickly find recipes
- 📱 **Responsive design** - works on all devices
- 🍽️ **Recipe cards** with beautiful layouts
- 📊 **Ingredient lists** and step-by-step instructions

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
- **Filter** by category, difficulty, or cooking time
- **Edit** or **delete** recipes anytime

### Sharing with Friends

- Make recipes **public** or keep them **private**
- Share individual recipes via link
- Browse the community feed for inspiration

## 📁 Project Structure

```
tasteup/
├── app/
│   ├── controllers/      # Application controllers
│   ├── models/           # Database models
│   ├── views/            # HTML templates
│   ├── javascript/       # Stimulus controllers
│   └── assets/           # Stylesheets and images
├── config/               # Configuration files
├── db/                   # Database schema and migrations
├── lib/                  # Custom libraries (scrapers)
├── public/               # Static files
└── test/                 # Test suite
```

## 🎯 Key Features Implementation

### Recipe Import
- Web scraping engine to extract recipe data from Marmiton
- Parser for structured recipe content
- Automatic image download and upload to Cloudinary

### Recipe Creation
- Rich text editor for instructions
- Dynamic ingredient list management
- Image upload with preview
- Tag system for categorization

### Social Features
- User authentication and authorization
- Recipe sharing permissions
- Community feed with recent recipes
- Like and favorite system

## 🧪 Testing

Run the test suite:
```bash
rails test
rails test:system
```

## 🐳 Docker

The project includes Docker support for easy deployment:

```bash
docker-compose up
```

## 📝 Database Schema

Key models:
- **User** - User accounts and authentication
- **Recipe** - Recipe details and content
- **Ingredient** - Recipe ingredients
- **Step** - Recipe instructions
- **Tag** - Recipe categories
- **Favorite** - Saved recipes
- **Comment** - Recipe comments and ratings

## 🌟 Highlights

- **Smart scraper** that adapts to different recipe website formats
- **Intuitive UX** for quick recipe creation
- **Beautiful recipe cards** with responsive images
- **Fast search** with PostgreSQL full-text search
- **Social features** to build a cooking community

## 🚧 Future Enhancements

- [ ] Meal planning calendar
- [ ] Shopping list generator
- [ ] Recipe scaling (adjust serving sizes)
- [ ] Cooking timer integration
- [ ] Recipe collections/cookbooks
- [ ] Support for more recipe websites
- [ ] Recipe version history
- [ ] Nutritional information
- [ ] Mobile app (iOS/Android)

## 👥 Team

This project was developed by a team of 4 developers during Le Wagon bootcamp:

- **Clothilde Scache** - [@clothildesc](https://github.com/clothildesc)
- **Zena Giulia** - [@ZenaGiulia](https://github.com/ZenaGiulia)
- **Pierre** - [@abele17](https://github.com/abele17)
- **Isaiah Zalc** - [@IsaiahZalc](https://github.com/IsaiahZalc)

## 🙏 Acknowledgments

- [Le Wagon](https://www.lewagon.com/) - For the amazing bootcamp experience
- [Marmiton](https://www.marmiton.org/) - Recipe inspiration
- Our instructors and TAs for their guidance
- The Le Wagon community

## 📄 License

This project was created as part of Le Wagon bootcamp curriculum.

---

*Made with ❤️ and 🍝 during Le Wagon bootcamp*