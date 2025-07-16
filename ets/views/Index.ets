import { Message } from './Message'

@Entry
@Component
struct Index {
  build() {
    Tabs({barPosition:BarPosition.End}){

      TabContent(){
        Message()
      }.tabBar(this.tabBarBuilder('讯息',1))


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
