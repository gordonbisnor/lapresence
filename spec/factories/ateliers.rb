FactoryBot.define do
  factory :atelier do
    title { "welcome" }
    start_date { Time.now }
    end_date { Time.now }
    notes { "Good notes" }
    content { "Good event" }
    location { "here" }
    schedule { "yes" }
    cost { "FREE" }
    available_spots { "2" }
    published { true }
  end
end
