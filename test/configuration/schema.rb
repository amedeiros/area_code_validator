ActiveRecord::Schema.define do
  create_table 'phones', force: true do |t|
    t.string   'cell_phone'
    t.string   'state'
    t.timestamps null: false
  end
end