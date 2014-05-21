class Order < ActiveRecord::Base
  belongs_to :room
  belongs_to :admin_user, foreign_key: :user_id
  attr_accessible :state, :room, :room_id, :title, :user_id
  accepts_nested_attributes_for :room

  validates :room_id, :uniqueness => {:scope => :user_id}  
  
  # accepts_nested_attributes_for :room
  state_machine :initial => :in_process do #定义初始状态为in_process
    event :confirm do #定义confirm事件，让状态从in_process到complete
      transition :in_process => :complete
    end
    
    event :unconfirm do #定义unconfirm事件，让状态从in_process到Failed
      transition :in_process => :denied
    end
  end
end
