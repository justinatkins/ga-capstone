class Band < ActiveRecord::Base
	belongs_to :user
	has_many :guitarists
end