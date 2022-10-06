require 'rails_helper'

RSpec.describe 'Public_Recipe', type: :request do
  before(:example) { get public_recipes_path }

  it('status should be 200') { expect(response).to have_http_status(:ok) }

  it('should render :index') { expect(response).to render_template(:index) }
end
