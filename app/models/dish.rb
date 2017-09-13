class Dish < ApplicationRecord
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/	


  def dish_image
  	if image.present?
  		 image.url(:medium)
		else
			 'dish.svg'
  	end
  end



end
