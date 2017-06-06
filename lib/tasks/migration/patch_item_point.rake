namespace :migration do
  task patch_item_point: :environment do
    BuyRecord.update_all(point: 50)
  end
end
