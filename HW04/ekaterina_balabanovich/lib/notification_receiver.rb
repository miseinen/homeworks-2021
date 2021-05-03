# frozen_string_literal: true

module NotificationReceiver
  attr_reader :notifications

  def get_notifications(notification)
    @notifications << notification
  end

  def mark_as_read!
    @notifications.clear
  end
end
