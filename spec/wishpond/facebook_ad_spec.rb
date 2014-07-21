describe 'Facebook Ad Creation' do

  context 'Logged in merchant' do
    it 'should be able to create a facebook ad' do
      Wishpond.ensure_logged_in
      visit Wishpond::FacebookAd do |ad|
        ad.create
        ad.should be_created_fine
      end
    end
  end

end
