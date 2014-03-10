class Timeday < ActiveRecord::Base
	belongs_to :timesheet
	belongs_to :codice1, class_name: 'Timecode', foreign_key: 'code1'
	belongs_to :codice2, class_name: 'Timecode', foreign_key: 'code2'
	belongs_to :codice3, class_name: 'Timecode', foreign_key: 'code3'
	belongs_to :cliente1, class_name: 'Customer', foreign_key: 'cust1'
	belongs_to :cliente2, class_name: 'Customer', foreign_key: 'cust2'
	belongs_to :cliente3, class_name: 'Customer', foreign_key: 'cust3'


	validates_presence_of :code1, :message => "inserire il codice", if: :hour1_p
	validates_presence_of :code2, :message => "inserire il codice", if: :hour2_p
	validates_presence_of :code3, :message => "inserire il codice", if: :hour3_p

	def hour1_p
		self.hour1?
	end

	def hour2_p
		self.hour2?
	end

	def hour3_p
		self.hour3?
	end

	def codici
		[codice1, codice2, codice3]
	end

	def clienti
		[cliente1, cliente2, cliente3]
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
