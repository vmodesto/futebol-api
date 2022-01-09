class CoreDomain::UserEntity
  attr_accessor :name, :email, :password, :id

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end
end