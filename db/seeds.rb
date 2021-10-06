# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
URL = 'https://api.api-futebol.com.br/v1/campeonatos'
TOKEN = 'Bearer live_cd4a5d73e3dce3958d01b49ac88bf7'
params = {:sections => 42336}
  
response = Faraday.get URL, params do |request|
    request.headers["Authorization"] = TOKEN
end
championships = JSON.parse response.body
championships.each do |championship|
    current_issue = championship["edicao_atual"]
    issue_id = current_issue["edicao_id"]
    current_phase = championship["fase_atual"]
    phase_id = current_phase["fase_id"]

    @championship = Championship.create!(
        name: championship["nome"],
        slug: championship["slug"],
        popular_name: championship["nome_popular"],
        status: championship["status"],
        championship_type: championship["tipo"],
        logo: championship["logo"],
    )

    championship_id = @championship.id
  
    @issue = CurrentIssue.create!(
        championship_id: championship_id,
        season: current_issue["temporada"],
        name: current_issue["nome"],
        popular_name: current_issue["nome_popular"],
        slug: current_issue["slug"]
    )

    @phase = CurrentPhase.create!(
        championship_id: championship_id,
        name: current_phase["nome"],
        slug: current_phase["slug"],
        phase_type: current_phase["tipo"],
    )
end 
