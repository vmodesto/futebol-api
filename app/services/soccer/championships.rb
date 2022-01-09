class Soccer::Championships
  def get_championships
    #Chamar a api de terceiro
    if not Championship.exists?
      championships = SoccerApi::Championship.new.get_championships
      championship_api_repository = Soccer::ChampionshipsApiRepository.new
      championships.each do |championship|
        championship_api_repository.create_from(championship)
      end
    end
    return Championship.all
  end    
end