describe 'Email List Ad Creation' do

  context 'Logged in merchant' do
    it 'should be able to advertise to email list' do
      Wishpond.ensure_logged_in
      visit Wishpond::EmailListAd do |ad|
        ad.create
        ad.should be_created_fine
      end
    end
  end

end
