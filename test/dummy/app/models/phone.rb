class Phone < ActiveRecord::Base
  validates :cell_phone, :state, area_code_invalid: true
end
