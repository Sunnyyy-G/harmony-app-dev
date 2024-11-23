import router from '@ohos.router';
import { INews, newsInfo } from './NewsInfo';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct NewsDetailCase {
  @State news: INews = newsInfo[0] //给一个初始值

  /*@Builder NavigationMenus() {
    Row() {
      Image($r('app.media.ic_public_contacts'))
        .width(24)
        .height(24)
    }
  }*/

  @Builder
  NavigationTitle() {
    Column() {
      Text(this.news.title)
        .fontSize(20)
        .fontWeight(700)
        .margin({ left: 5, right: 5 })
    }.alignItems(HorizontalAlign.Start)
  }

  onPageShow(): void {
    // this.getUIContext().getRouter().getParams()
    if (router.getParams() != undefined) {
      this.news = router.getParams() as INews
    }
  }

  build() {

    //头部,Navigation路由导航的根视图容器
    Navigation() {
      //页头
      Row() {
        //发布者头像
        Image($r("app.media.ic_public_contacts"))
          .width(32)
          .height(32)

        Column() {
          //发布者名称
          Text(this.news.author)
          Text(`${this.news.time}·${this.news.area}`)
            .fontSize(10)
            .fontColor('#999')
        }.layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 4 })

        Row({ space: 5 }) {
          Image($r('app.media.icon_message'))
            .height(20)
          //跟帖数
          Text(this.news.msgCount > 10000 ? this.news.msgCount / 10000 + "万" : String(this.news.msgCount));
        }.backgroundColor('#e3e4e5')
        .padding({
          left: 10,
          right: 10,
          top: 5,
          bottom: 5
        })
        .borderRadius(20)
      }.width('100%')
      .margin({ top: 10, bottom: 10 })

      //大图
      if (this.news.firstImage != undefined) {
        Image(this.news.firstImage)
          .width('100%')
      }

      Scroll() {
        Text(this.news.content)
          .textIndent(20) //首行缩进
      }
      .margin({ top: 10, bottom: 5 })
      .width('100%')
      .layoutWeight(1)
    }.titleMode(NavigationTitleMode.Mini)
    .title(this.NavigationTitle, { paddingStart: LengthMetrics.vp(0), paddingEnd: LengthMetrics.vp(0) }) //页面标题
    .padding({ left: 10, right: 10 })

    // .menus(this.NavigationMenus()) //设置页面右上角菜单。不设置时不显示菜单项

  }
}