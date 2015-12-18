class AdddoctorcertToleavemaster < ActiveRecord::Migration
  def change
  	add_attachment :leave_masters, :doctorcert,:image  
  end
end
