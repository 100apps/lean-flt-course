# Docker 环境

所有 Lean 工具都在 Docker 中。宿主 iStoreOS 只保存课程仓库和可删除缓存。

## 数据分层

| 数据 | 位置 | 是否提交 Git |
|---|---|---|
| 教程、练习、答案 | 仓库目录 | 是 |
| Lean/Mathlib 版本 | `lean-toolchain`、`lakefile.toml`、`lake-manifest.json` | 是 |
| 编译结果和下载缓存 | `.cache/` | 否，可重建 |
| 生成的网站 | `site/` | 否，由 GitHub Actions 重建 |
| Anthropic FLT 源码副本 | `.cache/upstream-flt/` | 否，按 `upstream.lock` 精确重建 |
| GitHub 登录凭据 | `.auth/gh/` | 否，只留在本机且绝不提交 |

## 第一次初始化

```sh
make setup
```

等价的完整命令是：

```sh
docker compose build lean
docker compose run --rm lean bash -lc \
  'lake update && lake exe cache get && lake build'
```

## 日常检查

```sh
make check
```

检查某一个练习：

```sh
docker compose run --rm lean \
  lake env lean Exercises/L01_Expressions.lean
```

Lean 接受 `sorry`，但会发出警告。完成练习的标准是该文件不再出现 `declaration uses 'sorry'`。

## 为什么课程使用 Lean 4.33.0

目标 FLT 仓库固定 Lean 4.33.1 和 Mathlib `db584cd`。该 Mathlib 提交原本对应 Lean 4.33.0。课程选择 4.33.0，因此可以获取预编译 Mathlib 缓存；等真正需要检查上游源文件时，再使用单独的 4.33.1 容器。

这不会影响基础语法和课程中的证明逻辑。

## 下载锁定版本的上游源码

```sh
make upstream
```

它会按 `upstream.lock` 下载 Anthropic 仓库的固定提交，只检出 `Definitions/`、`P2M/`、`Theorems/` 和 `verification/`，并自动包含根目录的 `README.md`、`PROOF-PATH.md`、版本文件等。不会下载仓库中约 390 MB 的生成网页。

注意：原仓库全量验证需要远超普通家用设备的内存和磁盘。本课程先学习源码结构和小型可运行例子，不在 iStoreOS 上强行全量编译原仓库。

## GitHub 登录也放在容器中

```sh
make github-login
```

官方 GitHub CLI 也固定在课程工具镜像中。登录凭据保存在 `.auth/gh/`，不会写到系统全局目录，也被 `.gitignore` 排除。以后可用下面的形式运行 GitHub CLI：

```sh
docker compose run --rm github auth status
```

## 软件源

Lean 容器默认使用中科大 Ubuntu 镜像，以适配当前 iStoreOS 的国内网络。它可以在 `.env` 中修改：

```text
UBUNTU_MIRROR=http://archive.ubuntu.com/ubuntu
```

极简 Ubuntu 镜像在安装 CA 证书前使用 HTTP 引导 APT；软件包仍由 Ubuntu 仓库签名校验。安装证书后，Lean、Git 和其他下载继续使用 HTTPS。该软件源只负责安装容器内的基础工具，不决定 Lean 或 Mathlib 版本。
