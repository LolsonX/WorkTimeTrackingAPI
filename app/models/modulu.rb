class Modulu < ApplicationRecord
  belongs_to :project
  has_one :state
end
