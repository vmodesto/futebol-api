class CoreDomain::UserRepository
  def create(user_params:)
    result = User.create!(user_params)
  end

  def create_session(session_params:)
    result = User.find_by("lower(email) = ?", session_params[:email].downcase)
    user = CoreDomain::UserEntity.new(
      id: result.id,
      name: result.username,
      password: result.password,
      email: result.email
    )
  end

  def find(current_user_id:)
    User.find(current_user_id)
  end
end