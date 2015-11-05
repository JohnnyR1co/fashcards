desc "send digest email"
task send_reminders: :environment do
  Card.notify_cards
end
