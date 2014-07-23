require 'rails_helper'

feature 'User answers question' do
  scenario 'and the answer is created successfully when valid' do
    question = create(:question, content: 'What do I do?')
    build_stubbed(:answer, question_id: question.id)

    visit new_question_answer_path(question.id)
    fill_in 'Content', with: 'Do this'
    click_button 'Submit'

    expect(page).to have_content('What do I do?')
    expect(page).to have_content('Do this')
  end

  scenario 'and can see all the answers for that question' do
    question = create(:question)
    create(:answer, question_id: question.id, content: 'Do this')
    create(:answer, question_id: question.id, content: 'Do that')

    visit question_path(question)

    expect(page).to have_content('Do this')
    expect(page).to have_content('Do that')
  end
end
