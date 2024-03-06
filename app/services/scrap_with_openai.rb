class ScrapWithOpenai
  def initialize(url)
    @url = url
    @client = OpenAI::Client.new
  end

  def call
    @client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt }, ]
    })
  end

  private

  def prompt
    "Here is the url you need to scrap: #{@url}. Can you send me the data in this format: #{desired_format}"
  end

  def desired_format
    # {
    #   ...
    # }
end



# ScrapWithOpenAI.new(url).call
