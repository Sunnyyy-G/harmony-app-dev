import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
/**
 * 登录页 1
 */
let mUserName: string = ''
let mUserPwd: string = ''

@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Image($r('app.media.school_cloud_model'))
        .width('100%')
        .height(200)
        .objectFit(ImageFit.Auto)
        .padding(10)
        .margin({ top: 20 })
      Text('欢迎来到泰克教育')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ff2c2f3b')
      LoginInput()
      Blank()
      Button() {
        Text('登录')
          .logInTextSty(30, FontWeight.Bold, Color.White)
      }
      .margin({ bottom: 50 })
      .width('90%')
      .height(50)
      .backgroundColor('#ff2c2f3b')
      .onClick(() => {
        if (!mUserName || mUserName.trim().length == 0 || !mUserPwd || mUserPwd.trim().length == 0) {
          promptAction.showToast({ message: '用户名或密码不能为空或有空格' })
          return
        }
        router.replaceUrl({
          url: "pages/techlogin/TechHome",
          params: {
            name: mUserName
          }
        }, router.RouterMode.Single, (err) => {
          if (err) {
            console.error(`跳转错误，错误码：${err.code}, 错误原因：${err.message}`)
            return
          }
          console.log('跳转成功');
          promptAction.showToast({ message: '登录成功' })
        })
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffea553c')
  }
}

//登录注册输入框
@Component
struct LoginInput {
  build() {
    Column({ space: 20 }) {
      TextInput({ placeholder: '请输入用户名' })
        .logInInputSty()
        .onChange((value) => {
          mUserName = value
        })
      TextInput({ placeholder: '请输入密码' })
        .logInInputSty()
        .type(InputType.Password)
        .onChange((value) => {
          mUserPwd = value
        })
      Text('注册')
        .logInTextSty(12, FontWeight.Normal, Color.White)
        .textAlign(TextAlign.End)
        .width('100%')
        .margin({ right: 50 })
        .decoration({ type: TextDecorationType.Underline, color: Color.Black }).decoration({ type: TextDecorationType.Underline, color: Color.White })
        .onClick(() => {
          router.pushUrl({
            url: "pages/techlogin/login/SignInPage"
          }, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`跳转错误，错误码：${err.code},错误原因: ${err.message}`)
              return
            }
            console.log('跳转成功');
          })
        })
    }
    .width('90%')
    .margin({ top: 50 })
  }
}

@Extend(Text)
function logInTextSty(text_size: number, text_fontWeight: number, text_color: number) {
  .fontSize(text_size)
  .fontWeight(text_fontWeight)
  .fontColor(text_color)
}

@Extend(TextInput)
function logInInputSty() {
  .height(50)
  .width('90%')
  .backgroundColor(Color.White)
  .caretColor(Color.Black) //光标颜色
  .maxLength(30)
  .margin({
    left: 10
  })
}