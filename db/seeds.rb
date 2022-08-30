# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'John Doe', photo: 'A url', bio: 'A full stack web developer');
user2 = User.create(name: 'Jose Ramon', photo: 'A url', bio: 'A front-end web developer');
user3 = User.create(name: 'Jane Doe', photo: 'A url', bio: 'A back-end web developer');


post1 = Post.create(title: 'Ruby on Rails', text: 'I started leaningn RoR recently', user_id: user1.id);
post2 = Post.create(title: 'chromDriver?', text: 'I started making bread', user_id: user1.id);
post3 = Post.create(title: 'Capybara sucks', text: 'lmao', user_id: user2.id);
post4 = Post.create(title: 'I know', text: 'roflmao', user_id: user3.id);
post5 = Post.create(title: 'ror code', text: 'I started making sugar cane juice', user_id: user1.id);

Comment.create(post: post5, user: user3, text: 'Add some lemon to it')
Like.create(post: post5, user: user3)
