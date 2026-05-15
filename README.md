# protocols
protocols and implementations for kithub services

## 依赖库

### buf/validate

*buf/validate* 用于proto文件中的字段规则校验

参考文档，https://github.com/bufbuild/protovalidate-go

### google/api

*google/api* 用于生成可同时支持rpc和http两种协议格式的服务

使用方式

```
    protoc --go_out=./devicemanagementplatformapi --go-grpc_out=./devicemanagementplatformapi --grpc-gateway_out=./devicemanagementplatformapi ./devicemanagementplatformapi/devicemanagementplatformapi.proto
```

参考文档，https://zhuanlan.zhihu.com/p/602560212