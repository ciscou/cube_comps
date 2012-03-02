namespace :db do
  desc "Create some test data"
  task :populate => :environment do
    user = Factory :user, :email => "user@cubecomps.com"
    99.times { Factory :user }

    10.times { Factory :competition, :user => user }

    Competition.all.each do |competition|
      User.all.each do |user|
        Factory :entry, :competition => competition, :user => user if rand < 0.5
      end
      competition.categories.each do |category|
        Factory :event, :competition => competition, :category_code => category.code if competition.start_on.to_datetime.past?
      end
    end
  end
end
