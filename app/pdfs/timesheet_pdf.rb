class TimesheetPdf < Prawn::Document

  def initialize(timesheet)
  	super()
  	@timesheet = timesheet
  	timesheet_header
  	timesheet_body
    timesheet_summary_header
    timesheet_summary
  end

  def timesheet_header
  	text "Mese di #{@timesheet.mese} #{@timesheet.year} #{@timesheet.user.name}", size: 22, style: :bold
  end

  def timesheet_summary_header
    move_down 20
    text "Riepilogo ore per causale", size: 12, style: :bold
  end

  def timesheet_body
  	move_down 20
    font_size 8
  	#table timedays_rows do
  	#	row(0).font_style = :bold
  	#	columns(1..3).align = :right
  	#	self.row_colors = ["DDDDDD", "FFFFFF"]
    # 	self.header = true
    table timedays_rows, :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 6}
  	#end
  end

  def timedays_rows
  	[["data", "causale1", "ore1", "km1", "causale2", "ore2", "km2", "causale3", "ore3", "km3", "causale4", 
      "ore4", "km4", "note"]] +
  	@timesheet.timedays.order(:day).map do |item|
  		[item.giorno + ' ' + item.day.strftime("%d/%m/%Y"), item.descr1, item.hour1, item.km1, item.descr2, 
        item.hour2, item.km2, item.descr3, item.hour3, item.km3, item.descr4, item.hour4, item.km4, item.note]
  	end
  end

  def timesheet_summary
    move_down 20
    font_size 8
    table timesheet_summary_rows, :cell_style => { :overflow => :shrink_to_fit, :min_font_size => 6} do
      row(0).font_style = :bold
      self.header = true
    end
  
  end
  def timesheet_summary_rows
    [["causale", "ore"]] +
    Timesheet.totali(@timesheet.id).map do |item|
      [item[3], item[4]]
    end
  end
end