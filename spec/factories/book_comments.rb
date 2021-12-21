FactoryBot.define do
  factory :book_comment do
    user_id { 1 }
    book_id { 1 }
    comment { "MyString" }
  end
end
