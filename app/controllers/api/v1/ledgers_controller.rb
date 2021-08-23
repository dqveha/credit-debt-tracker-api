class Api::V1::LedgersController < Api::V1::BaseController
  before_action :set_ledger, only: [:show, :update, :destroy]

  before_action :authorize_ledger, only: [:show, :update, :destroy]
  
  def index
    @ledger = @user.ledger
    json_response(@ledger)
  end

  def show
    json_response(@ledger)
  end

  def create
    @user = User.find(params[:user_id])
    @ledger = Ledger.create!(account_name: params[:account_name], user_id: @user.id)
    if @ledger.save
      render status: 200, json: {
        message: "This ledger has been created successfully"
      }
    else
      render status: :unprocessable_entity, json: { 
        message: @ledger.errors.full_messages 
      } 
    end
  end
    

  def update
    if @ledger.update!(ledger_params)
      render status: 200, json: {
        message: "This ledger has been updated successfully"
      }
    else
      render status: :unprocessable_entity, json: {
        message: @ledger.errors.full_messages
      }
    end
  end

  def destroy
    if @ledger.destroy
      render status: 200, json: {
        message: "This ledger has been successfully deleted"
      }
    end
  end

  private
    def authorize_ledger
      render json: { message: "Unauthorized" }, status: :unauthorized unless @user == @ledger.user
    end

    def ledger_params
      params.permit(:account_name)
    end

    def set_ledger
      @ledger = Ledger.find(params[:id])
    end
end
