class Wishpond::GeneralSettings < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/central/ad_dashboard"
	expected_title "#{Wishpond::TITLE}"


	element(:ad_destination_type) { |b| b.text_field(name: 'ad_campaign[ad_creative][destination_type]') }
  element(:ad_title) { |b| b.select_list(name: 'ad_campaign[ad_creative][title]') }
  element(:ad_body) { |b| b.select_list(name: 'ad_campaign[ad_creative][body]') }
  element(:ad_second_body) { |b| b.select_list(name: 'ad_campaign[ad_creative][second_body]') }

  element(:next_button) { |b| b.button(type: 'submit') }



  def create_google_ad
  end



end
