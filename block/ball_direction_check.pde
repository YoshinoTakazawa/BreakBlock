void ball_direction_check_y() {//ボールがブロックに当たった時のボールのy座標について
  if (showblock[i][j] > 0) {//ブロックが表示されているとき
    dy=-dy;//ボールがブロックに当たったら跳ね返る
    count=count+1;//countが１ずつ増えていく
    player=minim.loadFile("game sound2.MP3"); //game sound2.MP3をロードする
    player.play();//再生

    //}else{ 
    //dy=dy;//ブロックがないときそのまま通る
  }
}

void ball_direction_check_x() {//ボールがブロックに当たった時のボールのx座標について
  if (showblock[i][j] > 0) {//ブロックが表示されているとき
    dx=-dx;////ボールがブロックに当たったら跳ね返る
    count=count+1;//countが１ずつ増えていく
    player=minim.loadFile("game sound2.MP3"); //game sound2.MP3をロードする
    player.play();//再生
    //}else{  
    //dx=dx;//ブロックがないときそのまま通る
  }
}
