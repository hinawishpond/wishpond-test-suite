class Wishpond::EmailListAd < GenericBasePage

	page_url "#{Wishpond::BASE_URL}/wizard/start?wizard=wizards%2Fcustom_audience"
	expected_title "#{Wishpond::TITLE}"

  #Wizard Step 1
	element(:ad_destination_type) { |b| b.select_list(name: 'ad_campaign[ad_creative][destination_type]') }
  element(:ad_campaign) { |b| b.select(name: 'ad_campaign[ad_creative][social_campaign_id]') }
  element(:ad_fill_ad_confirmation) { |b| b.button(id: 'fill_ad_fields') }

  element(:ad_title) { |b| b.text_field(name: 'ad_campaign[ad_creative][title]') }
  element(:ad_body) { |b| b.text_field(name: 'ad_campaign[ad_creative][body]') }

  element(:next_button) { |b| b.button(type: 'submit') }

  #Wizard Step 2
  element(:ad_email_list) { |b| b.select_list(name: 'ad_campaign[custom_ad_targeting][email_custom_audience_attributes][list_id]') }
  element(:ad_budget) { |b| b.text_field(name: 'ad_campaign[ad_group][daily_budget]') }
  element(:done_button) { |b| b.button(type: 'submit') }

  value(:created_fine?) { |p| p.text.include? 'Landing Page' }

  def create
  	ad_destination_type.select ad_text[:ad_destination_type]
    ad_campaign.select ad_text[:ad_campaign]
  	ad_title.set ad_text[:ad_title]
  	ad_body.set ad_text[:ad_body]
    ad_fill_ad_confirmation.click
    next_button.click

    ad_email_list.select ad_text[:ad_email_list]
    ad_budget.set ad_text[:ad_budget]
    done_button.click
  end

  private

  def ad_text
		@ad_text = { :ad_destination_type => "A Wishpond Contest, Coupon or Landing Page",
                      :ad_campaign => "Landing Page",
  										:ad_title => "Auto Test Ad",
  										:ad_body => "auto test ad body",
                      :ad_email_list => "Landing Page - Original (1)",
                      :ad_budget => "12"
               }
	end

end
