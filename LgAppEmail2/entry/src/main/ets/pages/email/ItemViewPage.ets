import EmailInfo from './common/EmailInfo';
import router from '@ohos.router';

@Component
export default struct ItemViewPage {
  emailInfo?:EmailInfo
  isShowDivider:boolean = true
  build() {

      Column(){
        Row() {
          Image(this.emailInfo?.img)
            .width(25)
            .height(25)
          Text(this.emailInfo?.name)
            .fontSize(20)
            .margin({
              left:10
            })
          Blank()
          if(this.emailInfo?.isShowRedNotify)
            Text()
              .margin({right:30})
              .borderRadius(30)
              .backgroundColor(Color.Red)
              .width(5).height(5)
        }
        .padding({
          left:20
        })
        .backgroundColor(Color.White)
        .width('100%')
        .height(55)
        .onClick(()=>{
          if(this.emailInfo?.name == "通讯录"){
            router.pushUrl({url:"pages/email/ContactsListPage"})
          }
        })
        if(this.isShowDivider){
          Divider()
            .color("#ffeae9e9")
            .width("100%")
            .margin({left:60})
        }
      }
    }

}