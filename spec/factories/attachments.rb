# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    name "Photo"
    document "test.pdf"
    document_type "user"
  end
end
