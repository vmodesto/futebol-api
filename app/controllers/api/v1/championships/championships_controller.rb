class Api::V1::Championships::ChampionshipsController < Api::V1::ApiController
  before_action :require_login

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

  def update
    repository = CoreDomain::ChampionshipsRepository.new
    @championship = CoreDomain::Championship::UpdateChampionship
    .new(repository: repository)
    .update(id: params[:id], championship_params: championship_params)
    render json: @Championship, status: 200
  end

  private
  def include_all
    return ["current_issue", "current_phase"]
  end

  def championship_params
    params.require(:championship).permit(:region)
  end
end