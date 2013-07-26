class UserSubmission < ActiveRecord::Base
  attr_accessible :comment, :merchant_name, :merchant_website, :username
end
