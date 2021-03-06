class Listing < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
  else
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
                            :storage => :dropbox,
                            :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                            :path => ":style/:id_:filename"
  end                          
end

class Listing < ActiveRecord::Base
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
