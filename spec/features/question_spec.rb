require 'rails_helper'

feature 'Manage questions' do
  scenario 'lists all questions on #index' do
    q1, q2 = create_list(:question, 2)
    visit questions_path
    expect(page).to have_content(q1.title)
    expect(page).to have_content(q2.title)
  end

  scenario 'allows user to add a new question and view it' do
    question = build(:question)
    visit new_question_path
    fill_in 'Title', with: question.title
    fill_in 'Content', with: question.content
    click_button 'Submit'
    question.save!
    expect(page).to have_content(question.title)

    visit question_path(question)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.content)
  end
end
