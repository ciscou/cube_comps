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
        if competition.start_on.to_datetime.past?
          event = Factory :event, :competition => competition, :category_code => category.code
          event.results.each do |result|
            result.update_attributes! Factory.attributes_for(:result)
          end
        end
      end
    end
  end
end
