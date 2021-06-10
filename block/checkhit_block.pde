int checkhitBlock(int m, int n, float k, float l) {//ボールの当たり判定
  if (25 + 60 * m < (k+ball_w) && 75 + 60 * m > (k+ball_w)) {//xの範囲
    if (25 + 30 * n == (l+ball_h)) {//yの範囲

      return 1;//ボールがブロックに上から当たった時の当たり判定
    }
  }
  if (25 + 60 * m < (k+ball_w) && 75 + 60 * m > (k+ball_w)) {//xの範囲
    if (45 + 30 * n == (l+ball_h)) {//yの範囲

      return 2;//ボールがブロックに下から当たった時の当たり判定
    }
  }
  if (25 + 30 * n < (l+ball_h) && 45 + 30 * n > (l+ball_h)) {//yの範囲
    if (25 + 60 * m == (k+ball_w)) {//xの範囲

      return 3;//ボールがブロックに左から当たった時の当たり判定
    }
  }  
  if (25 + 30 * n < (l+ball_h) && 45 + 30 * n > (l+ball_h)) {//yの範囲
    if (75 + 60 * m == (k+ball_w)) { //xの範囲

      return 4;//ボールがブロックに右から当たった時の当たり判定
    }
  }
  return 0;
}
