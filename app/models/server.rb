# frozen_string_literal: true

class Server < ApplicationRecord
  has_many :bandwidths, dependent: :destroy
end
