describe 'Google Ad Creation' do

  context 'Logged in merchant' do
    it 'should be able to create a google ad' do
      Wishpond.ensure_logged_in
      visit Wishpond::GoogleAd do |ad|
        ad.create
        ad.should be_created_fine
      end
    end
  end

end
