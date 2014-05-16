ActiveAdmin.register Order do  
  menu :label => proc{ I18n.t("order") }

  index do
    selectable_column
    column :id
    column :state do |order|
      status_tag(order.state)
      # link_to t(order.state), unconfirm_admin_order_path(order), :method => :put,:class => 'button'
    end
    column :room
    column :confirm do |order|
      if order.state == "in_process"
        link_to t('confirm'), confirm_admin_order_path(order), :method => :put,:class => 'button' 
      end
    end
    column :unconfirm do |order|
      if order.state == "in_process"
        link_to t('unconfirm'), unconfirm_admin_order_path(order), :method => :put,:class => 'button' 
      end
    end

    default_actions
  end

  member_action :confirm, :method => :put do
    order = Order.find(params[:id])
    order.confirm
    debugger
    Order.where(:room_id => order.room.id).each do |o|
      if o.state == "in_process"
        o.unconfirm
      end
    end
    order.room.sold
    redirect_to  admin_orders_path
  end

  member_action :unconfirm, :method => :put do
    item = Order.find(params[:id])
    item.unconfirm
    item.room.unsold
    redirect_to  admin_orders_path
  end
end
