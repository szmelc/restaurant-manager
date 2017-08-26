class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :description, length: {maximum: 200, too_long: "Maksymalna długość opisu to %{count} znaków"}

 
# Method to display user avatar only if it's present

  def user_avatar 	
  	if avatar.present?
  		 avatar.url(:thumb)
		else
			 'thumb/missing.jpg'
  	end
  end

# Method to slice a phone number and join with '-'

  def phone_number
    if phonenumber.present?
      phonenumber.scan(/.../).join('-')
    else
      '-'
    end
  end

# Concatenate first name and last name

  def name
    [first_name, last_name].join(' ')
  end


end

