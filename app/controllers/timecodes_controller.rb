class TimecodesController < ApplicationController
  before_action :set_timecode, only: [:show, :edit, :update, :destroy]

  # GET /timecodes
  # GET /timecodes.json
  def index
    @timecodes = Timecode.all.order(:descr)
  end

  # GET /timecodes/1
  # GET /timecodes/1.json
  def show
  end

  # GET /timecodes/new
  def new
    @timecode = Timecode.new
  end

  # GET /timecodes/1/edit
  def edit
    @timecodes = Timecode.all
  end

  # POST /timecodes
  # POST /timecodes.json
  def create
    @timecode = Timecode.new(timecode_params)

    respond_to do |format|
      if @timecode.save
        format.html { redirect_to @timecode, notice: 'Timecode was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timecode }
      else
        format.html { render action: 'new' }
        format.json { render json: @timecode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timecodes/1
  # PATCH/PUT /timecodes/1.json
  def update
    respond_to do |format|
      if @timecode.update(timecode_params)
        format.html { redirect_to @timecode, notice: 'Timecode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timecode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timecodes/1
  # DELETE /timecodes/1.json
  def destroy
    @timecode.destroy
    respond_to do |format|
      format.html { redirect_to timecodes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timecode
      @timecode = Timecode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timecode_params
      params.require(:timecode).permit(:descr, :typo)
    end
end
