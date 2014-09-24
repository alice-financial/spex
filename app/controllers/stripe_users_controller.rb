class StripeUsersController < ApplicationController
  include BillingHelper
  def index
    @users = StripeUser.all
  end
  def new
    @user = StripeUser.new
  end

  def create
    attributes = user_params
    card_token =  attributes.delete(:card_token)
    @user = StripeUser.new(attributes)
    if @user.valid? && !card_token.blank?

      begin
        @user.stripe_id = add_update_billing_details(@user, card_token)
        @user.save
        flash[:notice] = "Added user #{@user.name}"
        redirect_to stripe_users_path
      rescue BillingHelper::BillingError => e
        flash[:error] = "Something went wrong: #{e.message}"
        redirect_to :back
      end
    else
      if card_token.blank?
        @user.errors[:payment_details] << 'must be entered'
      end
      render :new
    end
  end

  def charge_user
    amount = params[:quantity].to_f
    user = StripeUser.find(params[:user_id])
    begin
      result = attempt_user_charge(user, amount)
      # you could test against result.paid
      flash[:notice] = "Successfully charged #{user.name} $#{amount}"
    rescue BillingHelper::BillingError => e
      flash[:error] = "Something went wrong: #{e.message}"
    end
    redirect_to :back
  end

  private

  def user_params
    params.require(:stripe_user).permit(:name, :email, :card_token)
  end
end
