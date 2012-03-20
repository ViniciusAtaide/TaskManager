class Task < ActiveRecord::Base
	attr_accessible :name, :done

	validates_uniqueness_of :name
	validates_presence_of :name
end
