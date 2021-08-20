class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.ActionController
    json_response(@ledgers)
  end

  def show
    @ledger = Ledger.find(params[:id])
    json_response(@ledger)
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
      params.permit(:name)
    end
end
