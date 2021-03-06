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
    ContactList.where(:list_id=>@list.id).delete_all
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

  def show_contacts
    load_contacts
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end


  def search_contacts
    params[:id]=params[:list_id]
    load_contacts
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end


  def add_contact
    @list = List.find(params[:id])
    @contact=Contact.find(params[:contact_id])
    @contact.add_to_list(@list)
    load_contacts
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js { render :action => :show_contacts}
    end
  end

  def delete_selection
    contacts=ContactList.where_ids(params[:ids],params[:id])
    contacts.delete_all
    load_contacts
    respond_to do |format|
      format.js {render :show_contacts}
    end
  end

  def export_to_vcards
    list=List.find(params[:id])
    cards=list.contacts_to_vcards
    filename="contacts_for_#{list.name}_#{list.id}.vcf"
    send_data cards, :filename => filename,
      :type => 'text/directory'
  end

    def load_contacts
    @total_pages=10
    @with_page='page_contact'
    @ordertxt= params[:orde_gen]=="down" ? "Order A-Z" : "Order Z-A"
    order= params[:order_gen]=="down" ? "first_name DESC" : "first_name ASC"
    params[:page]= 1 if params[:page]=="null"
    @list = List.find(params[:id])
    key= params[:key_gen] || ""
    @contacts = @list.contacts.search("%"+key+"%",current_user.id).paginate :page => params[:page], :per_page => @total_pages , :order => order
  end


end
