user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

ca_apartments = [
    {
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
    },
    {
        street:"Rancho Del Oro",
        unit:"212",
        city:"Oceanside",
        state:"CA",
        square_footage:1200,
        price:"2000",
        bedrooms:2,
        bathrooms:2,
        pets:"yes",
        image:"../assets/images/apartment.jpeg"
    }
]
fl_apartments = [
    {
        street:"Grove Ave",
        unit:"833",
        city:"Altamonte Springs",
        state:"FL",
        square_footage:1500,
        price:"1,500",
        bedrooms:3,
        bathrooms:3.5,
        pets:"yes",
        image:"../assets/images/apartment.jpeg"
    }
]

  fl_apartments.each do |apartment|
    user1.apartments.create(apartment)
    p "creating: #{apartment}"
  end
  ca_apartments.each do |apartment|
    user2.apartments.create(apartment)
    p "creating: #{apartment}"
  end