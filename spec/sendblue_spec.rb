require './spec/spec_helper'

RSpec.describe Sendblue::Sendblue do
  let(:client) { Sendblue::Sendblue.new("9015f50ef5ae0314dee0464616dbfd16",
                                        "b212c3e429ba69be1d2d1e8b691325b3")}
  describe "send" do
    it "sends a message to the designated phone number", :vcr do
      response = client.send_message("14154812629",
                                     "Hello from SendBlue!")

      expect(response.message_handle).to eq("a4ce7ca1-e6f5-476d-b6bf-94f5892a7548")
    end
  end

  describe "status" do
    # it "gets the status of a message", :vcr do
    #   expect{client.message_status("a4ce7ca1-e6f5-476d-b6bf-94f5892a7548")}.to raise_error(RuntimeError)
    # end
    
    it "raise an exception with an invalid message handle", :vcr do
      expect{client.message_status("xxxxxxx-e6f5-476d-b6bf-94f5892a7548")}.to raise_error(RuntimeError)
    end
  end
end
