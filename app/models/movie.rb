class Movie < ApplicationRecord
	scope :search_by_actor_name, ->(actor_name) { where('actor LIKE ?', "%#{actor_name}%") }
	ratyrate_rateable 'review'
end
