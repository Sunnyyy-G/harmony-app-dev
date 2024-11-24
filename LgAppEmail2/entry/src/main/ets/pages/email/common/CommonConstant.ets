import EmailInfo from './EmailInfo'
import { UserInfo } from './UserInfo'

export class CommonConstant {
  static contactsList: Array<UserInfo> = [
    {
      id: 0,
      name: '小趴菜',
      img: $r("app.media.icon_head_default")
    },
    {
      id: 1,
      name: '老板',
      img: $r("app.media.icon_head_police")
    },
    {
      id: 2,
      name: '老婆',
      img: $r("app.media.icon_head_mother")
    },
    {
      id: 3,
      name: '物业小张',
      img: $r("app.media.icon_head_boy")
    },
    {
      id: 4,
      name: '少林寺方丈',
      img: $r("app.media.icon_head_default")
    },
    {
      id: 5,
      name: '小林',
      img: $r("app.media.icon_head_girl")
    },
    {
      id: 6,
      name: '花开富贵',
      img: $r("app.media.icon_head_default")
    },
    {
      id: 7,
      name: '妈妈',
      img: $r("app.media.icon_head_my")
    },
    {
      id: 8,
      name: '相亲相爱1家人',
      img: $r("app.media.icon_head_default")
    },
    {
      id: 9,
      name: '老王（隔壁）',
      img: $r("app.media.icon_head_police")
    },
    {
      id: 10,
      name: '老王1（隔壁）',
      img: $r("app.media.icon_head_police")
    },
    {
      id: 9,
      name: '老王2（隔壁）',
      img: $r("app.media.icon_head_default")
    },
  ]
  static emailList: Array<EmailInfo> = [
    {
      id: 0,
      name: '全部邮件',
      img: $r("app.media.email_all")
    },
    {
      id: 0,
      name: 'Tech-lab的邮件',
      img: $r("app.media.email_all")
    },
    {
      id: 0,
      name: 'QQ邮件',
      img: $r("app.media.email_qq")
    },
  ]

  static appList: Array<EmailInfo> = [
    {
      id: 0,
      name: '通讯录',
      img: $r("app.media.email_address")
    },
    {
      id: 0,
      name: '文件中转站',
      img: $r("app.media.email_transfer")
    },
    {
      id: 0,
      name: '附件管理',
      img: $r("app.media.email_file_manager")
    },
    {
      id: 0,
      name: '每日月读',
      img: $r("app.media.email_read"),
      isShowRedNotify:true
    },
    {
      id: 0,
      name: '发票助手',
      img: $r("app.media.email_ticket_help"),
      isShowRedNotify:true
    },
    {
      id: 0,
      name: '记事本',
      img: $r("app.media.email_book")
    },
    {
      id: 0,
      name: '日历',
      img: $r("app.media.email_date")
    },
    {
      id: 0,
      name: '更多应用',
      img: $r("app.media.email_more")
    },
  ]
}