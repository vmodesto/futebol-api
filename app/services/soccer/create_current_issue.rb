module Soccer
  class CreateCurrentIssue
    def create(data, championship_id)
      CurrentIssue.create!(
        championship_id: championship_id,
        season: data["temporada"],
        name: data["nome"],
        popular_name: data["nome_popular"],
        slug: data["slug"]
      )
    end
  end
end