ActiveAdmin.register User do
  member_action :verify, :method => :put do
    user_profile = User.find(params[:id])
    user_profile.verified = true
    user_profile.save
    redirect_to admin_users_url
  end

  member_action :revoke, :method => :put do
    user_profile = User.find(params[:id])
    user_profile.verified = false
    user_profile.save
    redirect_to admin_users_url
  end

  action_item :only => :show do
    link_to "VERIFY USER", verify_admin_user_path(:id => params[:id]), :method => :put
  end

  index do
    column "Approve User" do |user|
      link_to "VERIFY", verify_admin_user_path(:id => user.id), :method => :put
    end

    column "Revoke Verification" do |user|
      link_to "REVOKE", revoke_admin_user_path(:id => user.id), :method => :put
    end

    column :verified
    column :id
    column :created_at
    column :name
    column :email
    column :bio
    column :zip_code
    column :bitcoin_address
    column :twitter
    column :phone
    column :company_affiliation
    column :industry
    column :job_title
    column :current_sign_in_at
    column :last_sign_in_at


  end
end