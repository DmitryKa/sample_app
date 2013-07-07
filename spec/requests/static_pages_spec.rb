require 'spec_helper'

describe "StaticPages" do
  let(:same_title) {'Ruby on Rails Tutorial Sample App'}

  describe "Home page" do
    it "should have the h1'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      page.should have_selector('h1',
                  text: 'Sample App')
    end

    it "should have standard title" do
      visit root_path
      page.should have_selector('title',
                  text: "#{same_title}")
    end

    it "shouldn't have title with the 'Home'" do
      visit root_path
      page.should_not have_selector('title',
                  text: "Home")
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit help_path
      page.should have_selector('h1',
                  text: 'Help')
    end

    it "should have the title with '| Help'" do
      visit help_path
      page.should have_selector('title',
                  text: "#{same_title} | Help")
    end
  end

  describe "About" do
    it "should have the h1 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit about_path
      page.should have_selector('h1', text: 'About Us')
    end

    it "should have the title with '| About us'" do
      visit about_path
      page.should have_selector('title', text: "#{same_title} | About Us")
    end
  end

  describe "Contact" do
    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the title with ' |Contact'" do
      visit contact_path
      page.should have_selector('title', text: "#{same_title} | Contact")
    end
  end
 end
