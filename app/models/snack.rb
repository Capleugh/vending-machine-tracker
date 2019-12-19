class Snack < ApplicationRecord
  validates_presence_of :snack_type, :price

  has_many :machine_snacks
end
