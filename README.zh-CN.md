# Apollo-Ruby

🚀[携程Apollo配置管理框架](https://github.com/apolloconfig/apollo) 的Ruby客户端

## 安装

通过执行以下命令将gem加入Rails应用程序的Gemfile：

    $ bundle add apollo-ruby

如果不使用bundler管理依赖，可以通过以下命令安装gem：

    $ gem install apollo-ruby

## 用法

你需要在`config/initializers/apollo.rb`中进行配置：

```ruby
Apollo.configure do |config|
  config.appid = ENV['APOLLO_APPID']
  config.secret = ENV['APOLLO_SECRET']
  config.server = ENV['APOLLO_SERVER']
end
```

然后便可以使用以下代码从Apollo获取配置：

```ruby
Apollo.fetch("你的配置Key")
```

## 贡献

1. Fork
2. 创建您的特性分支 (`git checkout -b my-new-feature`)
3. 提交您的改动 (`git commit -am 'Added some feature'`)
4. 将您的修改记录提交到远程 git 仓库 (`git push origin my-new-feature`)
5. 然后到 github 网站的该 git 远程仓库的 my-new-feature 分支下发起 Pull Request

## 许可证

本项目基于MIT协议发布，更多细节请参阅 [MIT License](https://opensource.org/licenses/MIT).

## 更新日志

请参阅 [CHANGELOGS.md](./CHANGELOG.md).
