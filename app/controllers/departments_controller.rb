class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
   @page_title ="Department List"
   @departments = Department.search_dept(params[:search])
  end

  def show
  end

  def new
    @page_title ="Add Department"

    @department = Department.new
  end

  def edit
    @page_title ="Edit Department"
  end

  def create
    @departments = Department.all
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_path, notice: 'Department was successfully created.' }
      else
        format.html { render :new }
        #format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @departments = Department.all
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to departments_path, notice: 'Department was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @departments = Department.all
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.js {}
    end
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:department_name)
    end
end
