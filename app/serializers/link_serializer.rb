class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :channel

  def channel
    object.channel.name
  end
end
