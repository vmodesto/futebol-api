module Soccer
  class ChampionshipRepository
    def create_from(championship_data)
      current_issue = championship_data["edicao_atual"]
      issue_id = current_issue["edicao_id"]
      current_phase = championship_data["fase_atual"]
      phase_id = current_phase["fase_id"]

      championship = Soccer::CreateChampionship.new.create(championship_data)
      Soccer::CreateCurrentIssue.new.create(current_issue, championship.id)
      Soccer::CreateCurrentPhase.new.create(current_phase, championship.id)
    end
  end
end