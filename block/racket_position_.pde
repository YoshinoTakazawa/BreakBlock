void racket_position() {//ラケットを描く
  fill(255, 140, 0);//ラケットについての塗りつぶしの色指定
  noStroke();//ラケットについて枠線なし
  
  if ( MouseX <= 0) {
    rect(0, width-65, racket_w, racket_h);//ウィンドウの右端でラケットを止める
  } else if (width-racket_w <= MouseX) {
    
    rect(350, width-65, racket_w, racket_h);//ウィンドウの左端でラケットを止める
  } else {
    
    rect(MouseX, width-65, racket_w, racket_h);//ウィンドウ内でラケットを動かす
    
  }
}
