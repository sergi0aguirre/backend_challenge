class AddressesController < ApplicationController
  before_filter :authenticate_user!

  def load_address_types
    @address_types=AddressType.all
  end

  def index
    @contact_id=params[:contact_id]
    contact_addresses(@contact_id)
  end

  def new
    load_address_types
    @address = Address.new()
    @address.contact_id=params[:contact_id]
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def create
    load_address_types
    @address = Address.new(params[:address])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      if @address.save
        flash[:notice] = "Successfully created address."
        @contact_id=@address.contact_id
        contact_addresses(@address.contact_id)
        format.js { render :action => :index}
      else
        format.js { render :action => :new}
      end

    end

  end

  def edit
    load_address_types
    @address = Address.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :new}
    end
  end

  def update
    load_address_types
    @address = Address.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      if @address.update_attributes(params[:address])
        flash[:notice] = "Successfully updated address."
        @contact_id=@address.contact_id
        contact_addresses(@address.contact_id)
        format.js { render :action => :index}
      else
        format.js { render :action => :new}
      end
    end
  end

  def destroy
    @address =Address.find(params[:id])
    @contact_id=@address.contact_id
    @address.destroy
    flash[:notice] = "Successfully destroyed address."
    contact_addresses(@contact_id)
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :index}
    end
  end


  def contact_addresses(contact_id)
    contact=Contact.where(:id => contact_id).first
    @addresses=contact.addresses || []
  end
end
