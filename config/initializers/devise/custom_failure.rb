# require 'devise'

class CustomFailure < Devise::FailureApp
  def respond
    if http_auth?
      http_auth
    else
      json_response
    end
  end

  def json_response
    self.status = 401 
    self.content_type = 'json'
    self.response_body = {'errors' => [i18n_message]}.to_json
  end
end