module Soccer
  class CreateCurrentPhase
    def create(data, championship_id)
      CurrentPhase.create!(
        championship_id: championship_id,
        name: data["nome"],
        slug: data["slug"],
        phase_type: data["tipo"],
      )
    end
  end
end