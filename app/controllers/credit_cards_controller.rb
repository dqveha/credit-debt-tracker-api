class CreditCardsController < ApplicationController
  def index
    @ledger = Ledger.find(params[:ledger_id])
    @credit_cards = CreditCard.relative(@ledger.id)
    json_response(@credit_cards)
  end

  def show
    @credit_card = CreditCard.find(params[:id])
    json_response(@credit_card)
  end

  def create
    @credit_card = CreditCard.create!(credit_card_params)
    json_response(@credit_card, :created)
  end

  def update
    @credit_card = CreditCard.find(params[:id])
    if ((params[:username] == @credit_card.username) && (params[:author] == @credit_card.author))
      @credit_card.update!(credit_card_params)
      render status: 200, json: {
        message: "This credit card has been updated successfully"
      }
    else
      render status: 403, json: {
        message: "credit_card not updated; confirm that you are the author"
      }
    end
  end

  def destroy
    @credit_card = CreditCard.find(params[:id])
    if @credit_card.username == @credit_card.author && @credit_card.delete
      render status: 200, json: {
        message: "This credit_card has been successfully deleted"
      }
    else
      render status: 403, json: {
        message: "Unable to delete credit_card; confirm that you are the author"
      }
    end
  end

  private
    def credit_card_params
      params.permit(:credit_limit, :annual_fees, :apr_purchases, :apr_cash, :apr_promotional, :set_day_of_payment)
    end
end
