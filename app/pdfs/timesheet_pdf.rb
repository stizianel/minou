class TimesheetPdf < Prawn::Document

  def initialize(timesheet)
  	super()
  	@timesheet = timesheet
  	timesheet_header
  	timesheet_body
  end

  def timesheet_header
  	text "Mese di #{@timesheet.mese} #{@timesheet.year} #{@timesheet.user.name}", size: 22, style: :bold
  end

  def timesheet_body
  	move_down 20
  	table timedays_rows do
  		row(0).font_style = :bold
  		columns(1..3).align = :right
  		self.row_colors = ["DDDDDD", "FFFFFF"]
  		self.header = true
  	end
  end

  def timedays_rows
  	[["day", "code1", "hour1", "code2", "hour2", "note"]] +
  	@timesheet.timedays.order(:day).map do |item|
  		[item.giorno + ' ' + item.day.strftime("%d/%m/%Y"), item.code1, item.hour1, item.code2, item.hour2, item.note]
  	end
  end
end