class Posting < ApplicationRecord
  # Direct associations

  has_many   :tagging_joins,
             :dependent => :destroy

  has_many   :commitments,
             :dependent => :destroy

  belongs_to :poster,
             :class_name => "User"

  # Indirect associations

  # Validations

end
