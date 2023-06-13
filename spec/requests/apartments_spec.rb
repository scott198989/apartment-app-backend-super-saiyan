require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }
  describe "GET /index" do
    it 'return a list of apartments' do
      apartment = user.apartments.create(
        street:"Andros Pl",
        unit:"1",
        city:"San Diego",
        state:"CA",
        square_footage:1200,
        price:"2,500",
        bedrooms:2,
        bathrooms:2,
        pets:"yes",
        image:"../assets/images/apartment.jpeg"
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq('Andros Pl')
    end
  end
end

