namespace :db do
  desc "Create some test data"
  task :populate => :environment do
    if Rails.env.production?
      FactoryGirl.definition_file_paths << Rails.root.join('test/factories')
      FactoryGirl.find_definitions
    end

    user = Factory :user, :email => "user@cubecomps.com"
    99.times { Factory :user }

    10.times { Factory :competition, :user => user }

    Competition.all.each do |competition|
      User.all.each do |user|
        Factory :entry, :competition => competition, :user => user if rand < 0.5
      end
      competition.categories.each do |category|
        if competition.start_on.to_datetime.past?
          entries_count = competition.entries.with_category(category.code).count
          rounds_count = if entries_count > 50 then 3
                      elsif entries_count > 30 then 2
                       else                         1
                        end
          event = Factory :event, :competition => competition, :category_code => category.code, :rounds_count => rounds_count
          event.rounds.each do |round|
            round.groups_count = [1, rounds_count - round.number + 1].max
            round.entries_count = [200, 24, 12].at(round.number - 1)
            round.save!
          end
          event.results.each do |result|
            result.update_attributes! Factory.attributes_for(:result)
          end
        end
      end
    end
  end
end
