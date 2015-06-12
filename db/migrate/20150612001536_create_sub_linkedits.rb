class CreateSubLinkedits < ActiveRecord::Migration
  def change
    create_table :sub_linkedits do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
