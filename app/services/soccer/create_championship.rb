module Soccer
  class CreateChampionship
    def create(data)
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
  end
end