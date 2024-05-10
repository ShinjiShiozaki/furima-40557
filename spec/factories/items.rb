FactoryBot.define do
  factory :item do
    mei                 {'テスト商品名'}
    setsumei            {'テスト商品の説明文'}
    category_id         {2}
    jyoutai_id          {2}
    haisouryou_futan_id {2}
    todoufuken_id       {2}
    hassou_nissuu_id    {2}
    kakaku              {1000}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
