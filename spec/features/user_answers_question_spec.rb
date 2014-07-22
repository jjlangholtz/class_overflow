require 'rails_helper'

feature 'User answers question' do
  scenario 'and the answer is created successfully when valid' do
    answer = build(:answer)
    visit new_answer_path
    fill_in 'Answer', with: answer.content
    click_button 'Submit'
    expect(page).to have_content(answer.content)
  end
end
