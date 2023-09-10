## http-backend 项目介绍

`http-backend` 是一个后端服务，旨在提供强大的HTTP请求处理和管理功能。它可以用于构建RESTful API、管理接口、权限控制等。

`http-front` 是一个前端服务，该项目为http接口管理平台，有成员管理、角色管理、项目管理、接口管理、监控记录、登录记录、权限菜单等多项功能。

前端地址：https://github.com/heweijiqn/http-front
## 演示地址
https://1024code.com/codecubes/kuuwbfg

## 项目界面展示

### 首页

![33d8b31727665010edb4de4de4a7b10](https://github.com/heweijiqn/http-front/assets/87916335/aa83c0e6-039e-4dce-8417-edb5700a4e98)

### 成员管理

![e5450f3f17c53d9bf68eb40fecd5767](https://github.com/heweijiqn/http-front/assets/87916335/aeccedee-6c57-4a82-a54b-52473fde36a8)

### 角色管理

![5946dcddc44e88cb22e404e7d993bf1](https://github.com/heweijiqn/http-front/assets/87916335/e6eeb99b-081c-4b00-b0f9-5c7120f7a84a)

### 项目管理

![335f3b9525e03c5c817b55298d6d7db](https://github.com/heweijiqn/http-front/assets/87916335/d6595f24-e0d4-438b-9f53-c0290e876a03)

### 接口管理

![34a0c266ce09a40fdd69f978becc4e7](https://github.com/heweijiqn/http-front/assets/87916335/094d1a3f-3d84-414e-adae-c7ca2841c1e4)

### 监控记录

![b51058f9d341f8a360f209ce22f47da](https://github.com/heweijiqn/http-front/assets/87916335/4c390246-a615-4203-8fdc-3c80794171ef)

### 登录记录

![ccab9fc3061f1f41aff1c249cf4547a](https://github.com/heweijiqn/http-front/assets/87916335/235232b0-e7d9-479d-b19c-050d54cf06c7)

### 权限菜单
![e7c8ef631e7f0f383125a0868f0754a](https://github.com/heweijiqn/http-front/assets/87916335/c2c5123a-a67a-4d16-9219-2514f4cb75b0)


## 项目基本功能图

![whiteboard_exported_image](https://github.com/heweijiqn/http-front/assets/87916335/fc8f3828-be2b-4ffa-83e3-f3cc4c9b407e)

## 软件架构

该项目的软件架构遵循典型的三层架构：

- 表示层：处理用户的HTTP请求和返回相应的HTTP响应。
- 业务逻辑层：实现具体的业务逻辑，协调数据处理、调用数据访问层操作等。
- 数据访问层：负责与数据库交互，实现数据读写操作。

## 安装教程

1. 克隆项目到本地：`git clone https://github.com/your-username/http-backend.git`
2. 下载maven包
3. 修改配置为本地配置
4. 运行启动类


## 使用说明

- Swagger导入功能：上传Swagger文档文件，系统自动生成接口信息。
- 权限分配功能：将用户划分为不同角色，分配权限以确保系统安全性。
- 成员管理功能：管理员可以添加、编辑和删除成员的信息。
- 项目管理功能：管理员可以创建、编辑和管理不同项目。
- 角色管理功能：管理员可以管理系统中的角色，包括添加、编辑、删除角色的信息。
- 接口增删改查功能：管理员和成员可以管理接口，包括创建、编辑、删除接口的信息。
- 接口调用和监控管理功能：成员可以调用接口进行测试，并监控接口性能数据。

## 后端项目结构

首先分为三个大的模块分别是common,model,service-system
- common模块下有四个子模块:
  - common-log:日志实现模块
  - common-util:通用工具类模块
  - service-util:配置类及异常
  - spring-security：权限模块
- model:用于定义数据模型，包括数据库中的表结构、实体类及Vo类
- service-system：服务模块，采用三层架构
  - 表示层：负责处理用户请求和响应
  - 业务逻辑层：负责实现具体的业务逻辑，协调数据处理、调用数据访问层操作等。
  - 数据访问层：数据访问对象（DAO）负责与数据库交互，实现数据读写操作。





## 特点

- 强大的Swagger导入功能，简化接口信息管理。
- 灵活的权限分配系统，确保系统的安全性。
- 直观的成员和项目管理功能，提高操作效率。
- 功能丰富的接口增删改查功能，方便接口管理。
- 实时的接口调用和监控管理功能，提供性能数据。


