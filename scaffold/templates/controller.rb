class <%= plural_name.capitalize %>Controller < ApplicationController
  before_filter :set_<%= singular_name %>, :only => [:show, :edit, :update, :destroy]

  def index
    @<%= plural_name %> = <%= singular_name.capitalize %>.all
  end

  def new
    @<%= singular_name %> = <%= singular_name.capitalize %>.new
  end

  def show
  end

  def edit
  end

  def create
    @<%= singular_name %> = <%= singular_name.capitalize %>.new(params[:<%= singular_name %>])

    if @<%= singular_name %>.save
      redirect_to @<%= singular_name %>, :notice => t(:<%= singular_name %>_created_notice) 
    else
      flash[:alert] = t(:<%= singular_name %>_created_alert)
      render :new
    end
  end

  def update
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      redirect_to @<%= singular_name %>, :notice => t(:<%= singular_name %>_updated_notice) 
    else
      flash[:alert] = t(:<%= singular_name %>_updated_alert)
      render :edit
    end
  end

  def destroy
    @<%= singular_name %>.destroy
    redirect_to <%= plural_name %>_url, :notice => t(:<%= singular_name %>_destroyed_notice) 
  end

  private

  def set_<%= singular_name %>
    @<%= singular_name %> = <%= singular_name.capitalize %>.find(params[:id])
  end
end
