require 'rails_helper'

feature 'Manage questions' do
  scenario 'lists all questions on #index' do
    q1, q2 = create_list(:question, 2)

    visit questions_path

    expect(page).to have_content(q1.title)
    expect(page).to have_content(q2.title)
  end

  scenario 'allows user to add a new question and view it' do
    build_stubbed(:question)

    visit new_question_path
    fill_in 'Title', with: 'What do I do?'
    fill_in 'Content', with: 'Help me'
    click_button 'Submit'

    expect(page).to have_content('What do I do?')

    click_link 'What do I do?'

    expect(page).to have_content('What do I do?')
    expect(page).to have_content('Help me')
  end
end
