class Order < ActiveRecord::Base
  delegate :building, :to => :room, :allow_nil => true
  belongs_to :room
  belongs_to :admin_user, foreign_key: :user_id
  attr_accessible :state, :room, :room_id, :title, :user_id
  accepts_nested_attributes_for :room

  validates :room_id, :uniqueness => {:scope => :user_id}
  validates :room, :presence => true
  validates :admin_user, :presence => true

  # when create a order, the state of room associated turn to orderd
  after_create :change_the_room_state
  
  state_machine :initial => :in_process do #定义初始状态为in_process
    event :confirm do #定义confirm事件，让状态从in_process到complete
      transition :in_process => :complete
    end
    
    event :deny do #定义deny事件，让状态从in_process到denied
      transition :in_process => :denied
    end
  end

  private
    #change the room state after ordered
    def change_the_room_state
      room.order
    end
end
