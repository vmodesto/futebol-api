class ChampionshipEntity
  attr_accessor :name, :slug, :popular_name, :status, :championship_type, :logo

  def initialize(id:, name:, slug:, popular_name:, status:, championship_type:, logo:)
    @id = id
    @name = name
    @slug = slug
    @popular_name = popular_name
    @status = status
    @championship_type = championship_type
    @logo = logo
    
  end
end