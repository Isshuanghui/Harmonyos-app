import { Message } from '../views/Message'
import { Mine } from '../views/Mine'
import { School } from '../views/School'
import { Service } from '../views/Service'
import { Today } from '../views/Today'

@Entry
@Component
struct Index {
  build() {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        Today()
      }.tabBar(this.tabBarBuilder('今日',0))
      // .backgroundColor(Color.Green)
      TabContent(){
        Message()
      }.tabBar(this.tabBarBuilder('讯息',1))
      // .backgroundColor(Color.Blue)
      TabContent(){
        Service()
      }.tabBar(this.tabBarBuilder('服务',2))
      // .backgroundColor(Color.Pink)
      TabContent(){
        School()
      }.tabBar(this.tabBarBuilder('校园',3))
      // .backgroundColor(Color.Yellow)
      TabContent(){
        Mine()
      }.tabBar(this.tabBarBuilder('我的',4))
    }.scrollable(false)
    .onChange((index:number)=>{
      this.currentIndex=index;
    })
  }
  @State currentIndex:number=0;
  //自定义布局
  @Builder
  tabBarBuilder(title:string,index:number){
    Column(){
      Text(title)
        .fontColor(this.currentIndex===index?'#000000s':'#AAAAAA')
    }
  }
}