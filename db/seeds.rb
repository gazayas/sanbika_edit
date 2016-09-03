song_params = [
  [
    title: '賛美しよう',
    title_yomikata: 'さんびしよう',
    key: 'C',
    body: '*C*   *Am*   *F*   *Cb*<br/>賛美歌の歌詞はここに入ります'
  ],
  [
    title: '愛である',
    title_yomikata: 'あいである',
    key: 'C',
    body: '*C*   *Am*   *F*   *Cb*<br/>賛美歌の歌詞はここに入ります'
  ]
]

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
  2.times do |n|
    user.songs.create!(song_params[n])
  end
  user
end
