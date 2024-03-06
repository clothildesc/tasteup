class ScrapWithOpenai
  def initialize(html)
    @html = html
    @client = OpenAI::Client.new
  end

  def call
    response = @client.chat(parameters: {
      model: "gpt-4-0125-preview",
      response_format: { type: "json_object" },
      messages: [{ role: "user", content: prompt }, ]
    })

    data = response["choices"]&.first&.dig("message", "content")
    JSON.parse(data) if data
  end

  private

  def prompt
    "À partir du html suivant #{@html}, peux-tu extraire les données dans le format suivant: #{desired_format} ?"
  end

  def desired_format
    {
      title: 'Cookies maison',
      image_name: 'cookies_maison.webp',
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
    }
  end
end

# ScrapWithOpenAI.new(url).call
