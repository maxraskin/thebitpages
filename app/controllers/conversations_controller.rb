class ConversationsController < ApplicationController
  helper_method :mailbox, :conversation

  def index
    if current_user.present?
      gon.current_user = current_user
    elsif current_merchant_profile.present?
      gon.current_user = current_merchant_profile
    end

    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
      @number_of_friendships = Merchant.number_of_friendships(current_merchant_profile.merchant).to_s
    elsif current_user.present?
      gon.current_user = current_user
      @number_of_friendships = User.number_of_friendships(current_user)
    end    
  end

  def new
    @potential_recipient = []
    if params[:merchant_id]
      @recipient = MerchantProfile.where(:id => params[:merchant_id], :bname => params[:merchant_bname]).first
    elsif params[:user_id]
      @recipient = User.where(:id => params[:user_id], :name => params[:user_name]).first
    end
  end

  def create
    if params[:class] == "User"
      @recipient = User.where(:id => params[:id], :name => params[:name]).first
    elsif params[:class] == "MerchantProfile"
      @recipient = MerchantProfile.where(:id => params[:id], :bname => params[:name]).first
    end

    if current_merchant_profile.present?
      conversation = current_merchant_profile.send_message(@recipient, *conversation_params(:body, :subject)).conversation
    elsif current_user.present?
      conversation = current_user.send_message(@recipient, *conversation_params(:body, :subject)).conversation
    end
    redirect_to conversation
  end

  def reply
    if current_user.present?
      current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    elsif current_merchant_profile.present?
      current_merchant_profile.reply_to_conversation(conversation, *message_params(:body, :subject))
    end
    redirect_to conversation
  end

  def trash
    if current_merchant_profile.present?
      conversation.move_to_trash(current_merchant_profile)
    elsif current_user.present?
      conversation.move_to_trash(current_user)
    end
    redirect_to :conversations
  end

  def untrash
    if current_merchant_profile.present?
      conversation.untrash(current_merchant_profile)
    elsif current_user.present?
      conversation.untrash(current_user)
    end
    redirect_to :conversations
  end

  def destroy_trash
    user = User.find(params[:id])
    trash = user.mailbox.trash

    trash.each do |conversation|
      conversation.receipts_for(user).update_all(:deleted => true)
    end


    redirect_to conversations_url
  end

  private

  def mailbox
    if current_user.present?
      @mailbox = current_user.mailbox
    elsif current_merchant_profile.present?
      @mailbox = current_merchant_profile.mailbox
    end
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end