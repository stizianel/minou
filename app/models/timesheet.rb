class Timesheet < ActiveRecord::Base
  belongs_to :user
  has_many   :timedays, dependent: :destroy 

  def mese
  	res = case self.month 
	  	when 1 then	"Gennaio"
	  	when 2 then	"Febbraio"
	  	when 3 then	"Marzo"
	  	when 4 then	"Aprile"
	  	when 5 then	"Maggio"
	  	when 6 then	"Giugno"
	  	when 7 then	"Luglio"
	  	when 8 then	"Agosto"
	  	when 9 then	"Settembre"
	  	when 10 then "Ottobre"
	  	when 11 then "Novembre"
	  	when 12 then "Dicembre"
	  	else "Mese"
  	end
  end

end
