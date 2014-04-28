# coding: utf-8
ActiveAdmin.register Room do
  actions :all, except: [:show] 
  index :download_links => false
  index do
    column :id
    column :room_no
    column :area
    column :building
    column :unit
    column :room_model
    column :state do |room|
      if room.state == 'on_sale'
        link_to t(room.state||'在售'), sale_admin_room_path(room), :method => :put,:class => 'button'
      else
        link_to t(room.state||'售出'), cancel_admin_room_path(room), :method => :put,:class => 'button'
      end
    end
    default_actions
  end

  form do |f|
      f.inputs "Details" do
        f.input :room_no
        f.input :area
        f.input :building
        f.input :unit
        f.input :room_model
      end
      f.actions
  end


  member_action :cancel, :method => :put do
    item = Room.find(params[:id])
    item.unsold
    redirect_to  admin_rooms_path
  end

  member_action :sale, :method => :put do
    item = Room.find(params[:id])
    item.sold
    redirect_to  admin_rooms_path
  end  
end
