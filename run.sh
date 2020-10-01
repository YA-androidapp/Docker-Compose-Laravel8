#!/bin/bash
# Copyright (c) 2020 YA-androidapp(https://github.com/YA-androidapp) All rights reserved.

# とりあえずホスト側でこのスクリプトを実行する


# 最新版を取得
git clone https://github.com/ya-androidapp/Docker-Compose-Laravel8 && cd lara8
# git pull
# sudo chown -R y:y . && git fetch origin && git reset --hard origin/master



# 掃除
rm -f docker/db/data/.gitkeep
rm -f docker/db/sql/.gitkeep
docker-compose down --rmi all --volumes
docker volume rm $(docker volume ls -qf dangling=true)



# ビルド
docker-compose build --no-cache --force-rm && docker-compose up -d
sleep 60
docker-compose logs



# マイグレーション
docker-compose exec app bash /opt/migrate.sh
