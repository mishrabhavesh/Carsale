1000.times do |registration_year|
    RegistrationYear.create!(name: "#{2000 + registration_year}" )
end