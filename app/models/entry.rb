class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition
end
