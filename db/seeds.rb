1000.times do |registration_year|
    Registrationyear.create!(name: "#{2000 + registration_year}" )
end