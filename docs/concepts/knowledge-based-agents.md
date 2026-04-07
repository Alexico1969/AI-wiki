---
title: Knowledge-Based Agents
category: concepts
tags: [knowledge, reasoning, agents, logic]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 7"]
created: 2026-04-07
updated: 2026-04-07
---

# Knowledge-Based Agents

A **knowledge-based agent** represents knowledge explicitly using a **knowledge base (KB)** and employs a process of **inference** to derive new knowledge and determine actions. This is the foundation of intelligent reasoning in AI.

## Architecture

### Knowledge Base (KB)
- Set of **sentences** expressing assertions about the world
- Expressed in a **knowledge representation language**
- Sentences may be **axioms** (given facts) or **derived** from other sentences

### Core Operations

**TELL**: Add new knowledge to the KB
**ASK**: Query what is known (may involve inference)
**MAKE-PERCEPT-SENTENCE**: Convert percepts to KB sentences
**MAKE-ACTION-QUERY**: Ask what action to perform
**MAKE-ACTION-SENTENCE**: Assert action was executed

### Agent Cycle

```
1. TELL KB: perceived facts
2. ASK KB: what action?  [involves inference]
3. TELL KB: action executed
4. Execute action
```

## Inference Requirement

Answers from ASK must **follow from** previous TELLs:
- Inference must be **sound** (never derive false conclusions)
- Inference should be **complete** (derive all entailed conclusions)
- Must be computationally feasible

## Levels of Representation

### Knowledge Level
- "Agent knows that Paris is in France"
- High-level logical description
- What the agent knows abstractly

### Implementation Level
- Data structures, algorithms, symbols
- How the knowledge is stored and manipulated
- System design details

## Properties

**Advantages**:
- Composable: Combine knowledge components flexibly
- Task-flexible: Accept new goals without reprogramming
- Adaptive: Learn new knowledge and update
- Explainable: Can justify reasoning

**Challenges**:
- Knowledge acquisition: How to collect all relevant facts?
- Representation bottleneck: Finding efficient representations
- Computational complexity: Inference can be expensive
- Imperfect/uncertain knowledge: Real world is messy

## Representation Languages

- **Propositional Logic**: [[propositional-logic]]
- **First-Order Logic**: [[first-order-logic]]
- **Logic Programs/Prolog**: [[logic-programming]]
- **Description Logics**: [[description-logics]]
- **Nonmonotonic Logics**: [[nonmonotonic-reasoning]]

## Related Concepts

- [[Inference]] — Deriving new knowledge
- [[Logic]] — Foundation for representations
- [[Planning]] — Using KB to sequence actions
- [[Knowledge-Representation]] — Systematic study of how to encode knowledge

## References

Russell & Norvig (2010): Chapter 7 - Logical Agents
