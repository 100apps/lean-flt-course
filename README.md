# Lean × Fermat's Last Theorem：高中起点学习路线

这是一个面向 Lean 零基础、高中数学背景学习者的可复现课程。目标不是逐行背诵一个包含数万条定理的机器生成仓库，而是逐层获得以下能力：

1. 阅读和编写基础 Lean 证明；
2. 看懂 `anthropics/fermats-last-theorem` 的工程结构与顶层证明；
3. 建立理解 Frey 曲线、模性和降层所需的数学阶梯；
4. 最终能够独立追踪一条真实的证明依赖链。

## 隔离和持久化

- Lean、Lake、Mathlib 和 MkDocs 都只在 Docker 容器中运行。
- 课程源码、练习、答案、教程和版本锁定文件均保存在 Git 仓库中。
- `.cache/` 只保存可重新下载的构建缓存，不提交 GitHub。
- `lean-toolchain`、`lakefile.toml` 和 `lake-manifest.json` 锁定可复现环境。

课程使用 Lean `v4.33.0` 与 Mathlib 提交 `db584cd`。原 FLT 仓库使用同一 Mathlib 提交但将内核固定到 Lean `v4.33.1`；课程选择 `v4.33.0` 是为了使用 Mathlib 的预编译缓存，避免在家用设备上从头编译整个 Mathlib。

## Docker 使用

```sh
make setup       # 首次下载工具链、Mathlib 与缓存，并检查课程
make check       # 检查全部课程示例和答案
make shell       # 进入隔离的 Lean shell
make docs        # 严格构建教程站点
make docs-serve  # 本地预览教程
```

不安装 `make` 时，可以直接执行 `Makefile` 中对应的 `docker compose` 命令。

## 目录

```text
LeanFltCourse/Lessons/    可编译的课堂示例
Exercises/                 留有 sorry 的练习副本
LeanFltCourse/Solutions/  完整答案
docs/                     手机友好的教程站点
.github/workflows/        Lean 检查与 GitHub Pages 发布
```

课程首页和学习方法见 `docs/index.md`。

手机课程站点：<https://100apps.github.io/lean-flt-course/>

## 上游材料

- FLT 仓库：<https://github.com/anthropics/fermats-last-theorem>
- 本课程锁定的上游版本：`upstream.lock`
- `make upstream`：在 Docker 中把该版本的 Lean 源码稀疏下载到 `.cache/upstream-flt/`，跳过约 390 MB 的生成网页
- Lean 官方教程：<https://docs.lean-lang.org/theorem_proving_in_lean4/>
- Mathematics in Lean：<https://leanprover-community.github.io/mathematics_in_lean/>

## 许可

课程文字与原创示例采用 MIT License。引用的上游项目归各自作者所有；链接到的 FLT 仓库采用 Apache-2.0。
