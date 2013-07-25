ActiveAdmin.register Merchant do

  index do
    selectable_column
    column :id
    column :created_at           
    column :bname
    column :name
    column :email
    column :bio
    column :street_address                     
    column :city
    column :state
    column :zip_code
    column :online_business
    column :bitcoin_address
    column :company_website
    column :phone
    column :company_affiliation
    column :industry
    column :twitter
    column :latitude
    column :longitude
    column :current_sign_in_at        
    column :last_sign_in_at
    default_actions                   
  end 
end