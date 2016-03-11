class Article < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  attr_accessor :file
  acts_as_votable
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :category
  validates :file, presence: true
  

  #has_attached_file :image, styles: {large: '600x330', medium: '300x300', thumb: '100x100'}
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :recent_article, lambda {order('created_at DESC')[5]}

  def initialize(params={}) 
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = @file.read
    end
  end

  def tag_list
  	self.tags.collect do |tag|
  		tag.name
  	end.join(", ")
  end

  def tag_list=(tags_string)
  	tag_names = tags_string.split(", ").collect{|s| s.strip.downcase}.uniq
  	new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
  	self.tags = new_or_found_tags
  end

  private
    def sanitize_filename(filename)
      return File.basename(filename)
    end
end
