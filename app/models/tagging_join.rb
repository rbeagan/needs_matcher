class TaggingJoin < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :posting,
             :required => false

  # Indirect associations

  # Validations

end
