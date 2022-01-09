class CoreDomain::ChampionshipsRepository
    def get_championships
      Championship.all
    end

    def get_championship(id:)
      Championship.find(id)
    end

    def update_championship(id, championship_params)
      championship_found = Championship.find(id)
      championship_found.update(championship_params)
      championship_found.save!
    end
end