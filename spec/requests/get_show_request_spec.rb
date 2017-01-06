require 'rails_helper'

describe "items endponts" do
  context "GET api/v1/items/:id" do
    it "returns a specific item" do
      item_1 = Item.create(id: 1, name: "Pen", description: "Write things", image_url: "pen.png")
      item_2 = Item.create(id: 2, name: "Paper", description: "Write on this", image_url: "paper.png")

      get "api/v1/items/#{item_2.id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(item_2.id)
      expect(item["name"]).to eq(item_2.name)
      expect(item["description"]).to eq(item_2.description)
      expect(item["image_url"]).to eq(item_2.image_url)
      expect(item["created_at"]).to eq(nil)
      expect(response).to have_http_status(200)
    end
  end
end
