require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Red Dwarf', text: 'some text', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'title should be present' do 
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comment_counter must be a interger greater or equal than zero' do 
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'like_counter must be a interger greater or equal than zero' do 
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'updates posts counter' do
    allow(subject).to receive(:update_posts_counter).and_return(1)
    expect(subject.update_posts_counter).to eq(1);
  end

  it 'returns last 5 comments' do
    allow(subject).to receive(:last_5_comments).and_return([{comment1: 1}, {comment2: 2}, {comment3: 3}, {comment4: 4}, {comment5: 5}])
    expect(subject.last_5_comments.length).to eq(5);
  end

  it 'updates like counter' do
    allow(subject).to receive(:update_likes_counter).and_return(1)
    expect(subject.update_likes_counter).to eq(1);
  end
end