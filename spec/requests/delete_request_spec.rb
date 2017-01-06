require 'rails_helper'

describe "items endponts" do
  context "DELETE api/v1/items/:id" do
    it "deletes a specific item and returns a list of all remaining" do
      item_1 = Item.create(id: 1, name: "Pen", description: "Write things", image_url: "pen.png")
      item_2 = Item.create(id: 2, name: "Paper", description: "Write on this", image_url: "paper.png")

      delete "api/v1/items/#{item_1.id}"

      # items = JSON.parse(response.body)

      expect(response).to be_success
      # expect(items.first["id"]).to eq(nil)
      # expect(items.first["name"]).to eq(nil)
      # expect(items.last["description"]).to eq(item_2.description)
      # expect(items.last["image_url"]).to eq(item_2.image_url)
      # expect(items.last["created_at"]).to eq(nil)
      expect(response).to have_http_status(204)
    end
  end
end
