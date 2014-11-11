def username
  return session[:username]
end

def login?
  if session[:username].nil?
    return false
  else
    return true
  end
end

helpers do
  def admin?
    session[:admin]
  end
end