require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { subject }
  before { expect(question).not_to be_valid }

  it 'validates the presence of title' do
    expect(question.errors).to have_key :title
  end

  it 'validates the presence of content' do
    expect(question.errors).to have_key :content
  end
end
