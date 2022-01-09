class CoreDomain::User::NewUserInteractor
  def initialize(repository:)
    @repository = repository
  end

  def create(user_params:)
    raise ArgumentError, 'Username invalid' if user_params[:username].size < 5
    raise ArgumentError, 'Password invalid' if user_params[:password].size < 6
    unless Format::Email.new.is_email_valid(user_params[:email])
      raise ArgumentError, 'Email invalid'
    end
    begin
      @repository.new.create(user_params: user_params)
    rescue ActiveRecord::RecordInvalid
      raise ArgumentError, 'This email is already registred'
    end
  end
end