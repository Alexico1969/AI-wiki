---
title: Knowledge Representation
category: concepts
tags: [ontology, categories, events, time, semantic-networks]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 12"]
created: 2026-04-07
updated: 2026-04-07
---

# Knowledge Representation

**Knowledge Representation (KR)** is the study of how to express knowledge about the world in a form that a computer system can utilize to solve complex tasks. It bridges semantics (meaning) and computation (algorithms).

## Fundamental Commitments

Every KR scheme makes commitments:

**Ontological**: What kinds of things exist?
- Objects only? Properties? Relations? Events? Time?
- Affects what can be represented

**Epistemological**: What states of knowledge are possible?
- Complete knowledge vs. incomplete?
- Certain vs. uncertain?
- What can be expressed vs. not?

## Core Concepts in KR

### Categories & Taxonomies
- **Category**: Set of objects with shared properties
- **Inheritance**: Properties of category inherited by members
- **Instance relationship**: Individual belongs to category
- **Subset relationship**: One category is subset of another
- **Disjoint categories**: Non-overlapping categories

### Physical Composition
- **PartOf**: One object is part of another
- **Composite objects**: Objects made of parts
- **Bunches**: Collections (less strict than sets)
- **Intrinsic vs. extrinsic properties**: Internal vs. relational

### Measurements
- **Units functions**: Convert between units (Miles(10) = Kilometers(16))
- **Qualitative comparisons**: Greater, less, equal
- **Time in measurements**: Relative/absolute timestamps

### Objects vs. Stuff
- **Objects (count nouns)**: Discrete, countable (apples, chairs)
- **Stuff (mass nouns)**: Continuous, measured by quantity (water, sand)
- Different inference patterns

## Time & Events

### Event Calculus
- **Fluent**: Property that changes over time
- **Happens(a, t)**: Action a occurs at time t
- **Initiates(a, f, t)**: Action a starts fluent f at time t
- **Terminates(a, f, t)**: Action a ends fluent f at time t
- **Clipped(f, t1, t2)**: Fluent f becomes false between t1 and t2
- **Restored(f, t1, t2)**: Fluent f becomes true between t1 and t2

### Intervals & Temporal Relations
**Allen's Interval Algebra**: 13 basic relations between intervals
- Meets, Before, During, Overlaps, Starts, Finishes, Equal

### Processes vs. Events
- **Events (discrete)**: Instantaneous state changes
- **Processes (liquid events)**: Continuous activities

## Mental States & Modality

### Propositional Attitudes
- Belief, knowledge, desire, intention
- Nested beliefs: Agent1 believes Agent2 believes X

### Modal Logic
- **Necessary**: True in all possible worlds
- **Possible**: True in some possible world
- **Knowledge**: Accessibility relations (what agent can infer)
- **Belief**: More relaxed than knowledge

### Semantic Networks
- Graphical representation of knowledge
- Nodes: Objects/concepts
- Edges: Relations
- Advantages: Intuitive, visual, enable spreading activation
- Limitations: Lack formal semantics (historically)

### Description Logics
- Formal subset of FOL with decidable inference
- Defines concepts as logical combinations
- Subsumption, classification, consistency checking
- Examples: CLASSIC, OWL (Semantic Web)

## Non-Monotonic Reasoning

**Monotonic**: Adding facts never invalidates old conclusions
**Non-monotonic**: New facts can invalidate old inferences
- "Typically birds fly" — unless it's a penguin
- "Normally healthy people are not hospitalized" — exception if very sick

### Approaches

**Circumscription**: Assume false what's not provably true (closed-world)
**Default Logic**: Use default rules: "Typically X is Y unless exception"
**Truth Maintenance**: Track justifications, revise when contradictions found

### Truth Maintenance Systems
- **JTMS (Justification-based)**: Record why each fact is believed
- **ATMS (Assumption-based)**: Track which assumptions support facts
- Enable nonmonotonic reasoning + contradiction handling

## Knowledge Acquisition Problem

**Bottleneck**: How to encode all relevant knowledge?
- Hand-coding is tedious
- Machine learning incomplete without domain knowledge
- Ontology engineering essential for large systems

## Application: Internet Shopping Agent

Domain knowledge needed:
- Taxonomies of products
- Pricing, availability, quality
- Shipping policies, payment methods
- Customer preferences, trust relationships
- Temporal aspects (stock changes, sales periods)

## Related Concepts

- [Logic](logic.md) — Formal foundation for KR
- [Inference](inference.md) — Using KR to derive conclusions
- [Knowledge-Based-Agents](knowledge-based-agents.md) — Agents using KR schemes
- [Ontology-Engineering](ontology-engineering.md) — Building large-scale KR systems

## References

Russell & Norvig (2010): Chapter 12 - Knowledge Representation
