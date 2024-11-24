import router from '@ohos.router'

/**
 * 启动页 0
 */
@Entry
@Component
struct StartupPage {
  @State translateY_Title: number = 200 //定义一个用@state修饰的number型变量translateY_Title
  @State translateY_Logo: number = -200

  build() {
    Row() {
      Column() {

        Image($r('app.media.tech_logo'))
          .height(120)
          .width(280)
          .objectFit(ImageFit.Contain)//添加关键属性
          .translate({ y: this.translateY_Logo })
          .animation({
            //播放时长（ms）
            duration: 2000,
            //播放速度
            tempo: 1,
            //播放曲线，所选择的是‘快出慢入’
            curve: Curve.FastOutSlowIn,
            //延迟（ms）
            delay: 500,
            //循环次数（-1为无限循环）
            iterations: 1,
            //播放模式
            playMode: PlayMode.Normal
          })

        //删除页面初始化时默认带有的Text组件, 增加一个新的image件和一个新的Text组件

        Text('TeckEducation')
          .fontSize(20)
          .textCase(TextCase.UpperCase)
          .fontWeight(FontWeight.Bold)
          .letterSpacing(10)
          .margin({ top: 7 })//添加关键属性
          .translate({ y: this.translateY_Title })
          .animation({
            delay: 500,
            duration: 2000,
            curve: Curve.FastOutSlowIn,
            tempo: 1,
          })//增加onAppear回调
          .onAppear(() => {
            //改变属性参数
            this.translateY_Logo = 0
            this.translateY_Title = 0

            //设置定时器
            let id = setInterval(() => {
              //打印日志
              console.info('router to Second')
              //页面跳转
              router.pushUrl({
                url: "pages/techlogin/login/LoginPage"
              })
              //定时器执行之后立即销毁
              clearInterval(id)
            }, 3000)
          })


      }
      .width('100%')
    }
    .height('100%')
  }
}