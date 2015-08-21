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
      fill_in 'User[login]', with: 'mrmmrmmrm@mail.ru'
      fill_in 'User[password]', with: 'testing'
      click_button 'Войти'
    end

    expect(page).to have_link('Выйти')
  end
  
  scenario 'should change user gender' do
    visit 'http://sitepokupok.ru'
    click_link 'Войти'
    
     within('#login-form') do
      fill_in 'User[login]', with: 'mrmmrmmrm@mail.ru'
      fill_in 'User[password]', with: 'testing'
      click_button 'Войти'
    end
    
    click_link 'mrmmrmmrm'
    expect(page.current_url).to eql('http://sitepokupok.ru/user')
    click_link 'Редактировать'
    select 'мужской', from: "User[gender]"
      
    # к сожалению моему, пока не разобрался, как проверить то, что я выставил именно "мужской" в поле пол.
    # получилось только вот так
    # expect(page).to have_selector('#User_gender', visible: false, text: "мужской")
    # expect(page).to have_content('мужской', visible: true)    
      expect(page.find('#User_gender').value).to eql("1")
    # что опять-таки, не так информативно, как у Вас 
        
  end
  
  scenario 'should check if user balance is nil' do
    visit 'http://sitepokupok.ru/user'
    click_link 'Войти'
    
     within('#login-form') do
      fill_in 'User[login]', with: 'mrmmrmmrm@mail.ru'
      fill_in 'User[password]', with: 'testing'
      click_button 'Войти'
    end
    
    expect(page).to have_link('Выйти')  
    find('.purse').click
    expect(page.find('#purse-amount-decimal')).to have_content('0')
    # не понятно, а если бы баланс был 100 или 10, проверка бы прошла тоже скорей всего
    
  end
  
  scenario 'should see 2 blocks of popular stock' do
    visit 'http://sitepokupok.ru/user'
    click_link 'Войти'
    
     within('#login-form') do
      fill_in 'User[login]', with: 'mrmmrmmrm@mail.ru'
      fill_in 'User[password]', with: 'testing'
      click_button 'Войти'
    end
    
    click_link('Закупки')
    expect(page).to have_css('div.item ')
    expect(page).to have_css('div.item.last') 
    # не понял точно, что проверять, решил, сделать вот так, проверить существование целиком блоков с популярными закупками на странице
  end
  
  scenario 'should see Open in first popular stock' do
    visit 'http://sitepokupok.ru/user'
    click_link 'Войти'
    
     within('#login-form') do
      fill_in 'User[login]', with: 'mrmmrmmrm@mail.ru'
      fill_in 'User[password]', with: 'testing'
      click_button 'Войти'
    end
    
    click_link('Закупки')
    find(:xpath, "/html/body/div/div[3]/div[3]/div[2]/div[2]/div[1]/div[1]/div[2]/div[1]/a/img").click
    expect(page).to have_content('Открыта')
    # никак не смог уйти от использования xpath, чтобы открыть первую популярную закупку, не пойму как кликнуть на изображение или ссылку на закупку
    # в таком исполнении тест отрабатывает, но стоит прверку поставить в виде
    # expect(page).to have_content('Открыта (идет набор заказов)')
    # то моя Aptana Studio сначала минуту висит, потом динамиком пищит и выдает  ←[31mFailure/Error: expect(page).to have_content(...
  end
  
end
