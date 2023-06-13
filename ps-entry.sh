#!/bin/bash

# 获取需要替换的值
old_value="--port=27017"
# 设置新的值
new_value="--port=27272"

# 将需要替换的值替换为新值，并传递给另一个脚本
new_args=()
for arg in "$@"; do
  if [[ "$arg" == "$old_value" ]]; then
    new_args+=("$new_value")
  else
    new_args+=("$arg")
  fi
done

# 调用另一个脚本，并传递替换后的参数
/opt/percona/tcpproxy -lhost :27017 -rhost 127.0.0.1:27272 &
/opt/percona/ps-entry-internal.sh "${new_args[@]}"

