class Api::V1::LedgersController < Api::V1::BaseController
  before_action :set_ledger, only: [:show, :update, :destroy]
  
  def index
    @ledgers = @user.ledgers
    json_response(@ledgers)
  end

  def show
    json_response(@ledger)
  end

  def create
    @ledger = @user.ledgers.build(ledger_params)
    if @ledger.save
      render :show, status: :created
    else
      render status: :unprocessable_entity, json: { 
        message: @ledger.errors.full_messages 
      } 
    end
    # json_response(@ledger)
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
    def ledger_params
      params.permit(:account_name)
    end

    def set_ledger
      @ledger = Ledger.find(params[:id])
    end
end
