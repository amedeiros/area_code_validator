class CreatePhones < ActiveRecord::Migration
  def up
    create_table :phones do |t|
      t.string :cell_phone
      t.string :state

      t.timestamps
    end
  end

  def down
    drop_table :phones
  end
end
