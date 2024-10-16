class ClassStatusesController < ApplicationController
  before_action :set_class_status, only: [:show, :edit, :update, :destroy]

  # GET /class_statuses
  # GET /class_statuses.json
  def index
    @class_statuses = ClassStatus.all
  end

  # GET /class_statuses/1
  # GET /class_statuses/1.json
  def show
  end

  # GET /class_statuses/new
  def new
    @class_status = ClassStatus.new
  end

  # GET /class_statuses/1/edit
  def edit
  end

  # POST /class_statuses
  # POST /class_statuses.json
  def create
    @class_status = ClassStatus.new(class_status_params)

    respond_to do |format|
      if @class_status.save
        format.html { redirect_to @class_status, notice: '강의 신청이 완료되었습니다.' }
        format.json { render :show, status: :created, location: @class_status }
      else
        format.html { render :new }
        format.json { render json: @class_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_statuses/1
  # PATCH/PUT /class_statuses/1.json
  def update
    respond_to do |format|
      if @class_status.update(class_status_params)
        format.html { redirect_to @class_status, notice: 'Class status was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_status }
      else
        format.html { render :edit }
        format.json { render json: @class_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_statuses/1
  # DELETE /class_statuses/1.json
  def destroy
    @class_status.destroy
    respond_to do |format|
      format.html { redirect_to class_statuses_url, notice: 'Class status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_status
      @class_status = ClassStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_status_params
      params.require(:class_status).permit(:user_id, :class_list_id)
    end
end
