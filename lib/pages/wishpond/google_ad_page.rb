class Wishpond::GoogleAd < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/wizard/start?wizard=wizards%2Fgoogle_ad"
	expected_title "#{Wishpond::TITLE}"

  #Wizard Step 1
	element(:ad_destination_type) { |b| b.select_list(name: 'ad_campaign[ad_creative][destination_type]') }
  element(:ad_link_url) { |b| b.text_field(name: 'ad_campaign[ad_creative][link_url]') }
  element(:ad_display_url) { |b| b.text_field(name: 'ad_campaign[ad_creative][display_url]') }

  element(:ad_title) { |b| b.text_field(name: 'ad_campaign[ad_creative][title]') }
  element(:ad_body) { |b| b.text_field(name: 'ad_campaign[ad_creative][body]') }
  element(:ad_second_body) { |b| b.text_field(name: 'ad_campaign[ad_creative][second_body]') }

  element(:next_button) { |b| b.button(type: 'submit') }

  #Wizard Step 2

  element(:ad_audience_cbox) { |b| b.checkbox(name: 'ad_campaign[enable_managed_targeting]') }
  element(:ad_keyword) { |b| b.text_field(name: 'keywords') }
  element(:add_keyword_button) { |b| b.button(id: 'add_keyword') }

  element(:ad_display_network) { |b| b.checkbox(name: 'ad_campaign[ad_group][display_network_enabled]') }

  element(:ad_budget) { |b| b.text_field(name: 'ad_campaign[ad_group][daily_budget]') }
  element(:done_button) { |b| b.button(type: 'submit') }

  value(:created_fine?) { |p| p.text.include? 'Ads Summary' }

  def create
  	ad_destination_type.select ad_text[:ad_destination_type]
    ad_link_url.set ad_text[:ad_link_url]
    ad_display_url.set ad_text[:ad_display_url]

  	ad_title.set ad_text[:ad_title]
  	ad_body.set ad_text[:ad_body]
  	ad_second_body.set ad_text[:ad_second_body]

    next_button.click

    ad_audience_cbox.clear
    ad_keyword.set ad_text[:ad_keyword]
    add_keyword_button.click

    ad_display_network.set
    ad_budget.set ad_text[:ad_budget]

    done_button.click
  end

  private

  def ad_text
		@ad_text = { :ad_destination_type => "Website URL",
                      :ad_link_url => "http://testestest.com",
                      :ad_display_url => "http://testestest.com",
  										:ad_title => "Auto Test Ad",
  										:ad_body => "auto test ad body",
  										:ad_second_body => "auto test ad second_body",
                      :ad_keyword => "busyness",
                      :ad_budget => "12",
                       }
	end

end
