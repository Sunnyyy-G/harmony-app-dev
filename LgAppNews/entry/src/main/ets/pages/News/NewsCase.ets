import { bannerInfo, IBanner, INews, newsInfo } from './NewsInfo';
import { router } from '@kit.ArkUI';

/**
 * 新闻列表主页
 */
@Entry
@Component
struct NewsCase {
  @State bannerInfo: Array<IBanner> = bannerInfo;
  private swiperController: SwiperController = new SwiperController();
  @State newsInfo: Array<INews> = newsInfo;

  build() {
    Column() {
      //头部
      Row({ space: 5 }) {
        Image($r('app.media.img_1'))
          .width(100);
        Search({ placeholder: '输入查询内容' })
          .height(35)
          .layoutWeight(1)
          .backgroundColor('#eee')
          .placeholderColor(Color.Gray)
          .margin({left: 10})

        Button() {
          Image($r('app.media.ic_public_contacts'))
            .width(25)
            .fillColor(Color.White)
            .aspectRatio(1)
        }
        .opacity(0.4)
        .backgroundColor(Color.Black)
        .padding(5)

      }.padding(5)
      .backgroundColor(Color.White)
      .width('100%')
      .shadow({ radius: 10, color: 'rgba(0, 0, 0, .2)', offsetX: 2, offsetY: 0 })
      .zIndex(99)

      //Swiper 滑块视图容器，提供子组件滑动轮播显示的能力
      Swiper(this.swiperController) {
        ForEach(this.bannerInfo, (item: IBanner, idx) => {
          Image(item.image)
            .width('100%')
            .alt(item.alt) //设置图片加载时显示的占位图
        }, (item: IBanner): string => {
          return String(item.id)
        })

      }
      .autoPlay(true) //自动播放
      .interval(8000) //刷新间隔，8s

      //新闻列表

      List() {
        ForEach(this.newsInfo, (item: INews, idx: number) => {
          ListItem() {
            Row({ space: 5 }) {
              Column() {
                Text(item.title)
                  .fontSize(20)
                  .fontWeight(600)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })

                Row({ space: 10 }) {
                  //作者
                  Text(item.author)
                    .fontColor('#999');
                  Text(item.msgCount < 10000 ? item.msgCount + '跟帖' : item.msgCount / 10000 + '万跟帖')
                    .fontColor('#999')
                }
                .width('100%')
              }.height(100)
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Image(item.firstImage)
                .height(100)
                .aspectRatio(1.3)
            }.width('100%')
            .border({ width: { bottom: 1 } })
            .borderColor('#eee')
            .padding(10)
          }.onClick(() => {
            router.pushUrl({
              url: "pages/News/NewsDetailCase",
              params: item
            })
          });
        })

      }.width('100%')
      .layoutWeight(1) //高度占据剩下的空间

    }
    .height('100%')
    .width('100%')
  }
}