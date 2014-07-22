require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'validates the presence of title' do
    question = Question.new
    question.save
    expect(question).not_to be_valid
    expect(question.errors).to have_key :title
  end

  it 'validates the presence of content' do
    question = Question.new
    question.save
    expect(question).not_to be_valid
    expect(question.errors).to have_key :content
  end
end
