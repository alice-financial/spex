module BillingHelper
  class BillingError < StandardError
  end
  def add_update_billing_details(user, card_token)
    if user.stripe_id?
      # update details here...
    else
      begin
        stripe_customer = Stripe::Customer.create(card: card_token,
                                                  email: user.email,
                                                  description: user.name)
        stripe_customer.id
      rescue Stripe::CardError => e
        raise BillingError.new(e.message)
      end
    end
  end

  def attempt_user_charge(user, amount)
    amount = (amount * 100).to_i
    begin
      result = Stripe::Charge.create(
        :amount => amount, # incents
        :currency => "usd",
        :customer => user.stripe_id
      )
      result
    rescue Stripe::CardError => e
      raise BillingError.new(e.message)
    end
  end

end