class StartController < ApplicationController  
  
  def index
    @events = %w{
      account.updated balance.available charge.captured charge.dispute.created charge.failed charge.refund.updated 
      charge.refunded charge.succeeded checkout.session.async_payment_failed checkout.session.async_payment_succeeded 
      checkout.session.completed customer.created customer.deleted customer.source.created customer.source.updated 
      customer.subscription.created customer.subscription.deleted customer.subscription.updated customer.updated 
      invoice.created invoice.finalized invoice.paid invoice.payment_action_required invoice.payment_failed 
      invoice.payment_succeeded invoice.updated issuing_authorization.request issuing_card.created 
      issuing_cardholder.created payment_intent.amount_capturable_updated payment_intent.canceled 
      payment_intent.created payment_intent.partially_funded payment_intent.payment_failed 
      payment_intent.requires_action payment_intent.succeeded payment_link.created payment_link.updated 
      payment_method.attached payout.created payout.updated plan.created plan.deleted plan.updated price.created 
      price.updated product.created product.deleted product.updated quote.accepted quote.canceled quote.created 
      quote.finalized reporting.report_run.succeeded setup_intent.canceled setup_intent.created 
      setup_intent.setup_failed setup_intent.succeeded subscription_schedule.canceled subscription_schedule.created 
      subscription_schedule.released subscription_schedule.updated 
    }
    @event = ''

    if request.post?
      @data = request.body.read
      response = {
        :status => 'success',
        :message => 'Post data received',
        :data => @data,
        :event => @event,
      }
    end

    @events.each do |event|
      if params[:type] == event
        @event = event
        puts @event.upcase
      end
    end

    render :json => response
  end
end
