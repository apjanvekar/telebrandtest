# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(:email=>"admin@gmail.com", :password=>"admin@123", :password_confirmation=>"admin@123", 
			:remember_me=>"",:firstname=>"Kiran",:middlename=>"J",:lastname=>"Jadhav",:role=>0,
			:doj=>"2015-04-21",
			:report_to1=>1,
			:report_to2=>1,
			:gender=>0,
			:sl=>10,
			:pl=>30,
			:cl=>10,
			:leave_start_date=>"2016-01-01",
			:leave_end_date=>"2016-12-31",
			:emp_code=>"1144",
			:group=>"testgroup",
			:branch=>"testbranch",
			:unit=>"Testunit",
			:department=>"testdepartment"
			)
