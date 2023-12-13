# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserLanguages' do
  let!(:language) { create(:language) }

  before { login_as(create(:user)) }

  describe 'GET /new' do
    it 'renders the new action with new languages' do
      get '/user_languages/new'

      expect(response).to render_template(:new)
      expect(response.body).to include("option value=\"#{language.id}\">#{language.name}")
    end
  end

  describe 'POST /create' do
    it 'creates a new user language' do
      expect do
        post '/user_languages', params: { user_language: { language: language.id } }
      end.to change(UserLanguage, :count).by(1)
      expect(response).to render_template(:create)
    end
  end
end
