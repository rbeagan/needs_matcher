class User < ApplicationRecord
  # Direct associations

  has_many   :postings,
             :foreign_key => "poster_id",
             :dependent => :destroy

  has_many   :commitments,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
