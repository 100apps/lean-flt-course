# 第 3 课：四个基础 tactic

## `intro`：引入输入

目标是 `P → Q` 时：

```lean
intro hP
```

上下文增加 `hP : P`，目标变成 `Q`。

## `exact`：直接交付证明

目标是 `Q`，而上下文已有 `hQ : Q`：

```lean
exact hQ
```

## `apply`：倒着使用定理

目标是 `Q`，已有 `hPQ : P → Q`：

```lean
apply hPQ
```

Lean 把目标改成 `P`。

## `rw`：根据等式替换

```lean
example (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  rw [h]
```

`rw [h]` 根据 `a = b` 把目标中的 `a` 改写为 `b`。

## 自动化先当工具使用

```lean
example (x : Int) : x + x = 2 * x := by
  ring

example (a b : Nat) (h₁ : a ≤ b) (h₂ : b ≤ a) : a = b := by
  omega
```

- `ring` 处理交换环中的多项式恒等式。
- `omega` 处理自然数/整数的线性算术。

先学会判断它们适用于什么问题，内部算法以后再学。

!!! note "线性很重要"
    从 `n ≤ 3` 推出 `n * n ≤ 9` 包含变量与自身相乘，不属于线性算术，`omega` 不会直接证明。因为这里只可能有四个 `n`，可以用 `interval_cases n <;> norm_num` 枚举。

## 练习

完成：

```lean
theorem add_same_right (a b c : Nat) (h : a = b) :
    a + c = b + c := by
  -- 使用 rw
```

??? success "参考答案"
    ```lean
    rw [h]
    ```

## 与 FLT 仓库的连接

顶层归约使用：

```lean
apply FermatLastTheorem.of_odd_primes
intro p pp p_odd
```

第一行选择归约定理，第二行引入归约后需要处理的素数及其性质。

<div class="checkpoint">检查点：能说出 <code>apply</code> 为什么经常会改变目标，而不是立即结束证明。</div>
