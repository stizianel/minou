class Timeday < ActiveRecord::Base
	belongs_to :timesheet
	belongs_to :codice1, class_name: 'Timecode', foreign_key: 'code1'
	belongs_to :codice2, class_name: 'Timecode', foreign_key: 'code2'
	belongs_to :codice3, class_name: 'Timecode', foreign_key: 'code3'

	def codici
		[codice1, codice2, codice3]
	end

	def giorno
	  	res = case self.day.wday
	  	when 0 then "dom"
	  	when 1 then "lun"
	  	when 2 then "mar"
	  	when 3 then "mer"
	  	when 4 then "gio"
	  	when 5 then "ven"
	  	when 6 then "sab"
	  	else "giorno"
	  	end
  	end	
end
