class Listing < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "100x", :thumb => "50x50>" }, :default_url => "default.jpg",
                            :storage => :dropbox,
                            :dropbox_credentials => Rails.root.join("config/dropbox.yml")
end

class Listing < ActiveRecord::Base
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
