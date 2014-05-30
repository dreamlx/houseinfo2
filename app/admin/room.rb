# coding: utf-8
ActiveAdmin.register Room do
  # actions :all, except: [:show] 
  #index :download_links => false
  filter :state, as: :select, :collection => [['在售', 'on_sale'], ['售出', 'sold_out'], ['预订', 'ordered']]
  filter :room_no
  filter :area
  filter :building
  filter :unit
  filter :room_model

  index :download_links => false do
    column :room_no
    column :area
    column :building
    column :unit
    column :room_model
    column :state do |room|
      if room.state == 'sold_out' || room.state == 'ordered'
        status_tag(t(room.state), :ok)
      else
        status_tag(t(room.state))
      end
    end
    default_actions
  end
  
  # page of new and edit
  form do |f|
      f.inputs t('Details') do
        f.input :room_no
        f.input :area
        f.input :building
        f.input :unit
        f.input :room_model
        f.input :state, as: :radio, collection: [[t('on_sale'), 'on_sale'], [t('orderd'), 'ordered'], [t('sold_out'), 'sold_out']]
      end
      f.actions
  end

  # page of show
  show do |room|
    attributes_table do
      row :room_no
      row :area
      row :building
      row :unit
      row :room_model
      row :state do |room|
        t(room.state)
      end
    end
    panel t('orderslist') do
      table_for(room.orders)  do |order|
        order.column :id
        order.column :state        
      end
    end
  end

  member_action :cancel, :method => :put do
    item = Room.find(params[:id])
    item.unsold
    item.orders.each do |o|
      o.delete
    end
    redirect_to  admin_rooms_path
  end

  member_action :sale, :method => :put do
    item = Room.find(params[:id])
    item.sold
    redirect_to  admin_rooms_path
  end
end
