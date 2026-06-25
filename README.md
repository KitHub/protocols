# protocols
protocols and implementations for kithub services

## 编译方式

以*projectgeneratorapi*项目为例，在项目根目录下运行

```
protoc --go_out=./ --go-grpc_out=./ --grpc-gateway_out=./ --govalidators_out="./" ./projectgeneratorapi/projectgeneratorapi.proto`
```

## 依赖库

### mwitkow/go-proto-validators

*mwitkow/go-proto-validators* 用于proto文件的参数校验

使用方式，以 *DeviceManagementPlatform*服务为例进行编译，

```
protoc --go_out=./ --go-grpc_out=./ --grpc-gateway_out=./ --govalidators_out="./" ./devicemanagementplatformapi/devicemanagementplatformapi.proto
```

参考文档，https://github.com/mwitkow/go-proto-validators

### google/api

*google/api* 用于生成可同时支持rpc和http两种协议格式的服务

使用方式，以 *DeviceManagementPlatform*服务为例进行编译，

```
protoc --go_out=./ --go-grpc_out=./ --grpc-gateway_out=./ ./devicemanagementplatformapi/devicemanagementplatformapi.proto
```

参考文档，https://zhuanlan.zhihu.com/p/602560212
