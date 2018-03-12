class Tag < ApplicationRecord
  # Direct associations

  has_many   :tagging_joins,
             :dependent => :destroy

  # Indirect associations

  has_many   :postings,
             :through => :tagging_joins,
             :source => :posting

  # Validations

end
