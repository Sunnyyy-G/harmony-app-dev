import { CommonConstant } from './common/CommonConstant';
import EmailInfo from './common/EmailInfo';
import ItemViewPage from './ItemViewPage';
/**
 * QQ邮箱主页
 */
@Entry
@Component
struct Index {
  @State searchResultList: EmailInfo[] = []
  emailList = CommonConstant.emailList

  @Builder itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(16)
      .width('100%')
      .fontColor("#ffaeacac")
      .margin({ left: 20, top: 30 })
      .padding(5)
  }

  build() {
    Column() {
      Row() {
        Text("我")
          .border({
            color: Color.Gray,
            width: 1
          })
          .borderRadius(30)
          .padding(5)
          .fontSize(12)
          .fontColor(Color.Gray)
          .backgroundColor(Color.White)
        Text("邮箱")
          .fontSize(22)
        Image($r("app.media.icon_add"))
          .width(25)
          .height(25)
      }
      .padding({ left: 20, right: 20 })
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Search({ placeholder: "搜索" })
        .width("90%")
        .borderRadius(6)
        .margin({ left: 20, right: 20, top: 18 })
        .onChange((value: string) => {
          // 每次输入搜索，我们需要清除掉之前的搜索结果
          this.searchResultList = []
          // 遍历通讯录查找输入匹配的数据
          let searchCount = 0
          for (let index = 0; index < this.emailList.length; index++) {
            const element = this.emailList[index];
            if (element.name.indexOf(value) != -1) {
              searchCount++
              this.searchResultList.push(element)
            }
          }
          if (searchCount == 0) {
            this.searchResultList.push({
              id: 999,
              name: "没有找到相应的邮件",
              img: $r("app.media.email_null")
            })
          }
        })

      List() {
        ListItemGroup({ header: this.itemHead("我的邮件") }) {
          ForEach(this.searchResultList.length == 0 ? this.emailList : this.searchResultList, (item: EmailInfo, index: number) => {
            ListItem() {
              ItemViewPage({ emailInfo: item,
                isShowDivider: index != CommonConstant.emailList.length - 1 })
            }

          })
        }

        ListItemGroup({ header: this.itemHead("我的应用") }) {
          ForEach(CommonConstant.appList, (item: EmailInfo, index: number) => {
            ListItem() {
              ItemViewPage({ emailInfo: item, isShowDivider: index != CommonConstant.emailList.length - 1 })

            }
          })
        }
      }
      .divider({
        strokeWidth: 1,
        color: "#ffeae9e9"
      })
      .padding({ bottom: 100 })
    }
    .height('100%')
    .width('100%')
  }
}