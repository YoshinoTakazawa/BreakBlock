int showBlock() { 
  if (showblock[i][j] == 2) {//showblockの値が2の時
    return 1;//1を返す
  }
  if (showblock[i][j] == 1) {//showblockの値が1の時
    return 2;//2を返す
  }
  return 0;
}
