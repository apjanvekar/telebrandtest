json.array!(@employee_masters) do |employee_master|
  json.extract! employee_master, :id, :emp_code, :first_name, :middle_name, :last_name, :date_of_join, :gender, :leave_start_date, :leave_end_date, :yearly_alocated_sl, :yearly_alocated_pl, :yearly_alocated_cl, :group_id, :branch_id, :unit_id, :department_id, :avaiable_sl, :available_pl, :avaiable_cl
  json.url employee_master_url(employee_master, format: :json)
end
