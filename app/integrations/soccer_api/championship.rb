module SoccerApi
  class Championship
    URL = 'https://api.api-futebol.com.br/v1/campeonatos'
    PARAMS = {:sections => 42336}
    def get_championships
      response = Faraday.get URL, PARAMS do |request|
        request.headers["Authorization"] = ENV['SOCCER_API_KEY']
      end
      championships = JSON.parse response.body
      return championships
    end
  end
end