class TimesheetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /timesheets
  # GET /timesheets.json
  def index
    if current_user.admin?
      @timesheets = Timesheet.all.order(:year, :month)
    else
      @timesheets = Timesheet.where(user_id: current_user.id)
    end
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.new(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timesheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_params
      params.require(:timesheet).permit(:year, :month, :status, :user_id)
    end
end