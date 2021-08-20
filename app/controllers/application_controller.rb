class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
