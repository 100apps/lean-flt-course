# 第 6 课：结构体

真实的 `FreyPackage` 把一个规范化的费马反例及其全部条件打包成一个对象。我们先做简化版：

```lean
structure ToyFrey where
  a : Int
  b : Int
  c : Int
  p : Nat
  hp5 : 5 ≤ p
  hEquation : a ^ p + b ^ p = c ^ p
```

注意：字段不仅能保存数字，也能保存证明。

给定：

```lean
P : ToyFrey
```

就有：

```lean
P.a          -- 整数
P.p          -- 自然数
P.hp5        -- 5 ≤ P.p 的证明
P.hEquation  -- 方程成立的证明
```

## 构造对象

```lean
def trivialPackage : ToyFrey where
  a := 0
  b := 0
  c := 0
  p := 5
  hp5 := by norm_num
  hEquation := by norm_num
```

它不是真正反例，因为三个数都是零；本课只演示结构体语法。

## 练习

```lean
theorem exponent_positive (P : ToyFrey) : 0 < P.p := by
  -- 已知 P.hp5 : 5 ≤ P.p
```

提示：可以把 `P.hp5` 交给不等式传递定理。

??? success "参考答案"
    ```lean
    exact lt_of_lt_of_le (by norm_num) P.hp5
    ```

## 与真实定义的连接

真实 `FreyPackage` 还包括：

- `a b c ≠ 0`；
- `p` 是素数；
- `gcd a b = 1`；
- `a ≡ 3 (mod 4)`；
- `b ≡ 0 (mod 2)`。

这些规范化条件使后续 Frey 曲线具有需要的算术性质。

<div class="checkpoint">检查点：能解释为什么 <code>hp5</code> 是数据包的一部分，而不是文件外的一句注释。</div>
