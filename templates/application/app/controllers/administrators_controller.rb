class AdministratorsController < ApplicationController
  respond_to :html

  def index
    @search = Administrator.search(params[:search])
    @administrators = @search.paginate(:page => params[:page])
    respond_with(@administrators)
  end

  def new
    @administrator = Administrator.new
    respond_with(@administrator)
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def create
    @administrator = Administrator.new(params[:administrator])
    respond_with(@administrator) do |format|
      if @administrator.save
        format.html {redirect_to(administrators_path)}
      end
    end
  end

  def update
    @administrator = Administrator.find(params[:id])
    @administrator.update_attributes(params[:administrator])
    respond_with(@administrator) do |format|
      if @administrator.save
        format.html {redirect_to(administrators_path)}
      end
    end
  end
end

