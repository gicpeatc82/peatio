class MemberMfaSessionsController < ApplicationController
  skip_before_filter :check_mfa
  def new
    @member = current_user
  end

  def create
    @member = current_user
    if @member.google_authentic?(params[:auth][:mfa_code])
      MemberMfaSession.create(@member)
      @member.update(level: 2)
      redirect_to settings_path
    else
      flash[:error] = "Wrong code"
      render :new
    end
  end
end
