class ApplicationController < ActionController::Base
  include Response

  protect_from_forgery prepend: true

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
  
  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
