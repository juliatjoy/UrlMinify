require 'rails_helper'


RSpec.describe LinksController do
  let(:link) { create(:link) }

  describe "POST 'create'" do
    it "should be successful" do
      expect_any_instance_of(Link).to receive(:save).and_return(true)
      post :create, link: link.attributes, format: :json
    end
  end

  describe 'GET get_link' do
    before(:each) do
      get :get_link, slug: link.slug
    end

    it 'redirects to the corresponding url' do
      response.should redirect_to link.url
    end

    it 'redirects to error page' do
      get :get_link, slug: 'invalid'
      response.should render_template('link_error')
    end
  end
end

