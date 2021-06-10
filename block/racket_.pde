boolean checkHit(float x, float y) {
  if (y + ball_h < width-65) return false;//ボールのy座標＋ボールの幅の大きさがラケットのy座標より小さいとき、falseを返す

  if (MouseX <= x && x <= MouseX + racket_w) {//x座標において、ラケットの左端から右端までの範囲にボールがあるとき
    return true;//trueを返す
  } else {//x座標において、ラケットの左端から右端までの範囲にボールがないとき
    return false;//falseを返す
  }
}
