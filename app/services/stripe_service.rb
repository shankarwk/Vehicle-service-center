require 'stripe'
class StripeService
  def initialize
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end
  def find_or_create_customer(user)
    if user.stripe_customer_id.present?
      stripe_customer = Stripe::Customer.retrieve(user.stripe_customer_id)
    else
      stripe_customer = Stripe::Customer.create({
                                                  email: user.email
                                                  
                                                })
      user.update(stripe_customer_id: stripe_customer.id)
    end
    stripe_customer
  end
  def create_card_token(params)
    Stripe::Token.create({
                           card: {
                             number: params[:number].to_s,
                             exp_month: params[:exp_month],
                             exp_year: params[:exp_year],
                             cvc: params[:cvc]
                           }
                         })
  end
  def create_stripe_customer_card(token, stripe_customer)
    Stripe::Customer.create_source(
      stripe_customer.id,
      { source: token }
    )
  end
  def create_stripe_charge(amount_to_be_paid,
                           stripe_customer_id, card_id, service_center)
    Stripe::Charge.create({
                            amount: amount_to_be_paid.to_i * 100,
                            currency: 'usd',
                            source: card_id,
                            customer: stripe_customer_id,
                            description: "Amount $#{amount_to_be_paid} charged for #{service_center}"
                          })
  end
  def service_payment(user_id,service_center_id,amount)
    @payment = Payment.new(user_id: user_id, service_center_id:service_center_id,amount: amount)
    @payment.save
  end
end