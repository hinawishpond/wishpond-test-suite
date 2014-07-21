class Wishpond::UserSettings < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/central/user"
	expected_title "#{Wishpond::TITLE}"

	element(:first_name) { |b| b.text_field(name: 'user[first_name]') }
	element(:last_name) { |b| b.text_field(name: 'user[last_name]') }
	element(:password) { |b| b.text_field(name: 'user[password]') }
	element(:confirm_password) { |b| b.text_field(name: 'user[password_confirmation]') }
	element(:email) { |b| b.text_field(name: 'user[email]') }
	element(:save_button) { |b| b.button(name: 'commit') }

  value(:saved_successfully?) { |p| p.text.include? 'Your changes have been saved' }

  attr_reader

	def update_settings

		first_name.set new_settings[:first_name]
		last_name.set new_settings[:last_name]
		password.set new_settings[:password]
		confirm_password.set new_settings[:password]

		save_button.click
	end

	def new_settings
		@new_settings = { :first_name => "Super",
  										:last_name => "Tester",
  										:password => "letmein"
  									 }
	end

end
