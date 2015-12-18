class EmployeeMastersController < ApplicationController
  before_action :set_employee_master, only: [:show, :edit, :update, :destroy]

  # GET /employee_masters
  # GET /employee_masters.json
  def index
    @page_title ="Employee Master"
    @employee_masters = EmployeeMaster.all
  end

  # GET /employee_masters/1
  # GET /employee_masters/1.json
  def show
  end

  # GET /employee_masters/new
  def new
            @page_title ="Employee Registration Form"

    @employee_master = EmployeeMaster.new
  end

  # GET /employee_masters/1/edit
  def edit
  end

  # POST /employee_masters
  # POST /employee_masters.json
  def create

    @employee_master = EmployeeMaster.new(employee_master_params)

    respond_to do |format|
      if @employee_master.save
        format.html { redirect_to @employee_master, notice: 'Employee master was successfully created.' }
        format.json { render :show, status: :created, location: @employee_master }
      else
        format.html { render :new }
        format.json { render json: @employee_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_masters/1
  # PATCH/PUT /employee_masters/1.json
  def update
    respond_to do |format|
      if @employee_master.update(employee_master_params)
        format.html { redirect_to @employee_master, notice: 'Employee master was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_master }
      else
        format.html { render :edit }
        format.json { render json: @employee_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_masters/1
  # DELETE /employee_masters/1.json
  def destroy
    @employee_master.destroy
    respond_to do |format|
      format.html { redirect_to employee_masters_url, notice: 'Employee master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_master
      @employee_master = EmployeeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_master_params
      params.require(:employee_master).permit(:emp_code, :first_name, :middle_name, :last_name, :date_of_join, :gender, :leave_start_date, :leave_end_date, :yearly_alocated_sl, :yearly_alocated_pl, :yearly_alocated_cl, :group_id, :branch_id, :unit_id, :department_id, :avaiable_sl, :available_pl, :avaiable_cl)
    end
end
