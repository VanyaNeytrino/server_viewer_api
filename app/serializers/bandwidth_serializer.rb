# frozen_string_literal: true

class BandwidthSerializer
  include FastJsonapi::ObjectSerializer
  attributes :server_id, :value, :inteface_name, :value_id
end
