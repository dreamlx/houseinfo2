ActiveAdmin.register AdminUser do 

  index :download_links => false do
    selectable_column
    id_column
    column :name
    column :email
    column :role do |user|
      t(user.role)
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at
  config.filters = false

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      if can? :destroy, AdminUser
        f.input :role, :as => :select, :collection => [[t('manager'), 'manager'], [t('staff'), 'staff']]
      end
    end
    f.actions
  end

  show do |user|
    attributes_table do
      row :id
      row :name
      row :email
      row :role do |user|
        t(user.role)
      end
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
    end
  end

end
