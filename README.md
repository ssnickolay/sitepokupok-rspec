# sitepokupok-rspec
Тесты для текущей вресии sitepokupok.ru

## Создание своей версии проекта:
1. Сделать fork https://github.com/ssnikolay/sitepokupok-rspec
2. `$ cd TO_PROJECTS_FOLDER`
3. `$ git clone git@github.com:YOUR_ACCOUNT/sitepokupok-rspec.git`

## Установка проекта:
1. `$ gem install bundler`
2. `$ bundle install`

## Запуск проекта:
1. `bundle exec rspec`

## Что нужно оттестировать
1. Залогинившись под своим пользователем, я отредактировал свой пол
2. Как пользователь, я вижу что свой баланс 0 (на странице https://sitepokupok.ru/purse/index)
3. Как пользователь, перейдя на страниу "http://sitepokupok.ru/stock" я вижу 2 блока "Популярная закупка".
4. Перейдя на страницу первой популярной закупки, я вижу ссылку "Открыта (идёт набор заказов)"
