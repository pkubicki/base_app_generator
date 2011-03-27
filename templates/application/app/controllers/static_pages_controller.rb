class StaticPagesController < ApplicationController

  def show
     begin
       render :template => "static_pages/#{params[:id]}"
     rescue ActionView::MissingTemplate
       render :file => "shared/404", :status => :not_found
     end
  end

end
