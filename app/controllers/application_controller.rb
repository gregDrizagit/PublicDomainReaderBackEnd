class ApplicationController < ActionController::API
  serialization_scope :view_context

  def user_id
    token.first["id"]
  end

  def current_user
    @current_user ||= User.find_by(id: user_id)
  end

  def token
    begin
      JWT.decode(request.headers['Authorization'], 'secret', true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{}]
    end
  end

  def issue_token(payload)
    JWT.encode(payload, "secret","HS256")
  end

end
