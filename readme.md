#賛美歌

users_controller.rb の配列を上手くソートしてリストを返すこと...

Song.rbのバリテーション

###これからやらないときえないこと
1. UserやSongのモデルの全ての必要の属性の定義
2. モデルのバリデーション（後は何が残ってるかな）
3. エラーの表示はめちゃくちゃだけどとにかく表示される。shared/errors_messages...?教科書で確認すること
4. 外見を綺麗にすること
5. Testを作ること

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

読み方があると、indexで順番に見せることができる
歌のshowでは実際に見せない（多分「読み方を見せます？」というのをcheckboxで聞く。trueかfalse）
後は、この次のリンクを見て、全ての歌を五十音順にすること：
http://www.nishishi.com/javascript/2014/sort-by-charcode.html

データベースはもう既に ja_JP.UTF8 だったけど...
http://d.hatena.ne.jp/pasela/20080909/postgres
http://qiita.com/anoworl/items/af9f12f915b8969ea40d

http://kiyotakakubo.hatenablog.com/entry/20091027/1256660387



###user/index.html.erbに
写真 ユーザー名 今の気分（この部分をtruncateする） 友達であるかどうか（チェックかプラス記号）
このようにリストを作ること

###key_change.jsで
keychangeで「♭」のコード

###その他
ホームページの最初に、最新の三つの曲（ajaxで１０秒毎に更新するようにすること）
またホームページの最初に、「「賛美歌」へようこそ！」を書いて、短い説明を書く
そして、直接songsのリストじゃなくて、songs_pathへ繋がる「賛美歌のチャートのリスト」のlink_toを作ること
ユーザーのnewやeditは一応動いてるけど_form.html.erbは作ってないな。その方がいいと思う
ログインする時に「#{@user.name}さん、お帰りなさい」を書くこと
Michael Hartl のチュートリアルにあった log_in メソッド

###すべてを気にしすぎるとデプロイすることはないから、最低限の必要な部分ができたらβを出して知り合いで共有する
いい感じになってたらツイートしていい




    <span id="songs_array">
        <% array = [] %>
        <% @songs.each do |song| %>
          <% array << song.title_yomikata %>
        <% end %>
        <%= array %>
    </span>

    <script>
      // 賛美歌チャートを五十音順にソートする
      var songs_array = document.getElementById("songs_array");
      songs_array = songs_array.innerHTML;
      console.log(songs_array);
      songs_array = songs_array.replace(/\[|\]|"| /g,'').split(',');
      songs_array = songs_array.sort();
      console.log(songs_array);
    </script>