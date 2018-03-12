class Commitment < ApplicationRecord
  # Direct associations

  belongs_to :posting,
             :counter_cache => true

  belongs_to :user,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
