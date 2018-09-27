# encoding: UTF-8
# frozen_string_literal: true

require_dependency 'admin/base_controller'

module Admin
  module Withdraws
    class BaseController < BaseController
      
      def authenticate_level
        unless current_user.level > 1
          flash[:alert] = "Need passed google verification !"
          redirect_to new_member_mfa_session_path
        end
      end

    protected

      def currency
        Currency.where(type: self.class.name.demodulize.underscore.gsub(/_controller\z/, '').singularize)
                .find(params[:currency])
      end

      def find_withdraw
        model     = "::Withdraws::#{self.class.name.demodulize.gsub(/Controller\z/, '').singularize}".constantize
        @withdraw = model.where(currency: currency).find(params[:id])
      end
    end
  end
end
