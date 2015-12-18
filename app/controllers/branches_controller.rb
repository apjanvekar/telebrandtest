class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  def index
    @page_title ="Branch List"
    @branches = Branch.search_branch(params[:search])
  end

  def show
  end

  def new
    @page_title ="Add Branch"
    @branch = Branch.new
  end

  def edit
        @page_title ="Edit Branch"

  end

  def create
    @branches = Branch.all
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_path, notice: 'Branch was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     @branches = Branch.all
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branches_path, notice: 'Branch was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
     @branches = Branch.all
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.js {}
    end
  end

  private
     def set_branch
      @branch = Branch.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit(:branch_name)
    end
end
