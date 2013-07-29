class MessagesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def index
  end

  def create
  end

  def reply
  end

  def trash
  end

  def untrash
  end
end
