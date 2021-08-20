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

  def calc_month_interest
    @ledger = Ledger.find(params[:ledger_id])
    @credit_card = CreditCard.find(params[:id])
    @cc_month_interest = CreditCard.calculate_month_interest(@credit_card.id)
    render json: { month_interest: @cc_month_interest }
  end

  def create
    @ledger = Ledger.find(params[:ledger_id])
    @credit_card = CreditCard.create!({:credit_balance => params[:credit_balance], :apr_purchases => params[:apr_purchases], :ledger_id => @ledger.id, :set_day_of_payment => params[:set_day_of_payment]})
    json_response(@credit_card, :created)
  end

  def update
    @credit_card = CreditCard.find(params[:id])
    if @credit_card.update!(credit_card_params)
      render status: 200, json: {
        message: "This credit card information has been updated successfully"
      } 
    else
      render status: 403, json: {
        message: "Credit card information did not succesfully update"
      }
    end
  end

  def destroy
    @credit_card = CreditCard.find(params[:id])
    if @credit_card.destroy
      render status: 200, json: {
        message: "This credit_card has been successfully deleted"
      }
    else
      render status: 403, json: {
        message: "Credit card was not deleted"
      }
    end
  end

  private
    def credit_card_params
      params.permit(:credit_balance, :apr_purchases, :set_day_of_payment)
    end
end
