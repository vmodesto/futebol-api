class CoreDomain::Championship::UpdateChampionship
  def initialize(repository:)
    @repository = repository
  end

  def update(id:, championship_params:)
    return @repository.update_championship(id, championship_params)
  end
end