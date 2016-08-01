#賛美歌

最低限のCSS（Bootstrapを使ったら簡単かな）
モデルのバリデーションを確認
home page の追加

###これからやらないといけないこと
1. UserやSongのモデルの全ての必要の属性の定義
2. モデルのバリデーション（後は何が残ってるかな）
3. エラーの表示はめちゃくちゃだけどとにかく表示される。shared/errors_messages...?教科書で確認すること
4. 外見を綺麗にすること
5. Testを作ること
6. コントローラにbefore_filterが適当な場所にあるか確認して、テストで確認すること
7. key_change.jsのリファクとリング


###モデルの方
songモデルに:<br/>
1. song_yomikata (string) # 読み方<br/>
2. artist (string) # 作曲者<br/>
3. artist_yomikata (string)<br/>
4. sheet_music (data) # 楽譜... これはいいかな。ウェブサイトをデプロイしてから<br/>

Userモデルに:<br/>
1. photo:data<br/>
2. church:string<br/>
3. bio:text<br/>
これらの属性が今の段階では要らないけど、デプロイしたらせめてphotoを追加することが大事かな

###user/index.html.erbに
写真 ユーザー名 今の気分（この部分をtruncateする） 友達であるかどうか（チェックかプラス記号）
このようにリストを作ること

###その他
ホームページの最初に、最新の三つの曲（ajaxで１０秒毎に更新するようにすること）
またホームページの最初に、「sanbika.jpへようこそ！」を書いて、短い説明を書く（賛美歌チャートをブラウズ、ユーザーをブラウズ）
ユーザーのnewやeditは一応動いてるけど_form.html.erbは作ってないな。その方がいいと思う
ログインする時に「#{@user.name}さん、お帰りなさい」を書くこと（flash[:notice]でいいと思う）
Michael Hartl のチュートリアルにあった log_in メソッド（sessions_helper?）

###すべてを気にしすぎるとデプロイすることはないから、最低限の必要な部分ができたらβを出して知り合いで共有する
いい感じになったらツイートするかな






賛美歌チャートのtitle_yomikataで整理するためには、次のリンクが役に立ったけど、
jsの方ではなくてRubyの方で、ヘルパーメソッドで配列をソートしてから（array.sort）、
ビューに出力しました
http://www.nishishi.com/javascript/2014/sort-by-charcode.html

以下の記事はまあいいけどあんまり使わなかった（データベースの「title_yomikata」を整理するために）
http://d.hatena.ne.jp/pasela/20080909/postgres
http://qiita.com/anoworl/items/af9f12f915b8969ea40d
http://kiyotakakubo.hatenablog.com/entry/20091027/1256660387
