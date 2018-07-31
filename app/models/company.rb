class Company < ApplicationRecord
	has_many :values
	has_many :users, :through => :values
end
