feature 'Main' do
  scenario 'should success open main page' do
    visit 'http://sitepokupok.ru'
    expect(page).to have_content('Сайт Покупок в Москве')
  end

  scenario 'should see login validation error' do
    visit 'http://sitepokupok.ru'
    click_link 'Войти'

    within('#login-form') do
      fill_in 'User[login]', with: 'ssnikolay'
      fill_in 'User[password]', with: 'something_password'
      click_button 'Войти'
    end

    expect(page).to have_content('Неверное имя пользователя или пароль')
  end

  scenario 'should success login' do
    visit 'http://sitepokupok.ru'
    click_link 'Войти'

    within('#login-form') do
      fill_in 'User[login]', with: 'ssnikolay'
      fill_in 'User[password]', with: 'password'
      click_button 'Войти'
    end

    expect(page).to have_link('Выйти')
  end
end
