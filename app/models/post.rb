class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  mount_uploader :image, ImageUploader
 
  #default_scope { order('created_at DESC') }
  default_scope { order('rank DESC') }  

  scope :ordered_by_title, -> { reorder('title ASC') }
  
  scope :ordered_by_reverse_created_at, -> { reorder('created_at ASC') }
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  #commented out below for rspec voting tests
  validates :topic, presence: true
  validates :user, presence: true

  
  #>Voting
  def up_votes
    votes.where(value: 1).count
  end
  
  def down_votes
    votes.where(value: -1).count
  end
  
  def points
    votes.sum(:value)
  end 
  
  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end    
  #<Voting
  
  
  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body
    render_as_markdown(body)
  end  
  
  def create_vote
    user.votes.create(value: 1, post: self)
  end  
  
  private
  
  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end  
  
 
end
