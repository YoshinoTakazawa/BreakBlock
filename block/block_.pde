void block(int m, int n) {//ブロックを描く
  if ( showblock [i][j] > 0) {//ブロックが表示されているとき
    rect( 25 + 60 * m, 25 + 30 * n, 50, 20);//ブロックの表示位置と大きさ
  }
}
