module SoccerApi
  class Championship
    URL = 'https://api.api-futebol.com.br/v1/campeonatos'
    TOKEN = 'Bearer live_cd4a5d73e3dce3958d01b49ac88bf7'
    PARAMS = {:sections => 42336}
    def get_championships
      response = Faraday.get URL, PARAMS do |request|
        request.headers["Authorization"] = TOKEN
      end
      championships = JSON.parse response.body
      return championships
    end
  end
end