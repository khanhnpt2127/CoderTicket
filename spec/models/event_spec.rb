require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { event = Event.new }
  describe "#venue_name" do
    it "returns nil if there is no venue" do
      expect(event.venue_name).to be_nil
    end
    it "returns venue if there is venue" do
      event.venue = Venue.new(name: "RMIT")
      expect(event.venue_name).to eq "RMIT"
    end
  end
end
