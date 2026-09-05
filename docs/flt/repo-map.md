# FLT 仓库阅读地图

## 先看哪些文件

按以下顺序阅读，不要从目录第一项开始扫：

1. [`FinalCheck.lean`](https://github.com/anthropics/fermats-last-theorem/blob/main/FinalCheck.lean)
2. [`S_fermat_last_theorem.lean`](https://github.com/anthropics/fermats-last-theorem/blob/main/P2M/Sol/S_fermat_last_theorem.lean)
3. [`S_FLT_fermatLastTheorem.lean`](https://github.com/anthropics/fermats-last-theorem/blob/main/P2M/Sol/S_FLT_fermatLastTheorem.lean)
4. [`Def_FLTPrelim_FreyPackage.lean`](https://github.com/anthropics/fermats-last-theorem/blob/main/Definitions/Def_FLTPrelim_FreyPackage.lean)
5. [`S_FreyPackage_no_frey_package.lean`](https://github.com/anthropics/fermats-last-theorem/blob/main/P2M/Sol/S_FreyPackage_no_frey_package.lean)
6. [`PROOF-PATH.md`](https://github.com/anthropics/fermats-last-theorem/blob/main/PROOF-PATH.md)

看到大段 `attribute [-instance]` 和 `attribute [-simp]` 时直接跳到文件末尾的 theorem。

## 六段证明主线

```text
一般指数 n ≥ 3
  │
  ├─ 归约到奇素数 p
  ├─ p = 3 使用已有结果
  └─ p ≥ 5
       │
       ▼
  从反例构造 FreyPackage
       │
       ├─ Mazur_Frey：表示不可约
       │
       └─ frey_isModular：Frey 曲线模
              │
              ▼
         level_lowering_to_two
              │
              ▼
         非零 f ∈ S₂(Γ₀(2))
              │
              ▼
         S₂(Γ₀(2)) = 0
              │
              ▼
            False
```

## `Wiles_Frey` 的最后四行

```lean
theorem Wiles_Frey (P : FreyPackage) :
    ¬ GaloisRepIsIrreducible ℚ P.freyCurve P.p := fun hirr =>
  let ⟨f, hf⟩ := level_lowering_to_two P (frey_isModular P) hirr
  hf (ModularForm.S2_Gamma0_2_eq_zero f)
```

暂时把长命题缩写成 `Irr P`：

1. 假设 `hirr : Irr P`。
2. 模性、不可约性与降层产生一个尖点形式 `f`。
3. `hf : f ≠ 0`。
4. 但 `S2_Gamma0_2_eq_zero f : f = 0`。
5. `hf (...) : False`。

## `no_frey_package` 的闭合

```lean
theorem solution (P : FreyPackage) : False :=
  FreyPackage.Wiles_Frey P (FreyPackage.Mazur_Frey P)
```

这一行只组合两个定理：

```text
Mazur_Frey P : Irr P
Wiles_Frey P : Irr P → False
```

## 阅读一条依赖链的方法

对于 `P2M/Sol/S_X.lean`：

1. 跳过生成的 `attribute` 前导。
2. 找到最后的 `theorem solution`。
3. 给每个长类型起一个纸面缩写。
4. 查看文件开头的 `import Theorems.Thm_...`。
5. 只打开当前证明实际调用的下一级定理。
6. 每次最多向下追一层，先能复述再继续。

这是一张有向无环依赖图，不是一本必须按文件名顺序阅读的书。

