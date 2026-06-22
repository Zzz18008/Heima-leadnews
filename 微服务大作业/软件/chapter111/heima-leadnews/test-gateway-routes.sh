#!/bin/bash
# 测试网关路由配置脚本

echo "=========================================="
echo "测试 Spring Cloud Gateway 路由配置"
echo "=========================================="
echo ""

echo "1. 测试用户服务路由..."
curl -s -o /dev/null -w "HTTP状态码: %{http_code}\n" \
  "http://localhost:51602/user/api/v1/login/login_auth/" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"phone":"13511223456","password":"123456"}'

echo ""
echo "2. 通过Nginx测试完整链路..."
curl -s -o /dev/null -w "HTTP状态码: %{http_code}\n" \
  "http://localhost:8802/app/user/api/v1/login/login_auth/" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"phone":"13511223456","password":"123456"}'

echo ""
echo "3. 检查Nacos中的服务注册情况..."
curl -s "http://127.0.0.1:8848/nacos/v1/ns/instance/list?serviceName=leadnews-user&username=nacos&password=nacos" | python3 -c "import sys, json; data = json.load(sys.stdin); print(f'leadnews-user 实例数: {len(data.get(\"hosts\", []))}')"

echo ""
echo "=========================================="
echo "期望结果：HTTP状态码应该是 200 或其他业务状态码，不应该是 404"
echo "=========================================="
