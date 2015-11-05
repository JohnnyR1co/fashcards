desc "send digest email"
task send_reminders: :environment do
  NotificationMailer.pending_cards.deliver!
end
