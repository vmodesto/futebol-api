class CoreDomain::User::CreateSessionInteractor
  def create(session_params:)
    begin
      user = CoreDomain::UserRepository.new.create_session(
        session_params: session_params,
      )
    rescue 
        raise ActiveRecord::RecordNotFound, "Account not found"
    end
  end
end