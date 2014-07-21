class Wishpond::GeneralSettings < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/central/settings"
	expected_title "#{Wishpond::TITLE}"

	element(:business_name_field) { |b| b.text_field(name: 'merchant[name]') }
  element(:language_field) { |b| b.select_list(name: 'merchant[locale]') }
  element(:time_zone_field) { |b| b.select_list(name: 'merchant[time_zone]') }

  #checkboxes
  element(:email_notices) { |b| b.checkbox(name: 'merchant[notification_setting_attributes][email_notices]') }
  element(:email_billing) { |b| b.checkbox(name: 'merchant[notification_setting_attributes][email_billing]') }
  element(:email_import_export) { |b| b.checkbox(name: 'merchant[notification_setting_attributes][email_import_export]') }
  element(:email_campaign) { |b| b.checkbox(name: 'merchant[notification_setting_attributes][email_campaign]') }
  element(:email_ads) { |b| b.checkbox(name: 'merchant[notification_setting_attributes][email_ads]') }

  #submit
  element(:save_button) { |b| b.button(name: 'commit') }

  value(:saved_successfully?) { |p| p.text.include? 'Your settings have been updated' }

  attr_reader

	def update_settings

		business_name_field.set new_settings[:business_name]
		language_field.select new_settings[:language]
		time_zone_field.select new_settings[:time_zone]

		email_notices.set
		email_billing.set
		email_import_export.set
		email_campaign.set
		email_ads.set

		save_button.click
	end

	def new_settings
		@new_settings = { :business_name => "Wishpond Test Business",
  										:language => "English (English)",
  										:time_zone => "(GMT-08:00) Pacific Time (US & Canada)" }
	end

end
