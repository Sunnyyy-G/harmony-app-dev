import router from '@ohos.router'

let params = router.getParams()as Record<string,string>
let name = params['name']
@Entry
@Component
struct TechHome {
  build() {
    Column(){
      Text('欢迎用户：'+name)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#ffe3cdcd')
  }
}