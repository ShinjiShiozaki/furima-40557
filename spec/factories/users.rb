FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    sei_kanji             { '山田' }
    mei_kanji             { '太郎' }
    sei_kana              { 'ヤマダ' }
    mei_kana              { 'タロウ' }
    tanjyoubi             { '1980-01-12' }
  end
end
