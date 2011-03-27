module ApplicationHelper

  # It displays flash messages.
  def flash_messages
    render :partial => "shared/flash_message"
  end

  # It displays validation errors for given object. Here is the HAML example:
  #
  #   - form_for @user do |f|
  #     = form_errors(f)
  #     -# ...
  #
  #   - form_for "/sessions/login" do |f|
  #     = form_errors(@session)
  #     -# ...
  def form_errors(object)
    if object.respond_to? :object
      object = object.object
    end
    render :partial => "shared/form_errors", :locals => { :object => object }
  end

  def form_errors_on_base(object)
    if object.respond_to? :object
      object = object.object
    end
    render :partial => "shared/form_errors_on_base", :locals => { :object => object }
  end

  def currency(num)
    number_to_currency( num, :precision => 2, :delimiter => '&nbsp;', :separator => '.', :unit => '' )
  end
  
end
