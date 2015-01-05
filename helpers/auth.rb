module Auth
  def warden_handler
    env['warden']
  end

  def check_authentication
    unless warden_handler.authenticated?
      redirect '/auth/login'
    end
  end

  def current_user
    warden_handler.user
  end
end  