class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :logged_in?
  before_filter :set_locale
  before_filter :authorize
  responders :flash
  layout :current_layout
  rescue_from ActionView::MissingTemplate, :with => :render_404
  #rescue_from YamledAcl::ActionNotDefined, :with => :render_404
  rescue_from YamledAcl::AccessDenied, :with => :redirect_to_default

  def render_404
    render :file => "shared/404", :status => :not_found
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
    @current_user
  end

  # hack for passenger and cucumber
  def set_locale
    I18n.locale = I18n.default_locale
  end
  
  def current_layout
    'admin'
  end
  
  def current_group 
    @current_group ||= User::Group.new(current_user_group_name)
  end
  
  def redirect_to_default
    redirect_to case
    when current_group.administrator?
      '/admin_dashboard'
    else
      root_path
    end
  end

end

