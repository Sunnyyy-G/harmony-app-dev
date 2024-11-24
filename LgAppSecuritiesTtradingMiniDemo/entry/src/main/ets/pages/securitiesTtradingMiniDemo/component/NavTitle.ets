import router from '@ohos.router'

@Preview
@Component
export struct NavTitle {
  @State backImage: Resource = $r('app.media.ic_back')
  @State backText: string = '返回'
  @State backTextColor: Color| string = Color.White   //前置字体背景色
  @State isShowBackText: boolean = true//是否有返回箭头
  @State titleText: string = '标题'
  @State titleColor: Color| string = Color.White//大标题颜色
  @State isTitleBold: boolean = false
  @State rightText: string = '右侧'
  @State rightTextColor: Color| string = Color.White//后置颜色
  @State isShowRightText: boolean = true
  @State bgColor:Color| string = Color.Black

  /***
   *  NavTitle({ rightClick: (): void => { console.info('onClickOK action') }})
   */

  //rightClick?: () => void;

  rightClick:() => void = () => {
  }

  build() {

    Stack({ alignContent: Alignment.Center }) {
      Row() {
        Image(this.backImage)
          .width(20)
          .height(20)
          .onClick(() => {
            router.back()
          })
        Text(this.backText)
          .fontSize(15)
          .fontColor(this.backTextColor)
          .visibility(this.isShowBackText ? Visibility.Visible : Visibility.Hidden)
          .onClick(() => {
            router.back()
          })

        Flex().layoutWeight(1)

        Text(this.rightText)
          .fontColor(this.rightTextColor)
          .fontSize(15)
          .fontColor(this.rightTextColor)
          .visibility(this.isShowRightText ? Visibility.Visible : Visibility.Hidden)
      }
      .width("100%")
      .onClick(() => {
        console.info('onClickOK action111');
        this.rightClick()
      })

      Text(this.titleText)
        .fontColor(this.titleColor)
        .fontSize(25)
        .fontWeight(this.isTitleBold ? FontWeight.Bold : FontWeight.Normal)

    }.padding({ left: 15, right: 15, top: 10, bottom: 10 })
    .backgroundColor(this.bgColor)
    .width("100%")

  }
}