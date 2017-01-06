require 'rails_helper'

describe "items endponts" do
  context "POST api/v1/items/:id" do
    it "creates a new item and returns that item" do

      item = JSON.parse(response.body)
      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/items", '{ "item": { "name":"Great New Item", "description":"This is a fun new item", "image_url": "item.png" } }', headers

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq('1')
      expect(item["name"]).to eq(item_2.name)
      expect(item["description"]).to eq(item_2.description)
      expect(item["image_url"]).to eq(item_2.image_url)
      expect(item["created_at"]).to eq(nil)
      expect(response).to have_http_status(200)
    end
  end
end
