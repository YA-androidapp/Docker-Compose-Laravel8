#!/bin/bash
# Copyright (c) 2020 YA-androidapp(https://github.com/YA-androidapp) All rights reserved.

# docker-compose up -d してコンテナが起動したあとでappコンテナの中で実行するBashスクリプト

chmod 777 -R storage
chmod 777 -R bootstrap/cache

php artisan migrate
npm install
npm run dev



#TODO: Laravel 8対応バージョンが出たら
# # Voyager
# composer require tcg/voyager
# # php artisan voyager:install --with-dummy
# # でダミーデータを投入すると、以下の認証情報でサインイン可能
# # email: admin@admin.com
# # password: password

# php artisan voyager:install
# # php artisan voyager:admin admin@example.net
# php artisan voyager:admin admin@example.net --create

# # 何故か302で飛ばされる問題への対策（Laravel8でSeederの仕様変更があったため以下のコマンドはエラーになる）
# # php artisan migrate:refresh --seed
# # php artisan db:seed
