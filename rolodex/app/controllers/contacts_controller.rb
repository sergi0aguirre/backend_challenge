class ContactsController < ApplicationController
  before_filter :authenticate_user!, :load

  def load
    @total_pages=10
    @with_page='page_contact'
    load_contacts
  end

  def index
  end

   def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user=current_user
    stored=false
    if @contact.save
      flash[:notice] = "Successfully created contact."
      load_contacts
      stored=true
    end
    responds_to_parent do
      render :update do |page|
        page << ajax_contact_form(stored)
      end
    end

  end
   
  def edit
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def update
    stored=false
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully updated contact."
      load_contacts
      stored=true
    end
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
    key=params[:key] || ""
    @contacts=Contact.search("%"+key+"%",current_user.id).paginate :page => params[:page], :per_page => @total_pages
    respond_to do |format|
      format.js {render :action=> :index}
    end
  end

  def delete_selection
    contacts=Contact.where_ids(params[:ids],current_user)
    contacts.delete_all
    @contacts = current_user.contacts.paginate :page => params[:page], :per_page => @total_pages
    respond_to do |format|
      format.js {render :partial => 'contacts'}
    end
  end

end

def load_contacts
    @ordertxt=params[:order]=="down" ? "Order A-Z" : "Order Z-A"
    key=params[:key] || ""
    order=params[:order]=="down" ? "first_name DESC" : "first_name ASC"
    @contacts=Contact.filter(key,order,current_user.id).paginate :page => params[:page], :per_page => @total_pages
end