module Soccer
  class ChampionshipsApiRepository
    def create_from(championship_data)
      current_issue = championship_data["edicao_atual"]
      issue_id = current_issue["edicao_id"]
      current_phase = championship_data["fase_atual"]
      phase_id = current_phase["fase_id"]

      championship = Soccer::CreateChampionship.new.championship(championship_data)
      Soccer::CreateChampionship.new.current_issue(current_issue, championship.id)
      Soccer::CreateChampionship.new.current_phase(current_phase, championship.id)
    end
  end
end