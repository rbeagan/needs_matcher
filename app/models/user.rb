require 'open-uri'
class User < ApplicationRecord
  before_validation :geocode_home_address

  def geocode_home_address
    if self.home_address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.home_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.home_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.home_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.home_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
