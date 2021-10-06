class Api::V1::ChampionshipsController < Api::V1::ApiController
  def index
    @championships = Championship.all
    render json: @championships, include: ["current_issue", "current_phase"]
  end
end
