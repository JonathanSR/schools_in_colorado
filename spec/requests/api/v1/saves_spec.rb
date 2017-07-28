require 'rails_helper'

describe "Saves API" do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "creates a new save entry" do
    post '/api/v1/saves/', params: {school:"CSU", ethnicity:"hispanic", year:"2016", program:"chem", program_grads:"23", ethnicity_grads:"10",percentage_one:".2", percentage_two:".5"}

    expect(response).to be_success
    saved_search = JSON.parse(response.body)

    expect(saved_search["school"]).to eq("CSU")
    expect(saved_search["ethnicity"]).to eq("hispanic")
  end

  it "deletes a saved entry" do
    saved_search = @user.saves.create(school:"CSU", ethnicity:"hispanic", year:"2016", program:"chem", program_grads:"23", ethnicity_grads:"10",percentage_one:".2", percentage_two:".5")

    expect(@user.saves.count).to eq(1)

    delete "/api/v1/saves/#{saved_search.id}"

    expect(response).to be_success
    expect(@user.saves.count).to eq(0)
    expect{Safe.find(saved_search.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
