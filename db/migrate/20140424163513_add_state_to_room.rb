class AddStateToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :state, :string
  end
end
