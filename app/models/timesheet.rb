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

  def self.totali(i_id)
  	sql = "select nome, year, month, descri, sum(ore)
				from (
				select user_id, year, month, code1 cod, hour1 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
				where a.timesheet_id = b.id and code1 is not null and b.user_id = u.id and a.code1 = t.id
				and b.id = #{i_id}
				union all
				select user_id, year, month, code2 cod, hour2 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
				where a.timesheet_id = b.id and code2 is not null and b.user_id = u.id and a.code2 = t.id
				and b.id = #{i_id}
				union all
				select user_id, year, month, code3 cod, hour3 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
				where a.timesheet_id = b.id and code3 is not null and b.user_id = u.id and a.code3 = t.id
				and b.id = #{i_id}
				union all
				select user_id, year, month, code4 cod, hour4 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
				where a.timesheet_id = b.id and code4 is not null and b.user_id = u.id and a.code4 = t.id
				and b.id = #{i_id}
				) as foo
				group by nome, year, month, descri
				order by nome, year, month, descri"
  	connection.select_rows(sql)
  end
end
