class Wishpond::LoginPage < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/login"
	expected_title "#{Wishpond::TITLE}"

	element(:username_field) { |b| b.text_field(name: 'user[email]') }
  element(:password_field) { |b| b.text_field(name: 'user[password]') }
  element(:login_button) { |b| b.button(name: 'commit') }
  element(:logged_in) { |b| b.div(id: 'site_content') }

  value(:logged_in?) { |p| p.logged_in.exists? }

	def login_with username, password
		username_field.set username
		password_field.set password
		login_button.click
	end

end
