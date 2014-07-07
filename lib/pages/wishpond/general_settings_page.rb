class Wishpond::GeneralSettings < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/central/settings"
	expected_title "#{Wishpond::TITLE}"

	element(:business_name_field) { |b| b.text_field(name: 'merchant[name]') }
  element(:website_field) { |b| b.text_field(name: 'merchant[url_without_protocol]') }
  element(:currency_field) { |b| b.select_list(name: 'merchant[currency_id]') }
  element(:language_field) { |b| b.select_list(name: 'merchant[locale]') }
  element(:time_zone_field) { |b| b.select_list(name: 'merchant[time_zone]') }
  element(:email_settings_field) { |b| b.checkbox(name: 'merchant[send_new_participant_notification]') }
  element(:save_button) { |b| b.button(name: 'commit') }
  #element(:success_alert) { |b| b.div(text: 'Your settings have been updated') }

  value(:saved_successfully?) { |p| p.text.include? 'Your settings have been updated' }

  attr_reader

	def update_settings
		business_name_field.set new_settings[:business_name]
		website_field.set new_settings[:website]
		currency_field.select new_settings[:currency]
		language_field.select new_settings[:language]
		time_zone_field.select new_settings[:time_zone]
		email_settings_field.set
		save_button.click
	end

	def new_settings
		@new_settings = { :business_name => "Wishpond Test Business", :website => "wishponder.com",
  										:currency => "Canadian Dollar - CAD", :language => "English (English)",
  										:time_zone => "(GMT-08:00) Pacific Time (US & Canada)" }
	end

end
