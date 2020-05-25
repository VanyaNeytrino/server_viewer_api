# frozen_string_literal: true

class Bandwidth < ApplicationRecord
  belongs_to :server

  validate :interface_name_uniq

  def interface_name_uniq
    return true unless server
    repeted_hash = server.bandwidths.map(&:interface_name)
                         .each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }

    errors.add(:interface_name, 'interface name exist') if repeted_hash[interface_name].positive?
  end
end
