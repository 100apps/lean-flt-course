# 第 7 课：玩具 Frey 矛盾

现在把仓库最顶层的数学逻辑完整复刻出来。

先给“不可约”一个玩具含义：

```lean
def IsIrreducible (P : ToyFrey) : Prop := Odd P.p
```

这不是真实数学定义，只是为了得到一个依赖 `P` 的命题。

假设已有两个大型结果：

```lean
mazur : ∀ P : ToyFrey, IsIrreducible P
wiles : ∀ P : ToyFrey, ¬ IsIrreducible P
```

那么：

```lean
theorem noToyFreyFromGlobalResults
    (mazur : ∀ P : ToyFrey, IsIrreducible P)
    (wiles : ∀ P : ToyFrey, ¬ IsIrreducible P)
    (P : ToyFrey) : False :=
  wiles P (mazur P)
```

逐步计算类型：

```text
mazur P             : IsIrreducible P
wiles P             : IsIrreducible P → False
wiles P (mazur P)   : False
```

这就是类型检查器看到的全部顶层逻辑。

## 练习

完成 `Exercises/L07_ToyFrey.lean`，只需一行：

```lean
theorem coreContradiction
    (P : ToyFrey)
    (hIrr : IsIrreducible P)
    (hNotIrr : ¬ IsIrreducible P) : False := by
  -- ...
```

??? success "参考答案"
    ```lean
    exact hNotIrr hIrr
    ```

## 对应的真实代码

```lean
theorem solution (P : FreyPackage) : False :=
  FreyPackage.Wiles_Frey P (FreyPackage.Mazur_Frey P)
```

现在你已经可以读懂这行 Lean 的逻辑结构。尚未学习的是两个输入定理背后的数学。

<div class="checkpoint">检查点：能够从左到右写出三个表达式的类型，而不只是说“它们矛盾”。</div>

