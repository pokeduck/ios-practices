# 安裝

1. ``brew install rbenv``
1. ``echo "2.7.2" > .ruby-version`` 設定 ruby 版本
1. ``source ~/.zshrc`` 重新載入 rbenv，安裝 rbenv會把 ``eval "$(rbenv init -)"`` 塞入 zshrc 或是 bash_profile 中
1. ``rbenv local`` 確認 local ruby 版本
1. ``gem install bundle``
1.  ``bundle install`` 安裝 Gemfile 裡面的套件
1.  ``bundle exec pod install``
