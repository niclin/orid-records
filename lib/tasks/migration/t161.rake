namespace :migration do
  task t161: :environment do
    Notification.where(actor_id: 7).destroy_all
  end
end
