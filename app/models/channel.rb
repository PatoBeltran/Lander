class Channel < ActiveRecord::Base
  belongs_to :team, inverse_of: :channels
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"

  validates :name, uniqueness: { scope: :team_id }, presence: true

  before_validation :sanitize_name

  def sanitize_name
    self.name.gsub!(" ", "")
  end

end
