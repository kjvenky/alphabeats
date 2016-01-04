class Album < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
end
