class IndexController < ApplicationController
  def index
    @hello = "hello"
    render :index
  end
end