class Order < ActiveRecord::Base
  before_validation :generate_number, on: :create

  belongs_to :room
  belongs_to :admin_user, foreign_key: :user_id
  attr_accessible :state, :room, :room_id, :title, :user_id
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

  protected

  def generate_number
    if self.title.blank?
      record = true
      while record
        random = rand(1000).to_s.rjust(3, '0')
      end
      self.title = Time.now.strftime('%c') + random
    end
    self.title
  end
end
