---
title: First-Order Logic
category: concepts
tags: [logic, reasoning, quantifiers, objects, relations]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 8"]
created: 2026-04-07
updated: 2026-04-07
---

# First-Order Logic (FOL)

**First-Order Logic** extends [[propositional-logic]] with explicit representation of **objects**, **relations**, and **quantification**. It's the standard formal language for knowledge representation in AI.

## Advantages over Propositional Logic

| Feature | Propositional | FOL |
|---------|---------------|-----|
| Objects | Implicit | Explicit |
| Relations | Implicit | Explicit functions/predicates |
| Generalization | No | ∀, ∃ quantifiers |
| Expressiveness | Limited | Rich |
| Scalability | Combinatorial explosion | Better (still hard) |

## Syntax

### Basic Elements

**Constants**: Specific objects (e.g., John, Paris, 2)
**Predicates**: Relations on objects (e.g., Brother(x,y), Color(x, red))
**Functions**: Map objects to objects (e.g., Father(x), Plus(2,3))
**Variables**: Placeholders (e.g., x, y, z)
**Quantifiers**:
  - **∀ (Universal)**: "For all" — ∀x Brother(x, y) → Sibling(x, y)
  - **∃ (Existential)**: "There exists" — ∃x Father(x, y)

### Well-Formed Formulas

**Terms**: Constants, variables, functions
- John, x, Father(John)

**Atoms**: Predicates applied to terms
- Loves(John, Mary), Brother(Father(John), y)

**Complex formulas**: Using ¬, ∧, ∨, →, ↔, ∀, ∃

## Semantics

### Models
- Domain: Set of objects
- Interpretation: Maps constants/predicates/functions to domain elements
- Truth: Sentence is true in model if it maps to true under interpretation

### Key Distinctions

**Ontological commitment**: What exists (objects, properties, relations)
**Epistemological commitment**: What we can know (complete/incomplete knowledge)

**Closed-World Assumption**: What is not provably true is false
**Open-World Assumption**: Unknown statements could be true or false

## Knowledge Engineering in FOL

### Domains

**Kinship**: Family relations, ancestry
**Numbers**: Peano axioms, arithmetic
**Sets**: Membership, subset, operations
**Lists**: Cons, head, tail operations
**Domains**: Electronic circuits, wumpus world

### Typical Process

1. Identify objects, properties, relations
2. Define predicates and functions
3. Write sentences expressing constraints
4. Add rules for deriving new knowledge

## Important Concepts

### Substitution & Unification
- **Substitution**: Replace variables with terms
- **Unification**: Find substitution making two formulas identical
- **Most General Unifier (MGU)**: Simplest unification

### Unique Names Assumption
- Different names refer to different objects
- John ≠ Mary ≠ 2

### Database Semantics
- Closed-world for facts (not in DB = false)
- Open-world for derived facts

## Inference in FOL

See [[inference-in-first-order-logic]] for detailed treatment

**Methods**:
- Universal Instantiation → Propositionalization
- Generalized Modus Ponens (lifted inference)
- Forward Chaining: FOL-FC-ASK
- Backward Chaining: FOL-BC-ASK, Prolog
- Resolution: Convert to CNF, Skolemization, binary resolution

## Limitations

- Decidability: FOL is **semidecidable** (can prove entailments but not non-entailments)
- Complexity: Inference is hard (NP-hard in propositional fragment)
- Still cannot express higher-order notions (predicates of predicates)

## Extensions

- **Second-Order Logic**: Quantify over predicates/functions
- **Description Logics**: Subset of FOL with decidable fragments
- **Modal Logic**: Knowledge, belief, necessity/possibility
- **Temporal Logic**: Time-dependent propositions

## Related Concepts

- [[Propositional-Logic]] — Simpler base logic
- [[Inference-in-First-Order-Logic]] — Proof methods for FOL
- [[Logic-Programming]] — Practical FOL implementation
- [[Knowledge-Representation]] — How to encode domain knowledge

## References

Russell & Norvig (2010): Chapter 8 - First-Order Logic
