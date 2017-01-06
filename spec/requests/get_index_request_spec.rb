require 'rails_helper'

describe "items endponts" do
  context "GET api/v1/items" do
    it "returns a list of all items" do
      item_1 = Item.create(id: 1, name: "Pen", description: "Write things", image_url: "pen.png")
      item_2 = Item.create(id: 2, name: "Paper", description: "Write on this", image_url: "paper.png")

      get 'api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first["id"]).to eq(item_1.id)
      expect(items.first["name"]).to eq(item_1.name)
      expect(items.last["description"]).to eq(item_2.description)
      expect(items.last["image_url"]).to eq(item_2.image_url)
      expect(items.last["created_at"]).to eq(nil)
      expect(response).to have_http_status(200)
    end
  end
end
