Rails.application.routes.draw do
  resources :units,:departments,:branches,:groups
  
  resources :users do 
    collection do
      post "/upload_employee" => "users#import_user" ,:as=> :import_data
      get 'users/sample_csv'=>"users#sample_csv"
    end
  end

  devise_for :users, :skip => [:sessions]
  
	as :user do
      root :to => 'devise/sessions#new',:as => :new_user_session
    	post "/login" => "devise/sessions#create", :as => :user_session
    	delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  get "/mypage"=>"home#test1",:as=>:home_test1
  get "/basic_setting"=>"home#settings",:as=>:admin_setting
  get "/leave_application"=>"leave#appleave",:as=>:apply_leave
  get "/leave_summary"=>"leave#summary",:as=>:leave_summary
  get "/all_request"=>"leave#pending_request",:as=>:myrequest
  get '/approve'=>"leave#approve_leave",:as=>:approve_leave
  get "leave/:id/reject_leave" => "leave#reject_leave", :as => :reject_leave ##member routes
  get '/response'=>"leave#approvals",:as=>:my_approvals  
  get '/my_request'=>"leave#myrequest",:as=>:all_request
  get '/month_preview'=>"leave#monthview",:as=>:calender_view
  post "/submit_leave"=>"leave#create_leave",:as=>:leave_masters
  get "/test_report"=>"reports#hrsection",:as=>:hr_report
  post "1streport"=>"reports#general_report",:as=>:overall
  get "leave_card"=>"users#leave_card",:as=>:leave_card
  post "reject_reason"=>"leave#save_reject_reason",:as=>:register_rejection
  get "/myleavecard"=>"leave#userwise_card",:as=>:user_card
  post "/changeuser"=>"leave#swift_user",:as=>:manager_to_employee_login ### for swiift user
end
  