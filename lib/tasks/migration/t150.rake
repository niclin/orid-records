namespace :migration do
  task t150: :environment do
      Orid.all.each do |orid|
        orid.comments.each do |comment|
          orid.watchers.each do |user|
          if user != orid.user
            Notification.create(recipient: user , actor: orid.user, action: "create", notifiable: comment )
          end
        end
    end
    end
  end
end
