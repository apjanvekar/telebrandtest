class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable,:authentication_keys => [:emp_code]
	enum role: [:HRAdmin, :ImmediateManager, :Manager,:Employee]
	enum gender: [:Male, :Female]
	
	#after_initialize :set_default_role, :if => :new_record?
  
  after_create :set_actual_leave

  def self.employee_search(employee_code)
    if employee_code
      where(emp_code: employee_code)
    else
      all
    end

  end


  def set_actual_leave
    self.presentsl = self.sl
    self.presentcl = self.cl
    self.presentpl = self.pl
  end

  # def set_default_role
  #   self.role ||= :Employee
  # end

  def name
    "Mr.#{firstname} #{lastname}"
  end
  
  def minus_leave(ltype,no_of_days,uid,rid)
     f = User.find(uid)
     chk_for_half_day = LeaveMaster.where(id: rid).first.half_day


     if ltype == "SL"
            if f.presentsl ==0
              if chk_for_half_day == "1"
                  final_leave = (no_of_days).to_f + 0.5
               else
                  final_leave = (no_of_days).to_f
               end
              
            else
             if chk_for_half_day == "1"
                 final_leave = ((f.presentsl).to_f + (no_of_days).to_f + 0.5)
              else
                final_leave = (f.presentsl).to_f + (no_of_days).to_f  
              end
            end
        colname = "presentsl"

     elsif ltype=="PL"
            if f.presentpl ==0
              if chk_for_half_day == "1"
                   final_leave = (no_of_days).to_f + 0.5
               else
                  final_leave =  (no_of_days).to_f
               end
              
            else
              if chk_for_half_day == "1"
                final_leave = (f.presentpl).to_f + ((no_of_days).to_f + 0.5)
              else
                final_leave = (f.presentpl).to_f + (no_of_days).to_f  
              end
            end
        colname = "presentpl"    

     elsif ltype == "CL"
            if f.presentcl ==0
              if chk_for_half_day == "1"
                  final_leave = (no_of_days).to_f + 0.5
               else
                  final_leave = (no_of_days).to_f
               end
              
            else
              if chk_for_half_day == "1"
                final_leave = (f.presentcl).to_f + ((no_of_days).to_f + 0.5)
              else
                final_leave = (f.presentcl).to_f + (no_of_days).to_f  
              end
            end
        colname = "presentcl"    
      end

      User.update(f.id,colname=>final_leave)
        
  end 
  
  def self.import(file)
     if !file.blank?
        CSV.foreach(file.path,:headers=>true) do |row|
           User.create! row.to_hash
        end
        return true
      else  
        return nil
      end  

   end


end


