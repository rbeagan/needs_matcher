class Posting < ApplicationRecord
  # Direct associations

  has_many   :tagging_joins,
             :dependent => :destroy

  has_many   :commitments,
             :dependent => :destroy

  belongs_to :poster,
             :class_name => "User"

  # Indirect associations

  has_many   :tags,
             :through => :tagging_joins,
             :source => :tag

  # Validations

end
