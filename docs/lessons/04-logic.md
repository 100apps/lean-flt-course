# 第 4 课：逻辑与矛盾

## 合取 `∧`

`P ∧ Q` 的证明包含两部分。可以拆开并交换：

```lean
theorem andSwap (P Q : Prop) : P ∧ Q → Q ∧ P := by
  rintro ⟨hP, hQ⟩
  exact ⟨hQ, hP⟩
```

## 否定 `¬`

在 Lean 中：

```lean
¬ P
```

本质上是：

```lean
P → False
```

因此，同时持有 `hP : P` 和 `hnP : ¬ P` 时：

```lean
theorem contradiction (P : Prop) (hP : P) (hnP : ¬ P) : False :=
  hnP hP
```

这不是特殊魔法，只是把函数 `hnP` 应用到输入 `hP`。

## 不等号也是否定

```lean
a ≠ b
```

表示：

```lean
a = b → False
```

所以费马大定理说的是：任何假想的方程等式都会导出矛盾。

## 练习

```lean
theorem falseFromBoth (P : Prop) (h : P ∧ ¬ P) : False := by
  -- h.1 是 P；h.2 是 ¬P
```

??? success "参考答案"
    ```lean
    exact h.2 h.1
    ```

## 与 FLT 仓库的连接

真实仓库最终使用：

```lean
FreyPackage.Wiles_Frey P (FreyPackage.Mazur_Frey P)
```

`Mazur_Frey P` 给出不可约；`Wiles_Frey P` 接收不可约并产生 `False`。这与本课的 `hnP hP` 完全同形。

<div class="checkpoint">检查点：不用“反证法”三个字，直接用函数类型解释 <code>¬P</code>。</div>

