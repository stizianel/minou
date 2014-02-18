class Timeday < ActiveRecord::Base
	belongs_to :timesheet
	belongs_to :codice1, class_name: 'Timecode', foreign_key: 'code1'
	belongs_to :codice2, class_name: 'Timecode', foreign_key: 'code2'
	belongs_to :codice3, class_name: 'Timecode', foreign_key: 'code3'

	def codici
		[codice1, codice2, codice3]
	end
end
