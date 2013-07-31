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
    form do |f|
      f.inputs do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :name
        f.input :bname
        f.input :avatar
        f.input :bio
        f.input :street_address
        f.input :city
        f.input :state
        f.input :online_business
        f.input :bitcoin_address
        f.input :company_website
        f.input :phone
        f.input :company_affiliation
        f.input :industry
        f.input :twitter
        f.input :zip_code
      f.buttons :commit
      end
    end


end