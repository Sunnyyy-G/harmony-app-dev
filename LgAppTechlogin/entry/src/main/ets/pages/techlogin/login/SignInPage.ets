import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
/**
 * 注册页
 */
let mUserName: string = ''
let mUserPwd: string = ''
let mUserAgainPwd: string = ''

@Entry
@Component
struct SignInPage {
  build() {
    Column() {
      pageTitle()
      Image($r('app.media.school_cloud_model'))
        .width('100%')
        .height(200)
        .objectFit(ImageFit.Auto)
        .padding(10)
        .margin({ top: 20 })
      SignInInput()
      Blank()
      Button() {
        Text('注册')
          .logInTextSty(30, FontWeight.Bold, Color.White)
      }
      .margin({ bottom: 50 })
      .width('90%')
      .height(50)
      .backgroundColor('#ffe9730c')
      .onClick(() => {
        if (!mUserName || mUserName.trim().length == 0 || !mUserPwd || mUserPwd.trim().length == 0 || !mUserAgainPwd ||
          mUserAgainPwd.trim().length == 0) {
          promptAction.showToast({ message: '用户名或密码不能为空或有空格' })
          return
        }
        if (mUserPwd != mUserAgainPwd) {
          promptAction.showToast({ message: '两次密码不一致' })
          return
        }
        promptAction.showToast({ message: '注册成功' })
        router.back()
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe3cdcd')
  }
}

//返回图标和标题
@Component
struct pageTitle {
  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .height(30)
        .margin({
          right: 5
        })
        .onClick(() => {
          router.back()
        })
      Text('注册页面')
        .logInTextSty(26, FontWeight.Bold, Color.Black)
    }
    .width('100%')
    .margin({ top: 15 })
    .padding({ left: 20 })
    .justifyContent(FlexAlign.Start)
  }
}

//注册输入框
@Component
struct SignInInput {
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
      TextInput({ placeholder: '请再次输入密码' })
        .logInInputSty()
        .type(InputType.Password)
        .onChange((value) => {
          mUserAgainPwd = value
        })
    }
    .width('90%')
    .margin({ top: 10 })
  }
}


@Extend(Text)
function logInTextSty(text_size: number, text_fontWeight: FontWeight, text_color: ResourceColor) {
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