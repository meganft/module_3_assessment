require 'rails_helper'

describe "items endponts" do
  context "POST api/v1/items/:id" do
    it "creates a new item and returns that item" do

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/items", '{ "item": { "name":"Great New Item", "description":"This is a fun new item", "image_url": "item.png" } }', headers

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(1)
      expect(item["name"]).to eq("Great New Item")
      expect(item["description"]).to eq("This is a fun new item")
      expect(item["image_url"]).to eq("item.png")
      expect(item["created_at"]).to eq(nil)
      expect(response).to have_http_status(201)
    end
  end
end
