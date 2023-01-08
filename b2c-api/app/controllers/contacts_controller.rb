class ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: contacts.to_json
  end
end
