require 'rails_helper'

describe "Programs API" do
  it "sends a list of program" do
    program = create(:program)
    get "/api/v1/programs/", params: { cip2: program.cip2 }
    
    expect(response).to be_success
    program_response = JSON.parse(response.body).first
    
    expect(program_response["name"]).to eq(program.name)
    expect(program_response["id"]).to eq(program.id)
  end
end