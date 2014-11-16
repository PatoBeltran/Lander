class Link < ActiveRecord::Base
  belongs_to :user, inverse_of: :link
  belongs_to :team, inverse_of: :link
  belongs_to :channel, inverse_of: :link
end
