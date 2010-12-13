class PhoneNumbersController < ApplicationController
  before_filter :authenticate_user!

  def load_phone_number_types
    @phone_number_types=PhoneType.all
  end

  def index
    @contact_id=params[:contact_id]
    contact_phone_numbers(@contact_id)
  end

  def new
    load_phone_number_types
    @phone_number = PhoneNumber.new()
    @phone_number.contact_id=params[:contact_id]
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def create
    load_phone_number_types
    @phone_number = PhoneNumber.new(params[:phone_number])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      if @phone_number.save
        flash[:notice] = "Successfully created phone_number."
        @contact_id=@phone_number.contact_id
        contact_phone_numbers(@phone_number.contact_id)
        format.js { render :action => :index}
      else
        format.js { render :action => :new}
      end
      
    end

  end

  def edit
    load_phone_number_types
    @phone_number = PhoneNumber.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :new}
    end
  end

  def update
    load_phone_number_types
    @phone_number = PhoneNumber.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      if @phone_number.update_attributes(params[:phone_number])
        flash[:notice] = "Successfully updated phone_number."
        @contact_id=@phone_number.contact_id
        contact_phone_numbers(@phone_number.contact_id)
        format.js { render :action => :index}
      else
        format.js { render :action => :new}
      end
    end
  end

  def destroy
    @phone_number =PhoneNumber.find(params[:id])
    @contact_id=@phone_number.contact_id
    @phone_number.destroy
    flash[:notice] = "Successfully destroyed phone_number."
    contact_phone_numbers(@contact_id)
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :index}
    end
  end


  def contact_phone_numbers(contact_id)
    contact=Contact.where(:id => contact_id).first
    @phone_numbers = contact.phone_numbers || []
  end
end
