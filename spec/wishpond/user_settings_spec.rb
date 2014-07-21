describe 'User Settings' do

  context 'Logged in merchant' do
    it 'should be able to update settings' do
      Wishpond.ensure_logged_in
      visit Wishpond::UserSettings do |page|
        page.update_settings
        page.should be_saved_successfully
      end
    end
  end

end
