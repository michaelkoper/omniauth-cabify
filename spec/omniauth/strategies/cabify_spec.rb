require 'spec_helper'

describe OmniAuth::Strategies::Cabify do
  let(:access_token) { stub('AccessToken', :options => {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', :parsed => parsed_response) }

  subject do
    OmniAuth::Strategies::Cabify.new({})
  end

  before(:each) do
    subject.stub!(:access_token).and_return(access_token)
  end

  context "client options" do

    it 'should have correct site' do
      subject.options.client_options.site.should eq("http://localhost:3000")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('http://localhost:3000/oauth/new')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('http://localhost:3000/oauth/token')
    end

  end

  context "#raw_info" do
    it "should use relative paths" do
      access_token.should_receive(:get).with('oauth/users').and_return(response)
      subject.raw_info.should eq(parsed_response)
    end
  end

end
