class ListsController < ApplicationController
  before_filter :authenticate_user!


  def index
    @contact_id=params[:contact_id]
    load_lists
  end

  def new
    @list = List.new()
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def create
    @list = List.new(params[:list])
    @list.user=current_user
    respond_to do |format|
      format.html { redirect_to contacts_path}
      if @list.save
        flash[:notice] = "Successfully created list."
        load_lists
        format.js { render :action => :index}
      else
        format.js { render :action => :new}
      end

    end

  end

  def edit
    @list = List.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :new}
    end
  end

  def update
    @list = List.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      if @list.update_attributes(params[:list])
        flash[:notice] = "Successfully updated list."
        load_lists
        format.js { render :action => :index}
      else
        format.js { render :action => :new}
      end
    end
  end

  def destroy
    @list =List.find(params[:id])
    @list.destroy
    flash[:notice] = "Successfully destroyed list."
    load_lists
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :index}
    end
  end


  def load_lists
    @lists = current_user.lists || []
  end
end
