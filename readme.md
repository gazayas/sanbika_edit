#賛美歌

###今のところは、コードがめちゃくちゃで汚い
といえども、動くwwww
とにかくgithubに載せてブランチを作りつつ開発をしていった方がいいかなと思ってた

###これからやらないときえないこと
1. UserやSongのモデルのレコードの定義
2. パスワード更新の機能
3. 外見を綺麗にすること
4. Testを作ること

###すべてを気にしすぎるとデプロイすることはないから、最低限の必要な部分ができたらβを出して知り合いで共有する
いい感じになってたらツイートしていい

###モデルの方
songモデルに:
1. song_yomikata (bool) # 読み方
2. artist (string) # 作曲者
3. artist_yomikata (string)
4. sheet_music (data) # 楽譜

Userモデルに:
1. feeling:string (バリデーションでツイッターと同じ文字数を限定すること)
2. church:string
3. bio:text

rake db:reset をしてから Song.rb に yomikata と show_yomikata を追加すること

songのモデルで :yomikata を作って、presence: true にする
読み方があると、indexで順番に見せることができる
歌のshowでは実際に見せない（多分「読み方を見せます？」というのをcheckboxで聞く。trueかfalse）
後は、この次のリンクを見て、全ての歌を五十音順にすること：
http://kiyotakakubo.hatenablog.com/entry/20091027/1256660387

#user/index.html.erbに
写真 ユーザー名 今の気分（この部分をtruncateする） 友達であるかどうか（チェックかプラス記号）
このようにリストを作ること

#song/new.html.erb
人は曲を作成する時：
* の使い方
歌の本当の作者を書くなら、直接 body に書いてください

###key_change.jsで
keychangeで「♭」のコード

###その他
ホームページの最初に、最新の三つの曲（ajaxで１０秒毎に更新するようにすること）
ユーザーのnewやeditは一応動いてるけど_form.html.erbは作ってないな。その方がいいと思う
ログインする時に「#{@user.name}さん、お帰りなさい」を書くこと
