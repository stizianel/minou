class Timecode < ActiveRecord::Base
	has_many :timedays
	scope :prod, where(typo: 'P')
	scope :impro, where(typo: 'I')
end
