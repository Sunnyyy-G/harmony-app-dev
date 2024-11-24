import { BuyOrSell } from '../enum/BuyOrSell';

export class OrderItem {
  // 购买状态，默认为 Buy
  buyStatus: BuyOrSell = BuyOrSell.Buy;
  // 单价，默认为 0.00167
  unitPrice: number = 0.00167;
  // 购买数量，默认为 0
  count: number = 0;
  // 总价，默认为 0
  total: number = 0;
  datetime: string = '2024-11-02'

  // 构造函数
  constructor(buyStatus?: BuyOrSell, unitPrice?: number, count?: number) {
    // 可选参数，如果未传入则使用默认值
    if (buyStatus !== undefined) {
      this.buyStatus = buyStatus;
    }
    if (unitPrice !== undefined) {
      this.unitPrice = unitPrice;
    }
    if (count !== undefined) {
      this.count = count;
      this.total = this.calculateTotal(); // 计算总价
    }
  }

  // 计算总价的方法
  private calculateTotal(): number {
    return this.unitPrice * this.count;
  }
}