puts 'deleting recipes, categories, ingredients, users...'
Recipe.destroy_all
Category.destroy_all
Ingredient.destroy_all
User.destroy_all

user1 = User.create!(email: 'bob@gmail.com', password: '123456')
user2 = User.create!(email: 'seb@gmail.com', password: '123456')
user3 = User.create!(email: 'alice@gmail.com', password: '123456')

categories = ["Entrée", "Plat principal", "Accompagnement", "Dessert", "Apéritif", "Boisson", "Sauce", "Végétarien", "Vegan", "Sans gluten", "Sans lactose", "Français", "Italien", "Chinois", "Africain", "Indien", "Coréen", "Libanais", "Thaï", "Japonais", "Mexicain", "Espagnol", "Thaïlandais", "Américain", "Méditerranéen", "Turc"]

ingredients = ['farine', 'levure', 'sel', 'sucre vanillé', 'sucre', 'beurre', 'oeuf', 'chocolat', 'pâte brisée', 'lardons fumés', 'crème fraîche', 'lait', 'oeufs', 'fromage râpé', 'poivre', 'noix de muscade', 'salade romaine', 'blancs de poulet', 'croûtons', 'parmesan', 'sauce César', "huile d'olive", 'aubergine', 'courgette', 'poivron rouge', 'poivron jaune', 'tomates', 'oignon', 'ail', 'herbes de Provence', 'jaunes d’oeufs', 'crème liquide', 'vanille', 'sucre roux', 'riz arborio', 'champignons de Paris', 'bouillon de légumes', 'vin blanc', 'épinards', 'fromage de chèvre', 'pommes', 'cannelle', 'oignons', 'bouillon de boeuf', 'baguette', 'pomme de terre', 'carotte', 'pois chiches', 'lait de coco', 'pâte de curry', 'huile', 'coriandre fraîche', 'banane', 'orange', 'raisin', 'fraise', 'citron', 'avocat', 'pêche', 'mangue', 'poire', 'cerise', 'ananas', 'melon', 'pastèque', 'kiwi', 'pamplemousse', 'citron vert', 'myrtille', 'papaye', 'framboise', 'nectarine', 'litchi', 'mandarine', 'fruit de la passion', 'grenade', 'figue', 'kaki', 'canneberge', 'carambole', 'jacquier', 'durian', 'tamarin', 'goji', 'açaï', 'coing', 'kumquat', 'prune', 'abricot', 'mûre', 'raisin sec', 'date', 'noix de coco', 'brocoli', 'poivron', 'laitue', 'concombre', 'chou', 'épinard', 'aubergine', 'asperge', 'chou-fleur', 'champignon', 'pois', 'haricot vert', 'maïs', 'betterave', 'chou de bruxelles', 'chou kale', 'endive', 'fenouil', 'gombo', 'navet', 'radis', 'courge', 'blette', 'céleri', 'artichaut', 'chou-rave', 'échalote', 'gingembre', 'ail', 'patate douce', 'taro', 'manioc', 'poireau', 'bambou', 'radis daïkon', 'chou chinois', 'pak choi', 'chou frisé', 'algue', 'piment', 'citrouille', 'persil', 'coriandre', 'menthe', 'basilic', 'poulet', 'bœuf', 'porc', 'agneau', 'saumon', 'crevettes', 'thon', 'moules', 'canard', 'dinde', 'lapin', 'veau', 'cerf', 'sanglier', 'saucisses', 'bacon', 'jambon', 'poulpes', 'calamars', 'homard', 'crabe', 'huîtres', 'sardines', 'maquereaux', 'anguilles', 'salami', 'chorizo', 'bresaola', 'mortadelle', 'foie de poulet', 'foie de veau', 'cœur de poulet', 'coeur de bœuf', 'langue de bœuf', 'joues de porc', 'joues de bœuf', 'bar', 'dorade', 'lotte', 'saint-jacques', 'palourdes', 'langoustines', 'écrevisses', 'truite', 'lait', 'beurre', 'cheddar', 'parmesan', 'mozzarella', 'feta', 'crème fraîche', 'yaourt', 'crème épaisse', 'fromage bleu', 'ricotta', 'mascarpone', 'oeufs de caille', 'gouda', 'edam', 'camembert', 'brie', 'roquefort', 'lait d\'amande', 'lait de soja', 'lait fermenté', 'lait d\'avoine', 'riz', 'pâtes', 'lentilles', 'haricots noirs', 'haricots rouges', 'haricots blancs', 'pois chiches', 'quinoa', 'avoine', 'orge', 'millet', 'épeautre', 'sarrasin', 'farine de coco', 'farine de riz', 'haricots azuki', 'haricots mungo', 'farine de tapioca', 'farine de pois chiche', 'polenta', 'couscous', 'bulgur', 'farro', 'seigle', 'teff', 'coco', 'brésil', 'dattes', 'abricots secs', 'figues sèches', 'pruneaux', 'graines de tournesol', 'graines de nigelle', 'graines de fenouil', 'huile de tournesol', 'huile de coco', 'vinaigre balsamique', 'vinaigre de cidre', 'huile de sésame', 'huile d\'arachide', 'huile d\'avocat', 'huile de lin', 'huile de noix', 'vinaigre de sherry', 'vinaigre de malt', 'sauce hoisin', 'sauce aux prunes', 'sauce chili', 'sucre blanc', 'sucre brun', 'farine de blé', 'levure chimique', 'miel', 'chocolat pépites', 'chocolat en poudre', 'amandes', 'noix', 'noix de pécan', 'noisettes', 'graines de pavot', 'noix de macadamia', 'pistaches', 'noix de coco', 'safran', 'cardamome', 'clou de girofle', 'muscade', 'anis étoilé', 'fenugrec', 'moutarde (graines)', 'wasabi', 'sauce soja', 'sauce Worcestershire', 'vinaigre de riz', 'tahini', 'pesto', 'curry (poudre)', 'curry (pâte)', 'piment (frais)', 'piment (en poudre)', 'piment (flocons)', 'gingembre frais', 'ail en poudre', 'cannelle', 'feuilles de laurier', 'estragon', 'marjolaine', 'poudre de chili', 'sauce teriyaki', 'miso', 'ketchup', 'mayonnaise', 'noix du Brésil', 'graines de lin', 'graines de sésame', 'levure boulanger', 'levure nutritionnelle', 'nutella', 'beurre de cacahuète', 'gelée de fruits', 'sirop d\'érable', 'sirop d\'agave', 'vinaigre balsamique de Modène', 'chapelure', 'poudre de cacao', 'extrait de vanille', 'agar-agar', 'café', 'thé vert', 'thé noir', 'chocolat noir', 'chocolat au lait', 'sucre de coco', 'sucre glace', 'pâte de curry', 'tamarinde', 'pâte de tomate', 'harissa', 'kimchi', 'sauerkraut', 'algues séchées', 'panko (chapelure japonaise)', 'semoule', 'vermicelles de riz', 'nouilles soba', 'nouilles udon']

puts 'creating categories...'
categories.each do |category|
  Category.create!(name: category)
end

puts 'creating ingredients...'
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

recipes_raw = [
  {
    title: 'Cookies maison',
    category_name: 'Dessert',
    user_email: 'bob@gmail.com',
    difficulty: 'Facile',
    cooking_time: 15,
    preparation_time: 10,
    number_of_servings: 4,
    note: 'Recette de cookies facile et rapide à réaliser',
    ingredients: [
      { name: 'farine', quantity_value: 150, quantity_unit: 'g' },
      { name: 'levure', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'sucre vanillé', quantity_value: 1, quantity_unit: 'sachet' },
      { name: 'sucre', quantity_value: 85, quantity_unit: 'g' },
      { name: 'beurre', quantity_value: 85, quantity_unit: 'g' },
      { name: 'oeuf', quantity_value: 1, quantity_unit: '' },
      { name: 'chocolat', quantity_value: 100, quantity_unit: 'g' }
    ],
    steps: [
      { step_number: 1, instruction: 'Détailler le chocolat en pépites.' },
      { step_number: 2, instruction: "Préchauffer le four à 180°C (thermostat 6). Dans un saladier, mettre 75 g de beurre, le sucre, l'oeuf entier, la vanille et mélanger le tout avec une cuillère en bois." },
      { step_number: 3, instruction: 'Ajouter petit à petit la farine mélangée à la levure, le sel et le chocolat.' },
      { step_number: 4, instruction: 'Avec une feuille de papier essuie-tout, beurrer une plaque allant au four et former les cookies sur la plaque. Pour former les cookies, utiliser 2 cuillères à soupe et faire des petits tas espacés les uns des autres; ils grandiront à la cuisson.' },
      { step_number: 5, instruction: 'Enfourner pour 10 minutes de cuisson.' }
    ]
  },
  {
    title: 'Quiche lorraine',
    category_name: 'Plat principal',
    user_email: 'bob@gmail.com',
    difficulty: 'Moyen',
    cooking_time: 35,
    preparation_time: 20,
    number_of_servings: 6,
    note: 'Très simple pour les soirs de flemme.',
    ingredients: [
      { name: 'pâte brisée', quantity_value: 1, quantity_unit: 'rouleau' },
      { name: 'lardons fumés', quantity_value: 200, quantity_unit: 'g' },
      { name: 'crème fraîche', quantity_value: 200, quantity_unit: 'ml' },
      { name: 'lait', quantity_value: 100, quantity_unit: 'ml' },
      { name: 'oeufs', quantity_value: 3, quantity_unit: '' },
      { name: 'fromage râpé', quantity_value: 100, quantity_unit: 'g' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'poivre', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'noix de muscade', quantity_value: 1, quantity_unit: 'pincée' }
    ],
    steps: [
      { step_number: 1, instruction: 'Préchauffer le four à 180°C (thermostat 6). Étaler la pâte dans un moule à tarte, piquer le fond avec une fourchette.' },
      { step_number: 2, instruction: 'Faire revenir les lardons dans une poêle sans ajouter de matière grasse. Répartir sur le fond de tarte.' },
      { step_number: 3, instruction: 'Dans un saladier, battre les oeufs avec la crème et le lait. Assaisonner de sel, poivre et muscade. Verser sur les lardons.' },
      { step_number: 4, instruction: 'Saupoudrer de fromage râpé et enfourner pour 35 minutes de cuisson.' }
    ]
  },
  {
    title: 'Salade César',
    category_name: 'Entrée',
    user_email: 'bob@gmail.com',
    difficulty: 'Facile',
    cooking_time: 0,
    preparation_time: 15,
    number_of_servings: 4,
    note: 'Très bonne et rapide, idéale en entrée ou en plat principal.',
    ingredients: [
      { name: 'salade romaine', quantity_value: 1, quantity_unit: 'tête' },
      { name: 'blancs de poulet', quantity_value: 2, quantity_unit: 'unités' },
      { name: 'croûtons', quantity_value: 100, quantity_unit: 'g' },
      { name: 'parmesan', quantity_value: 50, quantity_unit: 'g' },
      { name: 'sauce César', quantity_value: 100, quantity_unit: 'ml' },
      { name: "huile d'olive", quantity_value: '', quantity_unit: '' },
      { name: 'sel', quantity_value: '', quantity_unit: '' },
      { name: 'poivre', quantity_value: '', quantity_unit: '' }
    ],
    steps: [
      { step_number: 1, instruction: 'Laver et couper la salade. La disposer dans un grand saladier.' },
      { step_number: 2, instruction: 'Griller les blancs de poulet à la poêle avec un peu d\'huile d\'olive, sel et poivre. Couper en tranches et ajouter à la salade.' },
      { step_number: 3, instruction: 'Ajouter les croûtons et le parmesan râpé. Verser la sauce César et mélanger délicatement.' }
    ]
  },
  {
    title: 'Ratatouille',
    category_name: 'Accompagnement',
    user_email: 'seb@gmail.com',
    difficulty: 'Facile',
    cooking_time: 40,
    preparation_time: 20,
    number_of_servings: 4,
    note: 'Idéal pour accompagner un plat.',
    ingredients: [
      { name: 'aubergine', quantity_value: 1, quantity_unit: '' },
      { name: 'courgette', quantity_value: 2, quantity_unit: '' },
      { name: 'poivron rouge', quantity_value: 1, quantity_unit: '' },
      { name: 'poivron jaune', quantity_value: 1, quantity_unit: '' },
      { name: 'tomates', quantity_value: 4, quantity_unit: '' },
      { name: 'oignon', quantity_value: 1, quantity_unit: '' },
      { name: 'ail', quantity_value: 2, quantity_unit: 'gousses' },
      { name: "huile d'olive", quantity_value: 3, quantity_unit: 'c. à soupe' },
      { name: 'herbes de Provence', quantity_value: 1, quantity_unit: 'c. à soupe' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'poivre', quantity_value: 1, quantity_unit: 'c. à café' }
    ],
    steps: [
      { step_number: 1, instruction: 'Couper tous les légumes en morceaux de taille moyenne.' },
      { step_number: 2, instruction: 'Dans une grande poêle, chauffer l’huile d’olive et y faire revenir l’oignon et l’ail.' },
      { step_number: 3, instruction: 'Ajouter les poivrons, puis les aubergines et les courgettes. Laisser mijoter à feu moyen pendant 10 minutes.' },
      { step_number: 4, instruction: 'Incorporer les tomates, les herbes de Provence, le sel et le poivre. Couvrir et laisser mijoter à feu doux pendant environ 30 minutes.' }
    ]
  },
  {
    title: 'Crème brûlée',
    category_name: 'Dessert',
    user_email: 'seb@gmail.com',
    difficulty: 'Difficile',
    cooking_time: 45,
    preparation_time: 15,
    number_of_servings: 4,
    note: 'Excellente, à refaire sans hésiter.',
    ingredients: [
      { name: 'jaunes d’oeufs', quantity_value: 6, quantity_unit: '' },
      { name: 'sucre', quantity_value: 100, quantity_unit: 'g' },
      { name: 'crème liquide', quantity_value: 500, quantity_unit: 'ml' },
      { name: 'vanille', quantity_value: 1, quantity_unit: 'gousse' },
      { name: 'sucre roux', quantity_value: 4, quantity_unit: 'c. à soupe' }
    ],
    steps: [
      { step_number: 1, instruction: 'Préchauffer le four à 100°C. Fendre la gousse de vanille en deux et gratter les graines.' },
      { step_number: 2, instruction: 'Chauffer la crème avec la vanille (gousse et graines) sans la faire bouillir. Laisser infuser.' },
      { step_number: 3, instruction: 'Fouetter les jaunes d’œufs avec le sucre jusqu’à ce que le mélange blanchisse. Verser la crème vanillée en filtrant, tout en fouettant.' },
      { step_number: 4, instruction: 'Répartir la préparation dans des ramequins. Cuire au bain-marie dans le four pendant 40 à 45 minutes.' },
      { step_number: 5, instruction: 'Laisser refroidir, puis saupoudrer de sucre roux et caraméliser avec un chalumeau de cuisine avant de servir.' }
    ]
  },
  {
    title: 'Risotto aux champignons',
    category_name: 'Plat principal',
    user_email: 'seb@gmail.com',
    difficulty: 'Moyen',
    cooking_time: 25,
    preparation_time: 10,
    number_of_servings: 4,
    note: 'Un risotto crémeux, parfait pour un dîner italien authentique.',
    ingredients: [
      { name: 'riz arborio', quantity_value: 350, quantity_unit: 'g' },
      { name: 'champignons de Paris', quantity_value: 300, quantity_unit: 'g' },
      { name: 'oignon', quantity_value: 1, quantity_unit: 'pièce' },
      { name: 'bouillon de légumes', quantity_value: 1, quantity_unit: 'l' },
      { name: 'vin blanc', quantity_value: 100, quantity_unit: 'ml' },
      { name: 'parmesan', quantity_value: 50, quantity_unit: 'g' },
      { name: 'beurre', quantity_value: 50, quantity_unit: 'g' },
      { name: "huile d'olive", quantity_value: 2, quantity_unit: 'c. à soupe' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'poivre', quantity_value: 1, quantity_unit: 'c. à café' }
    ],
    steps: [
      { step_number: 1, instruction: 'Nettoyer et couper les champignons en lamelles. Hacher l’oignon finement.' },
      { step_number: 2, instruction: 'Dans une grande casserole, faire revenir l’oignon avec l’huile d’olive. Ajouter le riz et le faire nacrer.' },
      { step_number: 3, instruction: 'Déglacer avec le vin blanc et laisser réduire. Ajouter les champignons et une louche de bouillon. Laisser absorber avant d’ajouter plus de bouillon. Répéter jusqu’à cuisson complète du riz.' },
      { step_number: 4, instruction: 'Hors du feu, ajouter le beurre et le parmesan. Mélanger jusqu’à obtenir une consistance crémeuse. Saler et poivrer avant de servir.' }
    ]
  },
  {
    title: 'Tarte aux épinards et chèvre',
    category_name: ['Plat principal', 'Végétarien'],
    user_email: 'alice@gmail.com',
    difficulty: 'Facile',
    cooking_time: 30,
    preparation_time: 15,
    number_of_servings: 4,
    note: 'Une tarte végé super simple à réaliser.',
    ingredients: [
      { name: 'pâte brisée', quantity_value: 1, quantity_unit: 'rouleau' },
      { name: 'épinards', quantity_value: 300, quantity_unit: 'g' },
      { name: 'fromage de chèvre', quantity_value: 200, quantity_unit: 'g' },
      { name: 'crème fraîche', quantity_value: 100, quantity_unit: 'ml' },
      { name: 'oeufs', quantity_value: 3, quantity_unit: 'pièces' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'poivre', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'noix de muscade', quantity_value: 1, quantity_unit: 'pincée' }
    ],
    steps: [
      { step_number: 1, instruction: 'Préchauffer le four à 180°C (thermostat 6). Étaler la pâte dans un moule à tarte et piquer le fond avec une fourchette.' },
      { step_number: 2, instruction: 'Blanchir les épinards dans de l’eau bouillante salée, puis les égoutter et les presser pour retirer l’excès d’eau.' },
      { step_number: 3, instruction: 'Dans un saladier, battre les oeufs avec la crème fraîche, saler, poivrer et ajouter une pincée de muscade.' },
      { step_number: 4, instruction: 'Répartir les épinards sur le fond de tarte, ajouter des rondelles de fromage de chèvre puis verser le mélange oeufs-crème.' },
      { step_number: 5, instruction: 'Cuire au four pendant 30 minutes jusqu’à ce que la tarte soit dorée et ferme au toucher.' }
    ]
  },
  {
    title: 'Tarte aux pommes',
    category_name: 'Dessert',
    user_email: 'alice@gmail.com',
    difficulty: 'facile',
    cooking_time: 30,
    preparation_time: 20,
    number_of_servings: 6,
    note: 'La recette de ma grand-mère.',
    ingredients: [
      { name: 'pâte brisée', quantity_value: 1, quantity_unit: 'rouleau' },
      { name: 'pommes', quantity_value: 5, quantity_unit: 'pièces' },
      { name: 'sucre', quantity_value: 100, quantity_unit: 'g' },
      { name: 'beurre', quantity_value: 50, quantity_unit: 'g' },
      { name: 'cannelle', quantity_value: 1, quantity_unit: 'c. à café' }
    ],
    steps: [
      { step_number: 1, instruction: 'Préchauffer le four à 180°C (thermostat 6). Étaler la pâte dans un moule à tarte et piquer le fond avec une fourchette.' },
      { step_number: 2, instruction: 'Éplucher les pommes et les couper en fines lamelles. Les disposer sur la pâte.' },
      { step_number: 3, instruction: 'Saupoudrer de sucre et de cannelle, puis répartir des petits morceaux de beurre sur le dessus.' },
      { step_number: 4, instruction: 'Enfourner pour environ 30 minutes, jusqu’à ce que les pommes soient dorées et la pâte croustillante.' }
    ]
  },
  {
    title: 'Soupe à l’oignon',
    category_name: 'Entrée',
    user_email: 'alice@gmail.com',
    difficulty: 'Facile',
    cooking_time: 45,
    preparation_time: 15,
    number_of_servings: 4,
    note: 'Un plat réconfortant.',
    ingredients: [
      { name: 'oignons', quantity_value: 6, quantity_unit: '' },
      { name: 'beurre', quantity_value: 50, quantity_unit: 'g' },
      { name: 'farine', quantity_value: 2, quantity_unit: 'c. à soupe' },
      { name: 'bouillon de boeuf', quantity_value: 1.5, quantity_unit: 'l' },
      { name: 'baguette', quantity_value: 1, quantity_unit: '' },
      { name: 'fromage râpé', quantity_value: 100, quantity_unit: 'g' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'poivre', quantity_value: 1, quantity_unit: 'c. à café' }
    ],
    steps: [
      { step_number: 1, instruction: 'Émincer finement les oignons. Dans une grande casserole, faire fondre le beurre et y ajouter les oignons. Laisser caraméliser à feu doux pendant environ 30 minutes, en remuant de temps en temps.' },
      { step_number: 2, instruction: 'Saupoudrer les oignons de farine, bien mélanger, puis verser le bouillon de bœuf. Porter à ébullition, puis laisser mijoter à feu doux pendant 15 minutes. Saler et poivrer à votre convenance.' },
      { step_number: 3, instruction: 'Préchauffer le grill du four. Verser la soupe dans des bols résistants à la chaleur, ajouter une tranche de baguette dans chaque bol, puis couvrir de fromage râpé.' },
      { step_number: 4, instruction: 'Gratiner sous le grill jusqu’à ce que le fromage soit doré et bouillonnant.' }
    ]
  },
  {
    title: 'Curry de légumes',
    category_name: ['Plat principal', 'Vegan', 'Sans gluten', 'Sans lactose'],
    user_email: 'alice@gmail.com',
    difficulty: 'Facile',
    cooking_time: 30,
    preparation_time: 15,
    number_of_servings: 4,
    note: 'Très bon plat vegan.',
    ingredients: [
      { name: 'pomme de terre', quantity_value: 2, quantity_unit: '' },
      { name: 'carotte', quantity_value: 2, quantity_unit: '' },
      { name: 'pois chiches', quantity_value: 400, quantity_unit: 'g (1 boîte)' },
      { name: 'lait de coco', quantity_value: 400, quantity_unit: 'ml' },
      { name: 'pâte de curry', quantity_value: 2, quantity_unit: 'c. à soupe' },
      { name: 'oignon', quantity_value: 1, quantity_unit: '' },
      { name: 'ail', quantity_value: 2, quantity_unit: 'gousses' },
      { name: 'huile', quantity_value: 1, quantity_unit: 'c. à soupe' },
      { name: 'épinards', quantity_value: 100, quantity_unit: 'g' },
      { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
      { name: 'coriandre fraîche', quantity_value: 2, quantity_unit: 'c. à soupe' }
    ],
    steps: [
      { step_number: 1, instruction: 'Éplucher et couper les pommes de terre et les carottes en dés. Émincer l’oignon et hacher l’ail.' },
      { step_number: 2, instruction: 'Dans une grande poêle ou un wok, faire chauffer l’huile et y faire revenir l’oignon et l’ail. Ajouter la pâte de curry et remuer pendant une minute.' },
      { step_number: 3, instruction: 'Ajouter les pommes de terre, les carottes et les pois chiches égouttés. Verser le lait de coco et un peu d’eau si nécessaire, puis laisser mijoter à couvert pendant environ 20 minutes ou jusqu’à ce que les légumes soient tendres.' },
      { step_number: 4, instruction: 'Incorporer les épinards et laisser cuire jusqu’à ce qu’ils soient flétris. Assaisonner avec le sel.' },
      { step_number: 5, instruction: 'Servir chaud, garni de coriandre fraîche hachée.' }
    ]
  }
]

recipes_raw.each do |recipe_raw|
  recipe = Recipe.create!(
    title: recipe_raw[:title],
    categories: [Category.find_by(name: recipe_raw[:category_name])],
    user: User.find_by(email: recipe_raw[:user_email]),
    difficulty: recipe_raw[:difficulty],
    cooking_time: recipe_raw[:cooking_time],
    preparation_time: recipe_raw[:preparation_time],
    number_of_servings: recipe_raw[:number_of_servings],
    note: recipe_raw[:note]
  )

  recipe_raw[:ingredients].each do |ingredient_raw|
    ingredient = Ingredient.find_by(name: ingredient_raw[:name])
    RecipeIngredient.create!(
      recipe: recipe,
      ingredient: ingredient,
      quantity_value: ingredient_raw[:quantity_value],
      quantity_unit: ingredient_raw[:quantity_unit]
    )
  end

  recipe_raw[:steps].each do |step_raw|
    PreparationStep.create!(
      recipe: recipe,
      step_number: step_raw[:step_number],
      instruction: step_raw[:instruction]
    )
  end
  puts "Created recipe: #{recipe.title}"
end
