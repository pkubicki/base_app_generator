class StaticPagesController < ApplicationController

  def show
   render :template => "static_pages/#{params[:id]}"
  end

end
