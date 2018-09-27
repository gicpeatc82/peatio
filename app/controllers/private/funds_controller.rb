# encoding: UTF-8
# frozen_string_literal: true

module Private
  class FundsController < BaseController
    include CurrencyHelper

    layout 'funds'

    before_action :trading_must_be_permitted!
    before_action :level_verification

    def index
      @currencies        = Currency.enabled.sort
      @deposits          = current_user.deposits.includes(:currency)
      @accounts          = current_user.accounts.enabled.includes(:currency)
      @withdraws         = current_user.withdraws

      gon.jbuilder
    end

    helper_method :currency_icon_url

    def gen_address
      current_user.accounts.enabled.each(&:payment_address)
      render nothing: true
    end

    def new_google_qrcode

    end

    private

    def level_verification
      unless current_user.level > 1
        flash[:alert] = "Please pass google verification"
        redirect_to new_member_mfa_session_path
      end
    end

  end
end
