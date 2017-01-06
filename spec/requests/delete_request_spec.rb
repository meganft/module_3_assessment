require 'rails_helper'

describe "items endponts" do
  context "DELETE api/v1/items/:id" do
    it "deletes a specific item and returns a 204 response with nothing else " do
      item_1 = Item.create(id: 1, name: "Pen", description: "Write things", image_url: "pen.png")
      item_2 = Item.create(id: 2, name: "Paper", description: "Write on this", image_url: "paper.png")

      delete "api/v1/items/#{item_1.id}"

      expect(response).to be_success
      expect(response).to have_http_status(204)
    end
  end
end
