# coding: utf-8
ActiveAdmin.register Order do  
  menu :label => proc{ I18n.t("order") }

  #filter :"room" , :as => :select, :collection => Room.order(:room_no).map(&:room_no)
  filter :state, as: :select, :collection => [['in_process', 'in_process'], ['denied', 'denied'], ['complete', 'complete']]
  filter :admin_user
  index do
    selectable_column
    column :id
    column :staff do |order|
      order.admin_user.email unless order.admin_user.nil?
    end
    column :building, :sortable => false
    column :room
    column :confirm do |order|
      if order.state == "in_process"
        link_to t('确认'), confirm_admin_order_path(order), :method => :put,:class => 'button' 
      end
    end
    column :unconfirm do |order|
      if order.state == "in_process"
        link_to t('驳回'), unconfirm_admin_order_path(order), :method => :put,:class => 'button' 
      end
    end
    column(:state, :sortable)  do |order|
      status_tag(order.state)
      # link_to t(order.state), unconfirm_admin_order_path(order), :method => :put,:class => 'button'
    end
    #default_actions
  end

  # order: in_process => complete   confirm
  # room:  orderd     => sold_out   sold
  member_action :confirm, :method => :put do
    order = Order.find(params[:id])
    order.confirm
    order.room.order
    Order.where(:room_id => order.room.id).each do |o|
      if o.state == "in_process" and o.id != order.id
        o.delete
      end
    end
    redirect_to  admin_orders_path
  end

  # order: in_process => denied     unconfirm
  # room:  ordered    => on_sale    unorder
  member_action :unconfirm, :method => :put do
    order = Order.find(params[:id])
    order.room.unorder
    order.delete
    redirect_to  admin_orders_path
  end
end
