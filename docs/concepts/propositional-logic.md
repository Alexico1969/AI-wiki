---
title: Propositional Logic
category: concepts
tags: [logic, reasoning, inference, entailment]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 7"]
created: 2026-04-07
updated: 2026-04-07
---

# Propositional Logic

**Propositional logic** is the simplest formal logical system, consisting of propositions (true/false statements) and logical connectives. While less expressive than [first-order-logic](first-order-logic.md), it illustrates all fundamental concepts and provides a complete inference system.

## Syntax

### Propositions
- **Atomic**: Single propositions (e.g., P, Q, Raining)
- **Complex**: Built from atomic propositions using connectives

### Logical Connectives

| Connective | Symbol | Meaning |
|-----------|--------|---------|
| Negation | ¬ | NOT |
| Conjunction | ∧ | AND |
| Disjunction | ∨ | OR |
| Implication | → | IF...THEN |
| Biconditional | ↔ | IF AND ONLY IF |

**Well-formed formulas (WFFs)**:
- Atomic propositions are WFFs
- If α and β are WFFs, so are ¬α, (α ∧ β), (α ∨ β), (α → β), (α ↔ β)

## Semantics

### Truth Tables
- Determine truth value of complex formulas given truth assignments
- Complete enumeration of all 2^n possible assignments for n propositions

### Key Concepts

**Model**: Assignment of true/false to all propositions
**Satisfiable**: Formula is true under at least one model
**Valid/Tautology**: Formula is true under all models
**Entailment** (⊨): α ⊨ β iff whenever α is true, β is true
  - β is a **logical consequence** of α

### Inference Problem
Given KB and query q:
- Does KB ⊨ q? (Does the KB entail the query?)
- In other words: Is q true in all models where KB is true?

## Inference Methods

### Model Checking (TT-ENTAILS)
- Enumerate all possible models
- Check KB true in each model
- Check if q is true in all those models
- **Complete** but exponential: O(2^n)

### Theorem Proving
Derive new formulas using inference rules:

**Modus Ponens**: (α → β), α ⊨ β
**And-Elimination**: (α ∧ β) ⊨ α
**Unit Resolution**: (α ∨ β), ¬β ⊨ α

### Resolution
Most important inference rule:
- **(α ∨ β), (¬β ∨ γ) ⊨ (α ∨ γ)** (Resolution rule)
- Convert KB to **Conjunctive Normal Form (CNF)**
- Repeated application of resolution generates all entailed clauses
- **Refutation**: Prove KB ∧ ¬q is unsatisfiable (contains empty clause)

**CNF**: Conjunction of disjunctions of literals
- (A ∨ B) ∧ (¬A ∨ C) ∧ (B ∨ ¬C)

**Horn Clauses**: Disjunction with at most one positive literal
- Enables efficient forward/backward chaining
- P ∨ ¬Q ∨ ¬R (same as: Q ∧ R → P)

### Forward & Backward Chaining
Efficient for **definite clauses** (Horn clauses with exactly one positive literal):

**Forward Chaining** (PL-FC-ENTAILS):
- Start from known facts (premises)
- Apply Modus Ponens forward
- Derive new facts until query found or no progress
- Linear time in KB size

**Backward Chaining**:
- Start from query
- Work backward to premises
- Recursively prove subgoals
- Depth-first search approach

### SAT Solving
**Boolean Satisfiability Problem**: Is formula satisfiable?

**DPLL Algorithm**:
- Backtracking search with pruning
- Early termination, unit propagation, pure literal elimination
- Exponential worst-case but practical for many problems

**WALKSAT**:
- Local search approach
- Random walk to escape local maxima
- Effective on large random SAT instances

## Important Properties

- **Soundness**: Only derive entailed formulas
- **Completeness**: Can derive all entailed formulas (given enough time)
- **Decidability**: Problem is decidable (solution always found eventually)

## Limitations

- No explicit representation of objects or relations
- Cannot express "for all X" or "there exists X"
- Cumbersome for domains with many propositions
- Leads to **combinatorial explosion**

## Solution: First-Order Logic
See [first-order-logic](first-order-logic.md) for more expressive power.

## Related Concepts

- [First-Order-Logic](first-order-logic.md) — More expressive extension
- [Inference](inference.md) — General inference mechanisms
- [Logic-Programming](logic-programming.md) — Programming paradigm based on logic
- [Knowledge-Representation](knowledge-representation.md) — Systematic knowledge encoding

## References

Russell & Norvig (2010): Chapter 7 - Propositional Logic
