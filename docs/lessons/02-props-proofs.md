# 第 2 课：命题与证明

Lean 的核心思想是：

> 命题是一种类型；证明是这种类型的一个值。

若 `P : Prop`，那么：

```lean
hP : P
```

表示 `hP` 是命题 `P` 的证明。

## 蕴含就是函数

```lean
P → Q
```

可以理解成一个函数类型：输入 `P` 的证明，输出 `Q` 的证明。

```lean
theorem applyAProof
    (P Q : Prop)
    (hPQ : P → Q)
    (hP : P) : Q := by
  exact hPQ hP
```

这里 `hPQ hP` 就像函数调用。

## tactic 写法和项写法

下面两个证明表达同一件事：

```lean
theorem keepLeft (P Q : Prop) (hP : P) : Q → P := by
  intro _hQ
  exact hP
```

```lean
theorem keepLeftTerm (P Q : Prop) (hP : P) : Q → P :=
  fun _hQ => hP
```

- `intro` 把箭头左侧的输入放进上下文。
- `exact` 给出与当前目标类型完全一致的证明。
- `fun` 是直接写出函数。

## 练习

完成 `Exercises/L02_PropsAndProofs.lean`：

```lean
theorem composeProofs
    (P Q R : Prop)
    (hPQ : P → Q)
    (hQR : Q → R)
    (hP : P) : R := by
  -- 先用 hPQ hP 得到 Q，再交给 hQR
```

??? success "参考答案"
    ```lean
    exact hQR (hPQ hP)
    ```

## 与 FLT 仓库的连接

`FermatLastTheorem` 本身是一个巨大的函数类型：给它指数、三个数以及所有条件，它返回“不等式”的证明。

<div class="checkpoint">检查点：能够用“输入证明、输出证明”解释 <code>P → Q</code>。</div>

