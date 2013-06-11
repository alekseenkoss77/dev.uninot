# coding: utf-8
class AddUsersRecords < ActiveRecord::Migration
  def up
    # йа - админ
    User.create!(
      :email  => "alekseenkoss@gmail.com",
      :name   => "Алексеенко Сергей Сергеевич",
      :role   => "admin",
      :password => "Sa82SHf89vm",
      :password_confirmation => "Sa82SHf89vm"
    )
    # тестовый акк старосты
    User.create!(
      :email  => "test@service.ru",
      :name   => "Тестовый Аккаунт",
      :role   => "warden",
      :password => "fj4a894^Da",
      :password_confirmation => "fj4a894^Da"
    )
    # тестовый акк препода
    User.create!(
      :email  => "teacher@service.ru",
      :name   => "Тестовый Аккаунт",
      :role   => "teacher",
      :password => "fj4a894^Da",
      :password_confirmation => "fj4a894^Da"
    )
  end

  def down
  end
end
