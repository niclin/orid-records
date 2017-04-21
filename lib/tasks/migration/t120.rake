namespace :migration do
  task t120: :environment do
    User.all.each do |user|
      user.orids.each do |orid|
        Experience.where(user_id: user.id, orid_id: orid.id).first_or_create
      end
    end
  end
end
