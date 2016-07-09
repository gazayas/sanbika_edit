#賛美歌

ユーザーがメールを送らずに自由に自分のパスワードを編集できるからその部分を削除すること

###これからやらないときえないこと
1. UserやSongのモデルの全ての必要の属性の定義
2. モデルのバリデーション（:emailの正規表現とか, presence: true とか）
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
1. status:string (現在の気分のこと。バリデーションでツイッターと同じ文字数を限定すること)<br/>
2. church:string<br/>
3. bio:text<br/>

読み方があると、indexで順番に見せることができる
歌のshowでは実際に見せない（多分「読み方を見せます？」というのをcheckboxで聞く。trueかfalse）
後は、この次のリンクを見て、全ての歌を五十音順にすること：
http://kiyotakakubo.hatenablog.com/entry/20091027/1256660387

###user/index.html.erbに
写真 ユーザー名 今の気分（この部分をtruncateする） 友達であるかどうか（チェックかプラス記号）
このようにリストを作ること

###key_change.jsで
keychangeで「♭」のコード

###その他
ホームページの最初に、最新の三つの曲（ajaxで１０秒毎に更新するようにすること）
ユーザーのnewやeditは一応動いてるけど_form.html.erbは作ってないな。その方がいいと思う
ログインする時に「#{@user.name}さん、お帰りなさい」を書くこと
Michael Hartl のチュートリアルにあった log_in メソッド

###すべてを気にしすぎるとデプロイすることはないから、最低限の必要な部分ができたらβを出して知り合いで共有する
いい感じになってたらツイートしていい