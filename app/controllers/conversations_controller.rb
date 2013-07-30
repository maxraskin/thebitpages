class ConversationsController < ApplicationController
  helper_method :mailbox, :conversation

  def index
    if current_user.present?
      gon.current_user = current_user
    elsif current_merchant_profile.present?
      gon.current_user = current_merchant_profile
    end
  end

  def new
    @potential_recipients = []
    User.all.each do |user|
      @potential_recipients << user.email
    end 

    MerchantProfile.all.each do |merchant|
      @potential_recipients << merchant.email
    end
  end

  def create
    recipient_email = conversation_params(:recipients).split(',')
    recipients = User.where(email: recipient_email).all
    recipients = MerchantProfile.where(email: recipient_email).all  if recipients.empty?

    if current_merchant_profile.present?
      conversation = current_merchant_profile.
        send_message(recipients, *conversation_params(:body, :subject)).conversation
    elsif current_user.present?
      conversation = current_user.
        send_message(recipients, *conversation_params(:body, :subject)).conversation
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