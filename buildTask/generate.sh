#!/usr/bin/env bash
# バリデーション
if [ $# -ne 2 ]; then
  echo "Invalid parameter." 1>&2
  echo "Require 2 parameter. But you have specified $# parameter." 1>&2
  exit 1
fi

# 設定ファイルを出力
cp .env.template .env

# 実行引数の文字列を書き出す
echo MICRO_CMS_API_BASE_URL=$1 > .env
echo MICRO_CMS_API_KEY=$2 >> .env

# ビルド実行
npm run generate

# おしまい
exit 0
