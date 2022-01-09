class ChampionshipRepository
  class << self
    def get_championships
      Championship.all
    end
  end
end