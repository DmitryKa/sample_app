require 'spec_helper'

describe "StaticPages" do
  let(:same_title) {'Ruby on Rails Tutorial Sample App'}

  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like 'all static pages'
    it { should_not have_selector('title', text: "Home") }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like 'all static pages'
  end

  describe "About" do
    before { visit about_path }

    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }

    it_should_behave_like 'all static pages'
  end

  describe "Contact" do
    before { visit contact_path }

    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like 'all static pages'
  end

  it 'should have the right links on the layout' do
    visit root_path
    links = {'About' => 'About Us',
             'Help' => 'Help',
             'Contact' => 'Contact',
             'Home' => '',
             'Sign up now!' => 'Sign up'}

    links.each_pair do |key, value|
      click_link key
      page.should have_selector 'title', text: full_title(value)
    end
  end

 end
