class CreateSubLinkedits < ActiveRecord::Migration
  def change
    create_table :sublinkedits do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
