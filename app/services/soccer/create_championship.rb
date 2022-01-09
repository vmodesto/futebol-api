module Soccer
  class CreateChampionship
    def championship(data)
      championship = Championship.create!(
        name: data["nome"],
        slug: data["slug"],
        popular_name: data["nome_popular"],
        status: data["status"],
        championship_type: data["tipo"],
        logo: data["logo"]
      )
      return championship
    end
    def current_issue(data, championship_id)
      CurrentIssue.create!(
        championship_id: championship_id,
        season: data["temporada"],
        name: data["nome"],
        popular_name: data["nome_popular"],
        slug: data["slug"]
      )
    end
    def current_phase(data, championship_id)
      CurrentPhase.create!(
        championship_id: championship_id,
        name: data["nome"],
        slug: data["slug"],
        phase_type: data["tipo"],
      )
    end
  end
end