
//通用卡片
@Preview
@Component
struct NormalCard {
  //卡槽
  @BuilderParam
  cardFun: () => void

  /*@BuilderParam
  cardFun1: () => void*/

  marginData?:Margin

  build() {
    Column() {
      Column() {
        if (this.cardFun) {
          this.cardFun()
        }
      }
      //当空间占满之后 没办法设置外间距3

    }.backgroundColor(Color.White)
    .padding(10)
    .borderRadius(20)
    .margin(this.marginData?this.marginData:{ left: 14.5, right: 14.5,top:20 })

  }
}

export {NormalCard}