class Users::SessionsController < ApplicationController
  respond_to :html

  def new
    @user_session = UserSession.new
    respond_with(@user_session)
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    respond_with(@user_session) do |format|
      if @user_session.save
        format.html {redirect_to '/admin_dashboard'}
      else
        format.html {render :action => 'new'}
      end
    end
  end

  def destroy
    @user_session = current_user_session
    @user_session.destroy unless @user_session.blank?
    respond_with(@user_session) do |format|
      format.html {redirect_to('/')}
    end
  end

end

