# require 'rails_helper'

# RSpec.describe User, type: :model do
#   subject { User.new(name: 'Lister', photo: 'url', bio: 'smeg head', post_counter: 4) }

#   before { subject.save }

#   it 'name should be present' do
#     subject.name = nil
#     expect(subject).to_not be_valid
#   end

#   it 'post_counter must be a interger greater or equal than zero' do
#     subject.post_counter = nil
#     expect(subject).to_not be_valid
#   end

#   it 'brings the latests user posts' do
#     allow(subject).to receive(:last_3_posts).and_return([{ post1: 1 }, { post2: 2 }, { post3: 3 }])
#     expect(subject.last_3_posts.length).to eq(3)
#   end
# end
