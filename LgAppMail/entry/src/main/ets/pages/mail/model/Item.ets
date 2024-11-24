@Observed
export  default class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number
  isLove:boolean
  userName:string
  phone:string

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0,isLove:boolean = false,userName:string,phone:string) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
    this.isLove = isLove
    this.userName = userName
    this.phone = phone
  }
}
