class UsersController < ApplicationController
  # Это действие отзывается, когда пользователь заходит по адресу /users
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Artem',
        username: 'aspeiro3',
        avatar_url: 'https://aspeiro3.github.io/cv/images/foto.jpeg'
      ),
      User.new(
        id: 2,
        name: 'Misha',
        username: 'aristofun'
      )
    ]
  end

  def new
  end

  def edit
  end

  # Это действие отзывается, когда пользователь заходит по адресу /users/:id,
  # например /users/1.
  def show
    # Болванка пользователя
    @user = User.new(
      name: 'Artem',
      username: 'aspeiro3',
      avatar_url: 'https://aspeiro3.github.io/cv/images/foto.jpeg'
    )

    # Болванка вопросов для пользователя
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'Что?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'Где?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'Когда?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'Зачем?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'Почему?', created_at: Date.parse('15.06.2020')),
      Question.new(text: 'В чем смысл?', created_at: Date.parse('15.06.2020'))
    ]

    # Болванка ответов
    @answers = []

    # Болванка для нового вопроса
    @new_question = Question.new
  end
end
