class Order < ActiveRecord::Base
  belongs_to :room
  attr_accessible :state, :room, :room_id, :orders
  accepts_nested_attributes_for :room
  # accepts_nested_attributes_for :room
  state_machine :initial => :in_process do #定义初始状态为in_process
    event :confirm do #定义confirm事件，让状态从in_process到complete
      transition :in_process => :complete
    end
    event :unconfirm do #定义unconfirm事件，让状态从in_process到Failed
      transition :in_process => :Failed
    end
  end
end
