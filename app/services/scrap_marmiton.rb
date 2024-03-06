require "open-uri"
require "nokogiri"

class ScrapMarmiton
  def initialize(url)
    @url = url
  end

  def call
    html_file = URI.open(@url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    # Extracting the title
    title = html_doc.search(".main-title h1").text.strip

    # Extracting the image name
    image_data_srcset = html_doc.search(".recipe-media-viewer-thumbnail-container img").first['data-srcset']
    srcset_urls = image_data_srcset.split(',').map(&:strip)
    image_name = srcset_urls
                     .select { |url| url.include?('w314h314') }
                     .first
                     .split(' ').first

    # Extracting the category name
    category_name = html_doc.search("#af-bread-crumb a")[2].text.strip.capitalize

    # Extracting the difficulty
    difficulty = html_doc.search(".recipe-primary__item i.icon-difficulty + span").text.capitalize

    # Extracting the cooking time
    cooking_div = html_doc.search(".time__details div").find do |div|
      div.text.include?("Cuisson :")
    end
    cooking_time_text = cooking_div.at('div').text.strip if cooking_div
    cooking_time = cooking_time_text.match(/\d+/)[0]

    # Extracting the preparation time
    preparation_div = html_doc.search(".time__details div").find do |div|
      div.text.include?("Préparation :")
    end
    preparation_time_text = preparation_div.at('div').text.strip if preparation_div
    preparation_time = preparation_time_text.match(/\d+/)[0]

    # Extracting the number of servings
    number_of_servings = html_doc.at(".mrtn-recette_ingredients-counter").attribute_nodes.second.value
    puts number_of_servings

    # Extracting the preparation steps
    steps = html_doc.search(".recipe-step-list__container > p").map do |element|
      element.text.strip
    end

    # Extracting the ingredients
    ingredients = html_doc.search(".mrtn-recette_ingredients-items .ingredient-name").map do |element|
      element.text.strip
    end

    # Extracting quantity values
    quantity_values = html_doc.search(".mrtn-recette_ingredients-items .count").map do |element|
      element.text.strip
    end

    # Extracting quantity units
    quantity_units = html_doc.search(".mrtn-recette_ingredients-items .unit").map do |element|
      element.text.strip
    end

    # Building the desired format

    steps_hashes = steps.map.with_index do |step, index|
      { step_number: index + 1, instruction: step }
    end

    ingredients_hashes = ingredients.map.with_index do |ingredient, index|
      {
        name: ingredient,
        quantity_value: quantity_values[index].to_i,
        quantity_unit: quantity_units[index]
      }
    end

  end
end

  # def desired_format
  #   {
  #     title: 'Cookies maison',
  #     image_name: 'cookies_maison.webp',
  #     category_name: 'Dessert',
  #     user_email: 'bob@gmail.com',
  #     difficulty: 'Facile',
  #     cooking_time: 15,
  #     preparation_time: 10,
  #     number_of_servings: 4,
  #     note: 'Recette de cookies facile et rapide à réaliser',
  #     ingredients: [
  #       { name: 'farine', quantity_value: 150, quantity_unit: 'g' },
  #       { name: 'levure', quantity_value: 1, quantity_unit: 'c. à café' },
  #       { name: 'sel', quantity_value: 1, quantity_unit: 'c. à café' },
  #       { name: 'sucre vanillé', quantity_value: 1, quantity_unit: 'sachet' },
  #       { name: 'sucre', quantity_value: 85, quantity_unit: 'g' },
  #       { name: 'beurre', quantity_value: 85, quantity_unit: 'g' },
  #       { name: 'oeuf', quantity_value: 1, quantity_unit: '' },
  #       { name: 'chocolat', quantity_value: 100, quantity_unit: 'g' }
  #     ],
  #     steps: [
  #       { step_number: 1, instruction: 'Détailler le chocolat en pépites.' },
  #       { step_number: 2, instruction: "Préchauffer le four à 180°C (thermostat 6). Dans un saladier, mettre 75 g de beurre, le sucre, l'oeuf entier, la vanille et mélanger le tout avec une cuillère en bois." },
  #       { step_number: 3, instruction: 'Ajouter petit à petit la farine mélangée à la levure, le sel et le chocolat.' },
  #       { step_number: 4, instruction: 'Avec une feuille de papier essuie-tout, beurrer une plaque allant au four et former les cookies sur la plaque. Pour former les cookies, utiliser 2 cuillères à soupe et faire des petits tas espacés les uns des autres; ils grandiront à la cuisson.' },
  #       { step_number: 5, instruction: 'Enfourner pour 10 minutes de cuisson.' }
  #     ]
  #   }
  # end
