import { CommonConstant } from './common/CommonConstant';
import { UserInfo } from './common/UserInfo';
import ItemContactsPage from './ItemContactsPage';
import router from '@ohos.router';

@Entry
@Component
export struct ContactsListPage {
  @State contactsList: UserInfo[] = CommonConstant.contactsList;
  @State searchResultList: UserInfo[] = []

  build() {
    Scroll() {
      Column() {
        Row() {
          Image($r("app.media.icon_back"))
            .width(25)
            .height(25)
            .margin({ left: 20 })
            .onClick(() => {
              router.back()
            })
          Text("通讯录")
            .fontSize(20)
        }
        .width("100%")
        .height(45)
        .backgroundColor(Color.White)

        Divider()
          .color(Color.Gray)
          .strokeWidth(1)
        Row() {
          Search({ placeholder: "搜索" })
            .width("90%")
            .height(45)
            .backgroundColor(Color.White)
            .borderRadius(6)
            .onChange((value: string) => {
              // 每次输入搜索，我们需要清除掉之前的搜索结果
              this.searchResultList = []
              // 遍历通讯录查找输入匹配的数据
              let searchCount = 0
              for (let index = 0; index < this.contactsList.length; index++) {
                const element = this.contactsList[index];
                if (element.name.indexOf(value) != -1) {
                  searchCount++
                  this.searchResultList.push(element)
                }
              }
              if (searchCount == 0) {
                this.searchResultList.push({
                  id: 999,
                  name: "没有找到相应的联系人",
                  img: $r("app.media.icon_head_default")
                })
              }
            })
        }
        .id("row_search")
        .justifyContent(FlexAlign.Center)
        .width('100%')

        List() { // 列表页
          ForEach(this.searchResultList.length == 0 ? this.contactsList : this.searchResultList, (item: UserInfo, index: number) => {
            ListItem() {
              ItemContactsPage({ userInfo: item })
            }
          }, (item: UserInfo, index: number) => item.name + index)
        }
        .alignRules({
          top: { anchor: "row_search", align: VerticalAlign.Bottom }
        })
        .divider({
          strokeWidth: 1,
          color: "#ffeae9e9",
          startMargin: 60,
        })
        .backgroundColor(Color.White)
        .height('100%')
        .width('100%')
      }
      .backgroundColor(Color.Gray)
    }
    .height('100%')
    .width('100%')
  }
}