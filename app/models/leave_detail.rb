class LeaveDetail
  include Mongoid::Document
  belongs_to :user
  
  field :year,            type: Integer
  field :available_leave,     type: Hash, default: {:Sick => 0, :Casual => 0, :Paid => 0}

  
  def validate_leave(name, number_of_day)
    ((self.available_leave[name] - number_of_day) > 1).blank? ? true: false          
  end
  
  def deduct_available_leave(leave_type: "Sick", no_of_leave: 1)
    self.available_leave[leave_type] = self.available_leave[leave_type] - no_of_leave
    self.save 
  end 
end
