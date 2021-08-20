class IndexController < ActionController::API
  def index
    @hello = "hello"
    render :index
  end
end