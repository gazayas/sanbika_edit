#賛美歌

大体の形はできてると思うので発表したいと思います
他の機能を後で追加したいと思います

###これからやらないといけないこと

「メールを表示しますか？」のboolをuser migrationに追加する
そしてtrueならshow.html.erbで表示するようにすること

モデルのバリデーション（チャートの長さを20にするかな）

コントローラーにbefore_filterが適当な場所にあるか確認して、テストで確認すること

自分の歌だけを検索する機能 (そんなに難しいはずはない。もうメソッドがあるからその関数を自分のチャートにかけて検索すればいいかもしれない)

UserやSongのモデルの属性（写真などを追加する。gemがあると思う。パーフェクトRuby on Railsを参照すること）

テスト（Rspec）
エラーの表示

###モデルの方
songモデルに:<br/>
1. 動画のリンク？要らないかな
2. sheet_music (data) # 楽譜... これはいいかな。ウェブサイトをデプロイしてから<br/>

Userモデルに:<br/>
1. photo:data<br/>
2. church:string<br/>
3. bio:text<br/>
これらの属性が今の段階では要らないけど、デプロイしたらせめてphotoを追加することが大事かな

###users/index.html.erbに（つまり全てのユーザーのリストのページ）
写真 ユーザー名 今の気分（この部分をtruncateする） 友達であるかどうか（チェックかプラス記号）
このようにリストを作ること

###その他
ホームページの最初に、最新の三つの曲（ajaxで１０秒毎に更新するようにすること）
users/_form.htmlを作る？_ パスワード更新は特別な扱いがあるから大丈夫かな
Michael Hartl のチュートリアルにあった log_in メソッド（sessions_helper?）。これを使ってテストが書きやすいかも

###すべてを気にしすぎるとデプロイすることはないから、最低限の必要な部分ができたらβを出して知り合いで共有する
いい感じになったらツイートしたいと思う



賛美歌チャートのtitle_yomikataで整理するためには、次のリンクが役に立ったけど、
jsの方ではなくてRubyの方で、ヘルパーメソッドで配列をソートしてから（array.sort）、
ビューに出力しました。
それでも、songs_order()というヘルパーメソッドを作ったけど、配列の整理をコントローラーの方でしたい
http://www.nishishi.com/javascript/2014/sort-by-charcode.html

以下の記事はまあいいけどあんまり使わなかった（データベースの「title_yomikata」を整理するために）
http://d.hatena.ne.jp/pasela/20080909/postgres
http://qiita.com/anoworl/items/af9f12f915b8969ea40d
http://kiyotakakubo.hatenablog.com/entry/20091027/1256660387
