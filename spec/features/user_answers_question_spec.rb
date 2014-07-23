require 'rails_helper'

feature 'User answers question' do
  scenario 'and the answer is created successfully when valid' do
    answer = build_stubbed(:answer)
    visit new_answer_path
    fill_in 'Content', with: answer.content
    click_button 'Submit'
    expect(page).to have_content(answer.content)
    expect(page).to have_content(answer.question.content)
  end

  scenario 'and can see all the answers for that question' do
    answer1 = create(:answer, content: 'Do this')
    create(:answer, content: 'Do that')
    visit question_path(answer1.question)
    expect(page).to have_content('Do this')
    expect(page).to have_content('Do that')
  end
end
