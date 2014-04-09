require 'spec_helper'

	describe 'new files' do 

		it "should be able to show the file page" do 
			visit '/files'
			expect(current_path).to eq '/files'
		end

		it "should be able to create a new users files" do
			visit '/files/new'
			fill_in 'Email', with: 'groombridgetom@gmail.com'
			fill_in 'Password', with: 'mcpwmb18694'
			click_button 'Submit'
			expect(page).to have_content 
			expect(current_path).to eq '/files/new'

		end

	end