# frozen_string_literal: true

class ServerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  attribute :bandwidths do |object|
    object.bandwidths.map { |bandwidth| BandwidthSerializer.new(bandwidth).serializable_hash }
  end
  # has_many :bandwidths
end
