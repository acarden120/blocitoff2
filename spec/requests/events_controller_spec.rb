require "rails_helper"

RSpec.describe "EventsController", :type => :request do

context 'Unregistered application creates event' do
  before do
	post '/api/events/'
  end
  it 'should respond with status unprocessable entity' do
  	expect(response.code).to eq("422")
  end
end

#context 'Registered application is trying to create event without a name.' do
#  before do
#    @test_app = FactoryGirl.build(:registered_application)
#    @test_event = FactoryGirl.build(registered_application: @test_app, name: nil)

#	post "/api/events/#{@test_event.id}"
#  end
#  it 'should respond with status unprocessable entity' do
#  	expect(response.code).to eq("422")
#  end
#end

context describe 'Registered application is trying to create valid event.'
  before do
    @user = create(:user)
    @test_app = FactoryGirl.create(:registered_application, user: @user)
    post "/api/events", :event_name => {:event_name => "index", :registered_application_id => @test_app}
  end
  it 'should respond with status success response code' do
  	expect(response.code).to eq("200")
  end
end