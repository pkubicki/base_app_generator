class StaticPagesController < ApplicationController

  def show
   if allowed_to?(params[:id])
     render :template => "static_pages/#{params[:id]}"  
   elsif !YAML::load(File.open("#{YamledAcl.files_with_permissions_path}/static_pages.yml"))[params[:id]]
     render_404
   else
     raise YamledAcl::AccessDenied
   end
  end

end
