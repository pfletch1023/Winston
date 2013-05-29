class Work < ActiveRecord::Base
  
  attr_accessible :name, :role, :program, :datetime, :description, :image, :director, :type_id, :image
  
  validates_presence_of :type_id
  validates_presence_of :name
  
  belongs_to :type
  
  include PgSearch
  pg_search_scope :search, 
    :against => {
      :name => "A", 
      :role => "B", 
      :program => "C", 
      :director => "D"
    }, 
    :using => {:tsearch => {:prefix => true}}
  
  has_attached_file :image, 
    :styles => { 
      :medium => ["400x", :jpg], 
      :small => ["100x", :jpg],
      :original => ["100%", :jpg]
    },
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :bucket => ENV['S3_BUCKET_NAME']
    }

  def as_json
    {
      "id" => read_attribute(:id),
      "name" => read_attribute(:name),
      "role" => read_attribute(:role),
      "datetime" => read_attribute(:datetime),
      "image" => image,
      "image_small" => image.url(:small),
      "image_medium" => image.url(:medium),
      "image_large" => image.url(:large)
    }
  end
  
end
