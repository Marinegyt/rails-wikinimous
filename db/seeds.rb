require 'faker'
Article.destroy_all

10.times do
  a = Article.create(title: Faker::Fantasy::Tolkien.character, content: Faker::Fantasy::Tolkien.poem)
end
