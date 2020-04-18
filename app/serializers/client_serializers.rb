class ClientSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
  
    attributes :lastname, :firstname, :homephone, :workphone
  
    
  
  end
  