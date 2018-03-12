class Tag < ApplicationRecord
  # Direct associations

  has_many   :tagging_joins,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
