# coding: utf-8
ActiveAdmin.register Order do  
  menu :label => proc{ I18n.t("order") }


  #filter :"room" , :as => :select, :collection => Room.order(:room_no).map(&:room_no)
  filter :state, as: :select, :collection => [['进行中', 'in_process'], ['否决', 'denied'], ['完成', 'complete']]
  filter :admin_user

  # page of index
  index :download_links => false do
    selectable_column
    column :id
    column :staff do |order|
      order.admin_user.name unless order.admin_user.nil?
    end
    column :building, :sortable => false
    column :room
    if can? :destroy, Order
      column :confirm do |order|
        if order.state == "in_process"
          link_to t('confirm'), confirm_order_admin_order_path(order), :method => :put,:class => 'button' 
        end
      end
      column :deny do |order|
        if order.state == "in_process"
          link_to t('deny'), deny_order_admin_order_path(order), :method => :put,:class => 'button' 
        end
      end
    end
    column(:state, :sortable)  do |order|
      if order.state == "in_process"
        status_tag(t(order.state))
      else
        status_tag(t(order.state), :ok)
      end
    end
  end

  # page of new and edit
  form do |f|
    f.inputs t('order') do
      f.input :title
      f.input :room
      f.input :admin_user
    end
    f.actions
  end

  # order: in_process => complete   confirm
  # room:  orderd     => sold_out   sold
  member_action :confirm_order, :method => :put do
    order = Order.find(params[:id])
    order.confirm
    order.room.sold
    Order.where(:room_id => order.room.id).each do |o|
      if o.state == "in_process" and o.id != order.id
        # o.delete
        # Maybe deny the other orders is better
        o.deny
      end
    end
    redirect_to  admin_orders_path
  end

  # order: in_process => denied     deny
  # room:  ordered    => on_sale    unorder
  member_action :deny_order, :method => :put do
    order = Order.find(params[:id])
    order.room.unorder
    # order.delete
    # Maybe deny the order is better
    order.deny
    redirect_to  admin_orders_path
  end
end
