export default class TabBarViewModel {
  /**
   * 标题
   */
  title: string
  /**
   * 图标未选中时
   */
  image: Resource
  /**
   * 图标选中时
   */
  selectedImage: Resource
  /**
   * 下标
   */
  index: number

  constructor(title: string, image: Resource, selectedImage: Resource, index: number) {
    this.title = title
    this.image = image
    this.selectedImage = selectedImage
    this.index = index
  }

}