void setup() {//アニメーションの前に一度だけ実行する命令を描く
  size(400, 400);//ウィンドウのサイズの指定
  noStroke();//ウィンドウの枠線なし
  minim = new Minim(this);//初期化
  PImage img;//PImage 型の変数 img を宣言
  img=loadImage("main9.png");// PImage 型の変数 img に画像データの main9.png を読み込む
  img.resize(width, height);//背景としたい画像のサイズをウィンドウの大きさと一致させる
  background(img);//背景を背景としたい画像に設定する

  for (i=0; i<4; i++) {//行方向
    for (j=0; j<6; j++) {//列方向
      showblock[i][j]=2;//初期値
    }
  }
}
float x=10;//初めにボールが出てくる場所のｘ座標
float y=150;//初めにボールが出てくる場所のｘ座標
float ball_w=5;//ボールの幅
float ball_h=5;//ボールの高さ
float racket_w=50;//ラケットの幅
float racket_h=3;//ラケットの高さ
float dx=1;//ボールのｘ座標における移動量
float dy=2;//ボールのｙ座標における移動量
float MouseX;// float型の変数 MouseX を宣言

int img;// int型の変数 img を宣言
int count=0;//初期値
int [][]showblock=new int[4][6];// int型で4行×5列の二次元配列を定義
int i, j;// int型の変数 i,j を宣言 (カウンター)


void draw() {//{}の中が一定時間間隔ごとに繰り返し実行される

  PImage img;//PImage 型の変数 img を宣言
  img=loadImage("main9.png");//PImage 型の変数 img に画像データの main9.png を読み込む
  img.resize(width, height);//背景としたい画像のサイズをウィンドウの大きさと一致させる
  background(img);//背景を背景としたい画像に設定する


  MouseX = mouseX-racket_w/2;//マウスの反応をラケットの中心に持っていきたいために、新たにMouseXを設定する

  fill(0, 0, 255);//ボールについての塗りつぶしの色指定
  noStroke();//ボールについて枠線なし
  rect(x, y, ball_w, ball_h);//ボールの描画
  if (x>width) {  //ウィンドウの横幅よりボールのx座標が大きいとき、ボールを横の壁で跳ね返す
    dx=-1;//ボールのｘ座標における移動を逆向きにする
    player=minim.loadFile("game sound1.MP3");//game sound1.MP3をロードする
    player.play();//再生
  } else if (x<0) {//ボールのｘ座標が0より小さいとき
    dx=1;//ボールのｘ座標における移動を逆向きにする
    player=minim.loadFile("game sound1.MP3");//game sound1.MP3をロードする
    player.play();//再生
  }

  if (y<0) {//ボールのｘ座標が0より小さいとき、ボールを縦の壁で跳ね返す
    dy=2;//ボールのｙ座標における移動を逆向きにする
  } 

  x=x+dx;//ボールをx軸方向に動かす
  y=y+dy;//ボールをy軸方向に動かす


  for (i=0; i<4; i++) {//行方向
    for (j=0; j<6; j++) {//列方向
      if (showblock[i][j]==2) {//ブロックが消えるまで残り2回の時

        noFill();//ブロックについての塗りつぶしなし
        stroke(0);//ブロックについて枠線なし
        block(j, i);//blockという関数の変数m,nにi,jを代入
      }
      //checkhitBlock(j, i, x, y);
      switch(checkhitBlock(j, i, x, y)) {//switch文で関数checkhitBlockを呼び出す
      case 1://ボールがブロックに上から当たった時
        ball_direction_check_y();
        showblock[i][j]=showblock[i][j]-1;//showblockの値を1引く
        break;//処理止め

      case 2://ボールがブロックに下から当たった時
        ball_direction_check_y();
        showblock[i][j]=showblock[i][j]-1;//showblockの値を1引く
        break;//処理止め

      case 3://ボールがブロックに左から当たった時
        ball_direction_check_x();
        showblock[i][j]=showblock[i][j]-1;//showblockの値を1引く
        break;//処理止め

      case 4://ボールがブロックに右から当たった時
        ball_direction_check_x();
        showblock[i][j]=showblock[i][j]-1;//showblockの値を1引く
        break;//処理止め
      }


      switch(showBlock()) { //switch文で関数showBlockを呼び出す
      case 1://ブロックが消えるまで残り2回であることを示す
        noFill();////ボールについて塗りつぶしなし
        stroke(255);////ボールについての枠線の色指定
        break;//処理止め



      case 2://ブロックが消えるまで残り１回であることを示す
        fill(255, 20, 147);//ブロックについての塗りつぶしの色指定
        block(j, i);//blockという関数の変数m,nにi,jを代入
        break;//処理止め
      }
    }


    if (checkHit(x, y)) {//x座標において、ラケットの左端から右端までの範囲にボールがあるとき
      dy = -2;//ボールのｙ座標における移動を逆向きにする
    }
    if (y>width) {//ボールがウィンドウの下端よりも下に行ったら
      textSize(50);//文字サイズの大きさ
      fill(255, 0, 0);//文字の色
      text("GAME OVER", 55, 200);//("表示したい文字",x座標,y座標)
      dy=0;//ボールの動きを止める
      dx=0;//ボールの動きを止める
    }
    if (count==48) { //ブロック(24個)にボールが(24×2=)48回当たったら
      textSize(50);//文字サイズの大きさ
      fill(0, 191, 255);//文字の色
      text("GAME CLEAR", 50, 200);//("表示したい文字",x座標,y座標)
      dy=0;//ボールの動きを止める
      dx=0;//ボールの動きを止める
    }

    racket_position();//racket_positionという関数を呼び出す
  }
}
