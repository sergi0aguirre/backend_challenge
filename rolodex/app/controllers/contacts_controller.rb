class ContactsController < ApplicationController
  before_filter :authenticate_user!, :load

  def load
    @total_pages=10
    @with_page='page_contact'
  end

  def index
    load_contacts
  end

  def show
    @contact = Contact.where(:id=> params[:id]).first
    load_extra_info(@contact)
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def new
    @contact = Contact.new()
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user_id=current_user.id
    stored=false
    if @contact.save
      flash[:notice] = "Successfully created contact."
      stored=true
    end
    load_contacts
    responds_to_parent do
      render :update do |page|
        page << ajax_contact_form(stored)
      end
    end

  end
   
  def edit
    @contact = Contact.find(params[:id])
    load_extra_info(@contact)
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js  { render :action => :new }
    end
  end

  def update
    stored=false
    @contact = Contact.find(params[:id])
    load_extra_info(@contact)
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully updated contact."
      stored=true
    end
    load_contacts
    responds_to_parent do
      render :update do |page|
        page << ajax_contact_form(stored)
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    load_contacts
  end

  def search
    load_contacts
    respond_to do |format|
      format.js {render :action=> :index}
    end
  end

  def delete_selection
    contacts=Contact.where_ids(params[:ids],current_user.id)
    contacts.delete_all
    load_contacts
    respond_to do |format|
      format.js {render :partial => 'contacts'}
    end
  end


  def load_contacts
    @ordertxt= params[:order]=="down" ? "Order A-Z" : "Order Z-A"
    key= params[:key] || ""
    order= params[:order]=="down" ? "first_name DESC" : "first_name ASC"
    params[:page]= 1 if params[:page]=="null"
    @contacts=Contact.filter(key,order,current_user.id).paginate :page => params[:page], :per_page => @total_pages

    #Load the lists
    @lists=current_user.lists
  end

  def load_extra_info(contact)
    @phone_numbers=contact.phone_numbers
    @addresses=contact.addresses
  end
end