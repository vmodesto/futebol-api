class Soccer::Championships
  def get_championships
    #Chamar a api de terceiro
    if not Championship.exists?
      championships = SoccerApi::Championship.new.get_championships
      repository = Soccer::ChampionshipRepository.new
      championships.each do |championship|
        repository.create_from(championship)
      end
    end
    return Championship.all
  end    
end