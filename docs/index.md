<div class="hero">
  <h1>Lean × 费马大定理</h1>
  <p>从高中数学出发，先学会让 Lean 检查一个小证明，再逐层读懂真实的 FLT 形式化仓库。</p>
</div>

这门课不要求编程经验，也不假设你学过高等代数或数论。我们采用一种固定节奏：

1. 用日常语言解释一个概念；
2. 看一段不超过十几行的 Lean；
3. 完成一个小练习；
4. 找到它在费马大定理仓库中的真实对应物。

## 最终目标

完成课程后，你应该能够：

- 读懂 Lean 定理中变量、假设和结论；
- 理解“命题是类型、证明是值”；
- 使用 `intro`、`exact`、`apply`、`rw`、`simp` 等基本工具；
- 看懂 `Definitions/`、`Theorems/`、`P2M/Sol/` 的分工；
- 解释 FLT 证明的六段主链；
- 沿依赖关系阅读一个真实的局部证明；
- 清楚区分“Lean 代码读懂了”和“背后的研究生数学掌握了”。

!!! warning "先不要完整构建原 FLT 仓库"
    原仓库的完整构建需要远超普通家用设备的磁盘和内存。课程使用一个小型、可缓存的 Mathlib 项目；原仓库先作为阅读材料。

## 现在从哪里开始

先阅读[课程目标](start/goals.md)，然后进入[第 1 课：表达式与类型](lessons/01-expressions.md)。

如果你只想先知道“大证明是怎样接起来的”，可以跳到[仓库阅读地图](flt/repo-map.md)，但练习仍建议从第 1 课开始。

## 重要链接

- [目标 FLT 仓库](https://github.com/anthropics/fermats-last-theorem)
- [仓库的证明路线](https://github.com/anthropics/fermats-last-theorem/blob/main/PROOF-PATH.md)
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)
- [Theorem Proving in Lean 4](https://docs.lean-lang.org/theorem_proving_in_lean4/)

