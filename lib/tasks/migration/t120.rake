namespace :migration do
  task t120: :environment do

    Experience.destroy_all

    User.all.each do |user|
      user.orids.each do |orid|
        Experience.where(user_id: user.id, orid_id: orid.id, point: 50).first_or_create
      end
    end
  end
end
