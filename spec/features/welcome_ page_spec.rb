require 'spec_helper'

describe "Static Page" do
  describe "Index page" do
    it "should have the content 'Thanks'" do
		visit '/welcome/index'
		expect(page).to have_content('Thanks')
    end
  end
end
