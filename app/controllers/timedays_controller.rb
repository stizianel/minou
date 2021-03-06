class TimedaysController < ApplicationController
  before_action :set_timeday, only: [:show, :edit, :update, :destroy]

  # GET /timedays
  # GET /timedays.json
 
  def index
    current_date = Date.today
    @stefa = Timesheet.find_by id: params[:foglio]
    @timedays = @stefa.timedays.where("day <= ?",current_date).order(:day)
    #@timeday1 = @stefa.timedays.order(:day)
    #@timedays = @timeday1.where(:timedays.day <= ?", current_day)
  end

  # GET /timedays/1
  # GET /timedays/1.json
  def show
  end

  # GET /timedays/new
  def new
    @timeday = Timeday.new
  end

  # GET /timedays/1/edit
  def edit
  end

  # POST /timedays
  # POST /timedays.json
  def create
    @timeday = Timeday.new(timeday_params)

    respond_to do |format|
      if @timeday.save
        format.html { redirect_to @timeday, notice: 'Timeday was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timeday }
      else
        format.html { render action: 'new' }
        format.json { render json: @timeday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timedays/1
  # PATCH/PUT /timedays/1.json
  def update
    respond_to do |format|
      if @timeday.update(timeday_params)
        #format.html { redirect_to @timeday , notice: 'Timeday was successfully updated.' }
        format.html { redirect_to controller: "timedays", action: "index", foglio: @timeday.timesheet_id }
        #format.html { redirect_to timedays_url, params[:foglio] => @timeday.timesheet_id}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timeday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timedays/1
  # DELETE /timedays/1.json
  def destroy
    @timeday.destroy
    respond_to do |format|
      format.html { redirect_to timedays_url }
      format.json { head :no_content }
    end
  end
  
  def statistics
    @ore = Timeday.find_by_sql("select nome, year, month, descri, sum(ore)
            from (
            select user_id, year, month, code1 cod, hour1 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
            where a.timesheet_id = b.id and code1 is not null and b.user_id = u.id and a.code1 = t.id
            union
            select user_id, year, month, code2 cod, hour2 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
            where a.timesheet_id = b.id and code2 is not null and b.user_id = u.id and a.code1 = t.id
            union
            select user_id, year, month, code3 cod, hour3 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
            where a.timesheet_id = b.id and code3 is not null and b.user_id = u.id and a.code1 = t.id
            union
            select user_id, year, month, code4 cod, hour4 ore, u.name nome, t.descr descri from timedays a, timesheets b, users u, timecodes t
            where a.timesheet_id = b.id and code4 is not null and b.user_id = u.id and a.code1 = t.id
            ) as foo
            group by nome, year, month, descri
            order by nome, year, month, descri")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeday
      @timeday = Timeday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeday_params
      params.require(:timeday).permit(:day, :code1, :hour1, :code2, :hour2, :code3, :hour3, :code4, :hour4, :timesheet_id, :note, :cust1, :cust2, :cust3, :cust4, :km1, :km2, :km3, :km4)
    end
end
