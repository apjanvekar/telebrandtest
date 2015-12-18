class ReportsController < ApplicationController
	
	def hrsection
	end
	
	def general_report
		
		sd  = Date.civil(params[:report]["start_date(1i)"].to_i,params[:report]["start_date(2i)"].to_i,params[:report]["start_date(3i)"].to_i).strftime("%Y-%m-%d")
		ed =  Date.civil(params[:report]["end_date(1i)"].to_i,params[:report]["end_date(2i)"].to_i,params[:report]["end_date(3i)"].to_i).strftime("%Y-%m/%d")

		@leave_data = LeaveMaster.select("start_date","end_date","no_of_leave_days","remark_date","user_id","leave_type").where("start_date between (?) and (?) ",sd,ed)

	 	
	 	pdf = Prawn::Document.new(:page_size => 'A4',:page_layout => :landscape)
		 	pdf.font "Helvetica"

			pdf.text "All Employee Leave Summary", :style => :bold_italic
			pdf.move_down 5
			pdf.stroke_horizontal_rule

			pdf.move_down 10

			items = [["Employee Name","Start Date", "End Date", "No Of Days","Leave Type","Approved Date"]]

			items += @leave_data.each_with_index.map do |item, i|
  						[
    							 User.where("id"=>item[:user_id]).first.name,
    							item[:start_date],
    							item[:end_date],
    							item[:no_of_leave_days],
    							item[:leave_type],
    							item[:remark_date],

  						]
			end
			
			pdf.move_down 20
			pdf.table items, :header => true, 
		  		:column_widths => {0 => 110,1 => 90,2 => 80,3 => 90,4 => 90,5 => 120}, :row_colors => ["d2e3ed", "FFFFFF"] do
		    	style(columns(5)) {|x| x.align = :right }
			end

			
  			filename = "x.pdf"
  			pdf.render_file filename
  			send_file filename, :filename => "x.pdf", :type => "application/pdf"
		
	end


	def emp_leave_card
		p "------------------->>>>>>>>"
		p params[:emp_id]
		p "------------------->>>>>>>>"
	end



end
