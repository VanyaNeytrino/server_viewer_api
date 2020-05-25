# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ServersController, type: :controller do
  it 'GET all servers' do
    server = create(:server)
    create(:bandwidth, server_id: server.id)

    get :index

    body = JSON.parse(response.body)
    keys = body['data'][0].keys
    values = body['data'][0].values

    expect(keys.include?('type')).to eq(true)
    expect(values.include?('server')).to eq(true)
    expect(body['data'][0]['id']).to eq(server.id)
  end

  it 'DELETE server' do
    server = create(:server)
    server_id = server.id
    create(:bandwidth, server_id: server_id)

    delete :destroy, params: { id: server_id }
    body = JSON.parse(response.body)
    expect(body['success']).to eq(true)
  end

  it 'DELETE dependent of server' do
    server = create(:server)
    server_id = server.id
    bandwidth = create(:bandwidth, server_id: server_id)

    delete :destroy, params: { id: server_id }
    bandwidth = Bandwidth.find_by(id: bandwidth.id)

    expect(bandwidth.nil?).to eq(true)
  end
end
