# 第 1 课：表达式与类型

## 本课目标

看到一段 Lean 时，先问：“这个东西的类型是什么？”

```lean
#check Nat
#check (3 : Nat)
#check (3 ≤ 5)
```

读法：

- `Nat` 是自然数类型；也常写作 `ℕ`。
- `(3 : Nat)` 表示把 `3` 明确看作自然数。
- `3 ≤ 5` 的类型是 `Prop`，即一个命题。
- `#check` 询问类型，不是在证明。

## 定义一个函数

```lean
def double (n : Nat) : Nat := n + n
```

逐段阅读：

- `def`：定义一个新对象。
- `double`：名字。
- `(n : Nat)`：输入是自然数。
- `: Nat`：输出是自然数。
- `:= n + n`：具体定义。

Lean 可以计算：

```lean
#eval double 7
```

但“计算得到 14”和“构造等式证明”是两个相关而不同的动作：

```lean
example : double 7 = 14 := by
  norm_num [double]
```

## 练习

打开 `Exercises/L01_Expressions.lean`，把 `sorry` 换成证明：

```lean
theorem double_three : double 3 = 6 := by
  -- 写在这里
```

提示：模仿本课的 `norm_num [double]`。

??? success "参考答案"
    ```lean
    by
      norm_num [double]
    ```

## 与 FLT 仓库的连接

最终定理中的：

```lean
(n : ℕ) (a b c : ℕ)
```

只是四个带类型的输入。复杂性来自随后附加的条件和证明，并不来自这段声明本身。

<div class="checkpoint">检查点：你能解释 <code>(hn : 3 ≤ n)</code> 中“变量名、类型、命题”分别是什么。</div>

