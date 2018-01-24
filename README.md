# WeTalk
<img src="./Screenshot/1.PNG" width = "375" height = "667" alt="screenshot1" align=center />

<img src="./Screenshot/2.PNG" width = "375" height = "667" alt="screenshot1" align=center />

## 已实现的功能
1. 消息界面
  * 消息列表（新会话加入，DB）
  * 消息侧滑删除
  * 好友搜索（支持模糊查询）
  * 更多菜单（可动态定制items）
2. 通讯录界面 
  * 好友列表（分组算法、DB）
  * 好友搜索
  * 好友资料（UI抽象模板），资料设置UI（使用设置类UI模板）
  * 新的朋友（读取手机联系人信息）
  * 群聊（UI，DB）
3. 聊天界面
  * 聊天输入框
  * 消息展示视图
    * 文字消息
    * 图片消息
    * 表情消息
    * 语音消息
  * 聊天键盘
    * 表情键盘（动态增删表情包）
    * 更多键盘
  * 聊天记录存储（DB）

## 项目主要使用的第三方库
* [Masonry](https://github.com/SnapKit/Masonry)：自动布局框架，简洁高效
* [FMDB](https://github.com/ccgus/fmdb)：sqlite数据库管理框架
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)：网络请求
* [SDWebImage](https://github.com/rs/SDWebImage)：网络图片下载、缓存
* [MJExtension](https://github.com/CoderMJLee/MJExtension)：JSON - Model互转框架，高效低耦合
* [MJRefresh](https://github.com/CoderMJLee/MJRefresh)：下拉刷新，上拉加载更多，继承简单
* [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)：日志分级、本地化
* [MWPhotoBrowser](https://github.com/mwaterfall/MWPhotoBrowser)：图片选择器
* [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)：进度提示框
