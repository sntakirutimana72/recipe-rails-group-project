require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Login required' do
    before { get recipes_path }

    it('status should be 302') { expect(response).to have_http_status(302) }
  end
end
