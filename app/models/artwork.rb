class Artwork < ActiveRecord::Base
  belongs_to :artist
  has_attached_file :image, :path => ":rails_root/public/assets/images/:class/:basename_:style.:extension",
                    :url => "/assets/images/:class/:basename_:style.:extension",
                    :styles => {
                      :preview => '185x285'
                    }
  validates :name, :presence => true
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
