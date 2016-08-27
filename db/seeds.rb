99.times do |n|
  name  = "user#{n}"
  email = "example-#{n+1}@example.org"
  password = "user#{n}"
  user = User.create!(
    name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now,
    )
  1.times do |i|
    user.songs.create!(
      title: "賛美歌#{i}",
      title_yomikata: "さんびか#{i}",
      key: "C",
      body: "*C*   *Am*   *F*   *Cb*<br/><br/>賛美歌の歌詞はここに入ります"
    )
  end
  user
end
