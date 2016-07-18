function KeyChange () {

  // 「b」か普通の「#」を書いたら「♭」や「♯」変換されるようにすること
  //これをsongs.coffeeに入れる？

  // 音符の定義
  var sharp_notes = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯"];
  var flat_notes = ["A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭"];
  var new_notes = [];

  // 転調の計算に必要な変数の取得や定義
  var original_key = document.getElementById("original_key").innerHTML;
  var new_key = document.getElementById("key_select").value;
  var original_key_position = sharp_notes.indexOf(original_key);
  var new_key_position = sharp_notes.indexOf(new_key);
  ++original_key_position;
  ++new_key_position;
  var difference;
  var key_up;

  var chords = document.getElementsByClassName("chord");

  // for文 (^o^)/
  var i;

  if (new_key_position > original_key_position) {
    console.log("オリジナルのキーより高いです。");
    difference = new_key_position - original_key_position;
    key_up = true;
  } else {
    console.log("オリジナルのキーより低いです。");
    difference = original_key_position - new_key_position;
    key_up = false;
  }

  // コード名をHTML要素に追加して、コードの種類を認識する
  for (i = 0; i < chords.length; i++) {

    var addition = "";
    var chord_name = chords[i].getAttribute("name");

    switch(true) {
      // chordをnameの属性から取得したので、正規表現で「dim7」などを除いて新しいchordのための計算する
      case /dim7/.test(chord_name):
        addition = "dim7";
        chord_name = chord_name.replace(/dim7/, "");
        break;
      case /dim/.test(chord_name):
        addition = "dim";
        chord_name = chord_name.replace(/dim/, "");
        break;
      case /2/.test(chord_name):
        addition = "2";
        chord_name = chord_name.replace(/2/, "");
        break;
      case /sus4/.test(chord_name):
        addition = "sus4";
        chord_name = chord_name.replace(/sus4/, "");
        break;
      case /sus/.test(chord_name):
        addition = "sus";
        chord_name = chord_name.replace(/sus/, "");
        break;
      case /maj7/.test(chord_name):
        addition = "maj7";
        chord_name = chord_name.replace(/maj7/, "");
        break;
      case /maj/.test(chord_name):
        addition = "maj";
        chord_name = chord_name.replace(/maj/, "");
        break;
      case /m7/.test(chord_name):
        addition = "m7";
        chord_name = chord_name.replace(/m7/, "");
        break;
      case /m/.test(chord_name):
        addition = "m";
        chord_name = chord_name.replace(/m/, "");
        break;
      case /7/.test(chord_name):
        addition = "7";
        chord_name = chord_name.replace(/7/, "");
        break;
      case /6/.test(chord_name):
        addition = "6";
        chord_name = chord_name.replace(/6/, "");
        break;
      case /9/.test(chord_name):
        addition = "9";
        chord_name = chord_name.replace(/9/, "");
        break;
      case /aug/.test(chord_name):
        addition = "aug";
        chord_name = chord_name.replace(/aug/, "");
        break;
      case /11/.test(chord_name):
        addition = "11";
        chord_name = chord_name.replace(/11/, "");
      default:
        break;
    }

    // 転調の計算と新しいコード配列の定義
    // 計算ができたら、addition（「dim7」など）を新しく計算されたchordに改めてくっつく
    // ところで以下のコードに関してはリファクとリングができるかもしれないけどそれはまた後でするかな
    if (original_key == new_key) {
      console.log("元のキーと同じです");
      chords[i].innerHTML = chords[i].getAttribute("name");
    }
    if (key_up == true) {
      if(/♭/.test(chord_name)) {
        var original_position = flat_notes.indexOf(chord_name) + 1;
        var new_position = original_position + difference;
        if (new_position > 12) {
          new_position -= 12;
        }
        --new_position;
        new_notes.push(flat_notes[new_position] + addition);
        chords[i].innerHTML = new_notes[i];
      } else {
        var original_position = sharp_notes.indexOf(chord_name) + 1;
        var new_position = original_position + difference;
        if (new_position > 12) {
          new_position -= 12;
        }
        --new_position; // 配列に上手く代入されるように（「0」から始まるから）
        new_notes.push(sharp_notes[new_position] + addition);
        chords[i].innerHTML = new_notes[i];
      }
    } else if (key_up == false) { //下がったと
      if(/♭/.test(chord_name)) {
        var original_position = flat_notes.indexOf(chord_name) + 1;
        var new_position = original_position - difference;
        if (new_position < 1) {
          new_position += 12;
        }
        --new_position;
        new_notes.push(flat_notes[new_position] + addition);
        chords[i].innerHTML = new_notes[i];
      } else {
        var original_position = sharp_notes.indexOf(chord_name) + 1;
        var new_position = original_position - difference;
        if (new_position < 1) {
          new_position += 12;
        }
        --new_position; // 配列に上手く代入されるように（「0」から始まるから）
        new_notes.push(sharp_notes[new_position] + addition);
        chords[i].innerHTML = new_notes[i];
      }
    }
  } // 大きなfor文の終わり (・ω・)
}
