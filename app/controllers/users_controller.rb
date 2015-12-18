class UsersController < ApplicationController
  
  before_filter :admin_only, :except => [:show,:edit]

  def index
    @users = User.employee_search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @page_title ="Employee Registration Form"
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true ) if @user == current_user
      redirect_to users_path, :flash => { :success => 'User was successfully updated.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  def import_user

    if User.import(params[:file]) != nil
      redirect_to new_user_path :flash => {:success => 'Data Uploaded successfully' }
    else
      redirect_to new_user_path :flash => {:success => 'Please select file to upload.' }
    end
    
  end

  def leave_card
     respond_to do |format|
        format.html
        format.pdf do
          pdf = CardPdf.new(params[:emp_id])
          emp_name = User.where(id: params[:emp_id]).first
          send_data pdf.render ,filename:"#{emp_name.name}_leave_card_Yaer_2015.pdf",type: "applcation/pdf"
        end
      end   
  end

  def sample_csv
    send_file "#{Rails.root}/app/assets/data/userdata.csv", :type=>"application/excel", :x_sendfile=>true    
  end

 
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me,:firstname,:middlename,:lastname,:role,:doj,:report_to1,:report_to2,:gender,:sl,:pl,:cl,:leave_start_date,:leave_end_date,:emp_code,:group,:branch,:unit,:department,:role)
  end
  
  def admin_only
    unless current_user.HRAdmin?
      redirect_to :back, :alert => "Access denied."
    end
  end

end