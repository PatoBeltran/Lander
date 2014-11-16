class Link < ActiveRecord::Base
  belongs_to :user, inverse_of: :links
  belongs_to :team, inverse_of: :links
  belongs_to :channel, inverse_of: :links

  acts_as_taggable
end
