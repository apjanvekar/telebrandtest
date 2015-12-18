require 'test_helper'

class EmployeeMastersControllerTest < ActionController::TestCase
  setup do
    @employee_master = employee_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_master" do
    assert_difference('EmployeeMaster.count') do
      post :create, employee_master: { avaiable_cl: @employee_master.avaiable_cl, avaiable_sl: @employee_master.avaiable_sl, available_pl: @employee_master.available_pl, branch_id: @employee_master.branch_id, date_of_join: @employee_master.date_of_join, department_id: @employee_master.department_id, emp_code: @employee_master.emp_code, first_name: @employee_master.first_name, gender: @employee_master.gender, group_id: @employee_master.group_id, last_name: @employee_master.last_name, leave_end_date: @employee_master.leave_end_date, leave_start_date: @employee_master.leave_start_date, middle_name: @employee_master.middle_name, unit_id: @employee_master.unit_id, yearly_alocated_cl: @employee_master.yearly_alocated_cl, yearly_alocated_pl: @employee_master.yearly_alocated_pl, yearly_alocated_sl: @employee_master.yearly_alocated_sl }
    end

    assert_redirected_to employee_master_path(assigns(:employee_master))
  end

  test "should show employee_master" do
    get :show, id: @employee_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_master
    assert_response :success
  end

  test "should update employee_master" do
    patch :update, id: @employee_master, employee_master: { avaiable_cl: @employee_master.avaiable_cl, avaiable_sl: @employee_master.avaiable_sl, available_pl: @employee_master.available_pl, branch_id: @employee_master.branch_id, date_of_join: @employee_master.date_of_join, department_id: @employee_master.department_id, emp_code: @employee_master.emp_code, first_name: @employee_master.first_name, gender: @employee_master.gender, group_id: @employee_master.group_id, last_name: @employee_master.last_name, leave_end_date: @employee_master.leave_end_date, leave_start_date: @employee_master.leave_start_date, middle_name: @employee_master.middle_name, unit_id: @employee_master.unit_id, yearly_alocated_cl: @employee_master.yearly_alocated_cl, yearly_alocated_pl: @employee_master.yearly_alocated_pl, yearly_alocated_sl: @employee_master.yearly_alocated_sl }
    assert_redirected_to employee_master_path(assigns(:employee_master))
  end

  test "should destroy employee_master" do
    assert_difference('EmployeeMaster.count', -1) do
      delete :destroy, id: @employee_master
    end

    assert_redirected_to employee_masters_path
  end
end
