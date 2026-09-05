# 第 8 课：阅读最终定理

仓库对外公布的版本是：

```lean
theorem fermat_last_theorem
    (n : ℕ) (hn : 3 ≤ n)
    (a b c : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    a ^ n + b ^ n ≠ c ^ n
```

## 把声明切成三块

对象：

```lean
n a b c : ℕ
```

条件：

```lean
hn : 3 ≤ n
ha : 0 < a
hb : 0 < b
hc : 0 < c
```

结论：

```lean
a ^ n + b ^ n ≠ c ^ n
```

## 正数和非零

Mathlib 的 `FermatLastTheorem` 使用 `a ≠ 0`，仓库公开版本使用 `0 < a`。自然数为正就一定非零：

```lean
ha.ne' : a ≠ 0
```

所以包装证明只是：

```lean
exact flt n hn a b c ha.ne' hb.ne' hc.ne'
```

这是一种常见模式：核心定理已经完成，外层定理只转换输入格式。

## 自定义 tactic 不必先学

发布文件中出现：

```lean
by p2m_exact_reverting @_root_.P2MW.S_fermat_last_theorem.solution
```

`p2m_exact_reverting` 不是 Lean 标准 tactic，而是该仓库为生成管线写的适配器。它把当前局部变量重新变成函数参数，再检查 `solution` 是否与目标具有完全匹配的类型。初学阶段把它理解成“严格版 `exact solution`”即可。

指数归约定理 `FermatLastTheorem.of_odd_primes` 位于 Mathlib 的 `FLT.Four` 模块；只导入 `FLT.Basic` 时看不到它。这是理解 `import` 依赖的一个真实例子。

## 练习

完成 `Exercises/L08_FLTTop.lean`：从 `MiniFermatLastTheorem` 推出使用正数假设的版本。

??? success "参考答案"
    ```lean
    apply flt n hn a b c
    · exact ha.ne'
    · exact hb.ne'
    · exact hc.ne'
    ```

## 下一步

你已经学完阅读顶层代码所需的最小 Lean。接下来进入[仓库阅读地图](../flt/repo-map.md)，然后开始初等数论阶梯。

<div class="checkpoint">检查点：能独立把最终声明翻译成完整中文，并解释每个假设为什么存在。</div>
