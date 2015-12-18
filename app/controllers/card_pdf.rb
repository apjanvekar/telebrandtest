class CardPdf < Prawn::Document

  def initialize(empid)
  	super(top_margin: 50,
  		:page_layout=>:landscape,
  		:page_size=> "A4"	)
   		line_items(empid)
  end

	def line_items(empid)
		move_down 20
		text "Leave Card For Year--#{Time.now.strftime("%Y")}",:align=>:center
		table line_items_rows(empid)
	end

  def line_items_rows(empid)
  			udata = User.where(id: empid).first
  			@leave_data = LeaveMaster.where(user_id: empid).all
   	 		[[{:content=>"T_No",:colspan=>2},
		 	    {:content=>"Name and address",:colspan=>4},
		 	    {:content=>"Address Whilst on leave",:colspan=>3},
		 	    {:content=>"Department",:colspan=>4},
		 	    {:content=>"Designation",:colspan=>3},
		 	    {:content=>"Date of entry into service",:colspan=>1}],
		 	    [{:content=>"#{udata.emp_code}",:colspan=>2},{:content=>"#{udata.name}",:colspan=>4},{:content=>"Thane",:colspan=>3},{:content=>"#{udata.department}",:colspan=>4},{:content=>"Sr.Programmer",:colspan=>3},{:content=>"#{udata.doj}",:colspan=>1}],
		 		[{:content=>"Date",:rowspan=>2},{:content=>"Type Of Leave",:rowspan=>2},
		 		{:content=>"Leave Required",:rowspan=>1,:colspan=>3},
		 		{:content=>"Reason For Leave",:rowspan=>2},{:content=>"signature Of Applicant ",:rowspan=>2},
		 		{:content=>"Signature",:rowspan=>1,:colspan=>2},
		 		{:content=>"Leave Due",:rowspan=>1,:colspan=>3},
		 		{:content=>"Unpaid Leave",:rowspan=>2},{:content=>"Absent",:rowspan=>2},
				{:content=>"Short Leave",:rowspan=>2},{:content=>"Remark",:rowspan=>2},
		 		{:content=>"Signature Personal Dept.",:rowspan=>2}],
		 		["No.of days","Form","To","Dep.Head","GM","P/L#{udata.pl}","C/L#{udata.cl}","S/L#{udata.sl}"]]+
  	  			@leave_data.map do |card|

  	  				if card.leave_type =="SL"

  	  				elsif card.leave_type =="SL"

  	  				else

  	  				end	

  	  				[card.remark_date,card.leave_type,actual_days(card.no_of_leave_days,card.no_of_holiday),card.start_date,card.end_date,"","","","",chk_remaining_Pl_leave(card.no_of_leave_days,card.no_of_holiday,udata.pl),chk_remaining_cl_leave(card.no_of_leave_days,card.no_of_holiday,udata.cl),udata.presentsl,"","","","",""]	
  	 			end
	 end

	 def actual_days(apply_days,holiday)
	 	if apply_days==0
	 		return 0.5
	 	else
	 		return (apply_days-holiday)
	 	end	
	 end

	 def chk_remaining_Pl_leave(apply_days,holiday,actual_pl)
	 	actual_pl_days = (apply_days-holiday)
	 	return (actual_pl - actual_pl_days)
	 end

	 def chk_remaining_cl_leave(apply_days,holiday,actual_cl)
	 	actual_cl_days = (apply_days-holiday)
	 	return (actual_cl - actual_cl_days)
	 end
end
