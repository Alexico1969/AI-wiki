---
title: Mathematical Foundations & Background
category: references
tags: [mathematics, linear-algebra, probability, complexity, BNF]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Appendices A & B"]
created: 2026-04-07
updated: 2026-04-07
---

# Mathematical Foundations & Background

This reference covers essential mathematical concepts underpinning AI algorithms throughout the textbook.

## Linear Algebra

### Systems of Linear Equations
Solve **Ax = b** by matrix inversion:
```
A^(-1) * A * x = A^(-1) * b
x = A^(-1) * b
```

**Example**: 
```
2x + y - z = 8
-3x - y + 2z = -11
-2x + y + 2z = -3
```

Solved: x = 2, y = 3, z = -1

### Matrices
- Matrix multiplication, inversion, determinants
- Eigenvalues and eigenvectors
- Used in: neural networks (weight matrices), covariance (probabilistic reasoning)

---

## Probability Distributions

### Axioms of Probability
1. **0 ≤ P(X = xᵢ) ≤ 1** — Probabilities between 0 and 1
2. **Σ P(X = xᵢ) = 1** — Total probability is 1
3. **P(A ∨ B) = P(A) + P(B)** — Disjoint events sum

### Discrete Probability
- **Random variable**: X represents an event; values xᵢ
- **Probability distribution**: P(X) = ⟨P(x₁), ..., P(xₙ)⟩
- **Conditional probability**: P(B|A) = P(B ∩ A) / P(A)
- **Conditional independence**: P(B|A) = P(B)

### Continuous Probability

**Probability Density Function (PDF)**:
```
P(x) = lim(dx→0) P(x ≤ X ≤ x + dx) / dx
```

- Must satisfy: ∫₋∞^∞ P(x) dx = 1
- Units: measured in 1/[variable units] (e.g., Hz if x in seconds)

**Cumulative Distribution Function (CDF)**:
```
F_X(x) = P(X ≤ x) = ∫₋∞^x P(u) du
```

### Gaussian (Normal) Distribution

**1D Gaussian**:
```
P(x) = (1/(σ√(2π))) * exp(-(x-μ)² / (2σ²))
```
- Mean: μ
- Standard deviation: σ
- Variance: σ²

**Standard Normal**: μ = 0, σ² = 1

**Multivariate Gaussian** (n-dimensional):
```
P(x) = (1/√((2π)ⁿ|Σ|)) * exp(-½(x-μ)ᵀΣ⁻¹(x-μ))
```
- Mean vector: **μ**
- Covariance matrix: **Σ**

### Central Limit Theorem
Distribution of sample means tends to normal as sample size → ∞, regardless of original distribution (under mild conditions).

**Implication**: Gaussian distributions appear naturally in many contexts

---

## Expectation & Variance

### Expectation (Mean)
**Discrete**:
```
E(X) = Σᵢ xᵢ P(X = xᵢ)
```

**Continuous**:
```
E(X) = ∫₋∞^∞ x P(x) dx
```

### Root Mean Square (RMS)
```
RMS(x₁, ..., xₙ) = √((x₁² + ... + xₙ²) / n)
```

### Covariance
```
cov(X, Y) = E((X - μₓ)(Y - μᵧ))
```

**Covariance Matrix** (for vector **X** = ⟨X₁, ..., Xₙ⟩):
```
Σᵢⱼ = cov(Xᵢ, Xⱼ) = E((Xᵢ - μᵢ)(Xⱼ - μⱼ))
```

---

## Computational Complexity

### Big-O Notation
Introduced by Bachmann (1894), now standard in computer science.

**Hierarchy**:
- O(1) — Constant
- O(log n) — Logarithmic
- O(n) — Linear
- O(n log n) — Linearithmic
- O(n²) — Quadratic
- O(2ⁿ) — Exponential
- O(n!) — Factorial

### NP-Completeness
- **NP**: Problems verifiable in polynomial time
- **NP-Complete**: Hardest problems in NP (all equivalent under polynomial-time reduction)
- **Key result** (Cook 1971, Karp 1972): If any NP-complete problem is polynomial-time solvable, then all are
- **Implication**: Either all are hard or all are easy (P = NP conjecture remains open)

**Examples of NP-Complete**:
- Traveling Salesman Problem (TSP)
- Boolean Satisfiability (SAT)
- Graph Coloring
- Knapsack Problem

---

## Formal Languages & Grammars

### Context-Free Grammars (CFG)
Defined by four components:

1. **Terminal Symbols**: Actual words/symbols in the language
   - Examples: "dog", "cat", "the"

2. **Nonterminal Symbols**: Categories for subphrases
   - Examples: NounPhrase, VerbPhrase, Sentence

3. **Start Symbol**: Top-level nonterminal
   - English: Sentence
   - Arithmetic: Expr
   - Programming: Program

4. **Rewrite Rules**: Form **LHS → RHS**
   - Sentence → NounPhrase VerbPhrase
   - NounPhrase → Article Noun
   - Abbreviation: S → A | B (means S → A or S → B)

### Backus-Naur Form (BNF)
Standard notation for defining formal grammars:

**Example** (simple arithmetic):
```
Expr → Expr + Term | Term
Term → Term * Factor | Factor
Factor → (Expr) | number
```

**Used in textbook for**:
- Propositional logic syntax (page 243)
- First-order logic syntax (page 293)
- English subset grammar (page 899)

### Why CFG?
- **Context-free**: Same rewrite rules apply regardless of context
- **Expressive**: Can define infinite languages concisely
- **Parseable**: Efficient parsing algorithms (O(n³) for general CFG)
- **Natural**: Mirrors human language structure

---

## Key References

**Linear Algebra & Algorithms:**
- Knuth (1973) — The Art of Computer Programming
- Aho, Hopcroft, Ullman (1974) — Design and Analysis of Computer Algorithms
- Cormen, Leiserson, Rivest (1990) — Introduction to Algorithms

**Complexity Theory:**
- Garey & Johnson (1979) — Computers and Intractability
- Papadimitriou (1994) — Computational Complexity

**Probability:**
- Chung (1979) — Elementary Probability Theory
- Ross (1988) — A First Course in Probability
- Bertsekas & Tsitsiklis (2008) — Introduction to Probability

**Note on Notation:**
- **log(x)** = natural logarithm (base e)
- **argmax_x f(x)** = value of x maximizing f(x)

---

## How These Foundations Support AI

- **Linear Algebra**: Neural network weights, covariance matrices in Bayesian networks
- **Probability**: Foundation for all uncertain reasoning, Bayes' theorem, decision theory
- **Complexity Theory**: Understand which problems are tractable vs. NP-hard
- **Formal Languages**: Knowledge representation, logic syntax, NLP grammars

All major AI algorithms build on these mathematical foundations.
