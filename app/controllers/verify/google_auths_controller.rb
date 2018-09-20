class Verify::GoogleAuthsController < ApplicationController
  #before_action :auth_member!
  before_action :find_google_auth
  #before_action :google_auth_activated?,   only: [:show, :create]
  #before_action :google_auth_inactivated?, only: [:edit, :destroy]
  before_action :two_factor_required!,     only: [:show]

  private

  def find_google_auth
    @google_auth ||= current_user.app_two_factor
  end

  def app_two_factor
    two_factors.by_type(:app)						＃two_factors?????
  end


  def find_or_create_by(attributes, &block)
    find_by(attributes) || create(attributes, &block)
  end



  def two_factor_required!
    return if not current_user.sms_two_factor.activated?

    if two_factor_locked?
      session[:return_to] = request.original_url
      redirect_to two_factors_path
    end
  end

  def two_factor_locked?(expired_at: 5.minutes)
    locked  = !session[:two_factor_unlock]
    expired = session[:two_factor_unlock_at].nil? ? true : session[:two_factor_unlock_at] < expired_at.ago

    if !locked and !expired
      session[:two_factor_unlock_at] = Time.now
    end

    locked or expired
  end


end
