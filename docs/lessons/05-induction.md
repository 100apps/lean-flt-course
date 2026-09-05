# 第 5 课：自然数与归纳

自然数由两个构造方式产生：

- `0` 是自然数；
- 若 `n` 是自然数，`Nat.succ n` 也是自然数。

要对所有自然数证明命题，就分别处理这两种情况。

```lean
theorem zero_add_by_induction (n : Nat) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ n _ih => simp
```

- `zero` 分支证明 `0 + 0 = 0`。
- `succ` 分支假设较小的 `n` 已成立。
- `ih` 是 induction hypothesis，归纳假设。

## 递归定义

三角数 (1+2+\cdots+n)：

```lean
def triangular : Nat → Nat
  | 0 => 0
  | n + 1 => triangular n + (n + 1)
```

递归定义函数和归纳证明命题，是同一自然数结构的两面。

## 练习

使用归纳证明：

```lean
theorem one_mul_by_induction (n : Nat) : 1 * n = n := by
  induction n with
  | zero => -- ...
  | succ n ih => -- ...
```

??? success "参考答案"
    ```lean
    induction n with
    | zero => rfl
    | succ n _ih => simp
    ```

## 与 FLT 仓库的连接

FLT 顶层不是对指数直接归纳，而是利用指数分解归约到素数指数。不过许多底层自然数、有限和与次数引理仍依赖归纳思想。

<div class="checkpoint">检查点：能够区分递归定义中的“上一项”和归纳证明中的“归纳假设”。</div>
