ActiveAdmin.register MerchantProfile do     

  member_action :approve, :method => :put do
    merchant_profile = MerchantProfile.find(params[:id])
    merchant_profile.approved = true
    merchant_profile.save
    redirect_to admin_merchant_profiles_url
  end

  member_action :revoke, :method => :put do
    merchant_profile = MerchantProfile.find(params[:id])
    merchant_profile.approved = false
    merchant_profile.save
    redirect_to admin_merchant_profiles_url
  end

  action_item :only => :show do
    link_to "APPROVE MERCHANT", approve_admin_merchant_profile_path(:id => params[:id]), :method => :put
  end
      
  index do
    selectable_column
    column "Approve Merchant" do |merchant|
      link_to "APPROVE", approve_admin_merchant_profile_path(:id => merchant.id), :method => :put
    end

    column "Revoke Merchant Profile" do |merchant|
      link_to "REVOKE", revoke_admin_merchant_profile_path(:id => merchant.id), :method => :put
    end
    column :approved                            
    column :bname
    column :email
    column :bio
    column :street_address                     
    column :state
    column :city
    column :zip_code
    column :bitcoin_address
    column :company_website
    column :phone
    column :company_affiliation
    column :industry
    column :twitter
    column :current_sign_in_at        
    column :last_sign_in_at           
    default_actions                   
  end  

end                                   
