class CreateBuilders < ActiveRecord::Migration
  def change
    create_table :builders do |t|
      t.string :code
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
