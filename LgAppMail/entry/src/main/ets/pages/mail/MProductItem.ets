import promptAction from '@ohos.promptAction'
import Item from './model/Item'

@Component
export struct MProductItem {
  @ObjectLink item: Item

  build() {

    Row({ space: 10 }) {
      Image(this.item.image)
        .width(90)
      Column({ space: 5 }) {
        Text(this.item.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        if (this.item.discount) { //是否存在且不为null或undefined
          Text('原价：￥' + this.item.price)
            .fontColor('#CCC')
            .fontSize(14)
            .decoration({ type: TextDecorationType.LineThrough }) //设置文本装饰线
          Text('出手价：￥' + this.item.discount)
            .fontColor('#F36')
            .fontSize(15)
        } else {
          Text('￥' + this.item.price)
            .fontColor('#F36')
            .fontSize(15)
        }
      }
      .height('100%')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)

      Blank()

      Image(this.item.isLove ? $r("app.media.icon_red") : $r("app.media.icon_col"))
        .width(28)
        .height(28)
        .objectFit(ImageFit.Contain)
        .margin(20)
        .onClick(() => {
          this.btnSubmit()
        })
    }
    .width('100%')
    .backgroundColor('#FFF')
    .borderRadius(20)
    .height(120)
    .padding(10)

  }

  btnSubmit(): void {
    this.item.isLove = !this.item.isLove
    // console.log(" " + this.item.isLove)

    promptAction.showDialog({
      title: '联系方式',
      message: '请联系' + this.item.userName + "" + this.item.phone,
      buttons: [
        {
          text: '取消',
          color: '#000000',
        },
        {
          text: '确定',
          color: 'red',
        }
      ],

    }, (err, data) => {
      if (err) {
        console.info('showDialog err: ' + err);
        return;
      }
      // console.info('showDialog success callback, click button: ' + data.index);//0取消，1确认
    })

  }
}
