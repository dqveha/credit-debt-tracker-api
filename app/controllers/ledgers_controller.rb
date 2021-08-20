class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.all
    render json: @ledgers
  end

  def show
    @ledger = Ledger.find(params[:id])
    render json:@ledger
  end

  def create
    @ledger = Ledger.create!(ledger_params)
    json_response(@ledger, :created)
  end

  def update
    @ledger = Ledger.find(params[:id])
    if @ledger.update!(ledger_params)
      render status: 200, json: {
        message: "This ledger has been updated successfully"
      } 
    end
  end

  def destroy
    @ledger = Ledger.find(params[:id])
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
end
