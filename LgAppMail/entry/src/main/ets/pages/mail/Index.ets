import Home from './Home'
import TabBarModel from './model/TabBarModel'
import { window } from '@kit.ArkUI'

/**
 * 二手闲置交易平台
 */
@Entry
@Component
struct Index {
  windowClass?: window.Window

  async setFullScreen(flag: boolean) {
    if (!this.windowClass) {
      this.windowClass = await window.getLastWindow(getContext(this))
    }
    this.windowClass.setWindowLayoutFullScreen(flag)
  }

  onPageShow(): void {
    this.setFullScreen(true)
  }

  onPageHide(): void {
    this.setFullScreen(false)
  }

  private tabBarModels: TabBarModel[] = [
    new TabBarModel('首页', $r('app.media.homepage'), $r('app.media.homepage_sel'), 0),
    new TabBarModel('我的', $r('app.media.user'), $r('app.media.user_sel'), 1)
  ]
  @State selectedIndex: number = 0 //当前选中tab下标
  // @State prodCount: number = 10
  private tabsController: TabsController = new TabsController()

  @Builder
  buildTabBar(tabBarModel: TabBarModel) {
    /*Badge({//可以附加在单个组件上用于信息标记的容器组件,例如用于红点消息提示
      count: tabBarModel.title == '购物车' ? this.prodCount : 0,
      position: BadgePosition.RightTop,
      style: { badgeSize: 13, badgeColor: '#FA2A2D' }
    }) {*/
    Column() {
      Image(this.selectedIndex == tabBarModel.index ? tabBarModel.selectedImage : tabBarModel.image)
        .width(20)
        .height(20)
        .margin({ top: 3 })
      Text(tabBarModel.title)
        .fontSize(12)
        .fontWeight(500)
        .margin({ top: 5 })
        .fontColor(this.selectedIndex == tabBarModel.index ? '#00aaff' : Color.Black)

    }.height(50)

    //}

  }

  build() {
    Tabs({ controller: this.tabsController }) {
      TabContent() {
        Home()
      }
      .tabBar(this.buildTabBar(this.tabBarModels[0]))

      TabContent() {
        Text('我的')
      }
      .tabBar(this.buildTabBar(this.tabBarModels[1]))

      /*ForEach(this.tabBarModels, (item: TabBarModel, index) => {
        TabContent() {
          if (index === 0) {
            Home()
          } else {
            Text(item.title)
          }

        }
        .tabBar(this.buildTabBar(item))
      })*/
    }.barPosition(BarPosition.End)
    .width('100%')
    .onChange((index: number) => { //Tab页签切换后触发的事件
      this.selectedIndex = index
    })
  }
}