class Artist < ActiveRecord::Base
  has_many :artworks, :dependent => :destroy
  has_attached_file :profile_pic, :path => ":rails_root/public/assets/images/:class/:id/:basename.:extension",
                    :url => "/assets/images/:class/:id/:basename.:extension"
  validates :name, :presence => true
  validates_attachment_presence :profile_pic
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  def display_image
    if display_image_id == nil || display_image_id == ""
      return "/images/:style/missing.png"
    else
      return Artwork.find(display_image_id).image.url
    end
  end
end
