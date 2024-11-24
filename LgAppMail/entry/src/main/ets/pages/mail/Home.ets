import Item from './model/Item'
import { MProductItem } from './MProductItem'

@Component
export default struct Home {

  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.mail_mate60'), 6999,3000,false,"王女士","18125545656"),
    new Item('MateBookProX', $r('app.media.mail_mateBookProX'), 13999,8000,false,"张先生","13800525445"),
    new Item('WatchGT4', $r('app.media.mail_watchGT4'), 1438,600,false,"汪明","15925545656"),
    new Item('FreeBuds Pro3', $r('app.media.mail_freeBudsPro3'), 1499,1000,false,"李四","18125545656"),
    new Item('FreeBuds Pro3', $r('app.media.mail_freeBudsPro3'), 1499,600,false,"王女士","18125545656"),
    new Item('Mate X5', $r('app.media.mail_mateX5'), 12999,7890,false,"吴三","13023156987")
  ]

  build() {
    Column({ space: 8 }) {
      Row() {
        Text('二手闲置交易平台')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(20)
      .margin({ bottom: 5,left:10 })


      List({space: 8}) {
        ForEach(this.items, (i: Item) => {
            ListItem(){
              MProductItem({item:i})
            }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding({ top: 10, right: 10, left: 10 })
  }

}

