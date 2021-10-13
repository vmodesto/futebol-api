class Api::V1::ChampionshipsController < Api::V1::ApiController

  def index
      @championships = Soccer::Championships.new.get_championships
      render json: @championships, include: include_all
  end

  def show
    @championship = Championship.find(params[:id])
    render json: @championship, include: include_all
  end

  def current_issue
    @current_issue = Championship.all
    render json: @current_issue, include: ["current_issue"]
  end

  private
  def include_all
    return ["current_issue", "current_phase", "users"]
  end

end
