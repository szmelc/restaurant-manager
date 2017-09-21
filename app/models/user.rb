class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :description, length: {maximum: 200, too_long: "Maksymalna długość opisu to %{count} znaków"}
  has_many :pinned_posts
  has_many :posts
  has_many :comments

 
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
      phonenumber.scan(/.../).join('-') # scans for 3 consecutive characters and joins them with '-'
    else
      '-'
    end
  end

# Concatenate first name and last name

  def name
    [first_name, last_name].join(' ')
  end

# Find orders that were made today

  def orders_today
    @orders_today = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end


end

