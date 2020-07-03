require './spec/spec_helper'

RSpec.describe Sendblue::Sendblue do
  let(:client) { Sendblue::Sendblue.new("80787z50ef5ae0314dee0464616dbfd16",
                                        "b212Ce374j887d2d1e8b691325b3")}
  describe "send" do
    it "sends a message to the designated phone number", :vcr do
      response = client.send_message("14154812629",
                                     "Hello from SendBlue!")

      expect(response.message_handle).to eq("ab1698fe-eb97-4a42-be1d-39ec8607c181")
    end
  end

  describe "status" do
    it "gets the status of a message", :vcr do
      expect(client.message_status("72a8f188-75a3-47cf-a5d4-eb482a83cc4a").status).to eq("PENDING")
    end
    
    it "raise an exception with an invalid message handle", :vcr do
      expect{client.message_status("xxxxxxx-e6f5-476d-b6bf-94f5892a7548")}.to raise_error(Sendblue::MessageNotFoundException)
    end
  end
end
