---
title: Classical Planning
category: concepts
tags: [planning, actions, goals, state-space-search]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 10"]
created: 2026-04-07
updated: 2026-04-07
---

# Classical Planning

**Classical planning** is the problem of finding a sequence of actions that transform an initial world state into a goal state. It's a key application of knowledge representation and search.

## Problem Formulation

![State Diagram and Transitions](../images/state-diagram.svg)
*State space for planning shows states (nodes) and actions (edges) that transition from initial state to goal state.*

### PDDL (Planning Domain Definition Language)

**States**:
- Conjunctions of positive ground literals
- Closed-world assumption: unmentioned facts are false
- e.g., At(A, SFO) ∧ At(B, JFK) ∧ Plane(P1)

**Actions**:
- **Preconditions**: Conditions that must be true to execute
- **Effects**: Facts added/deleted by action
- **Action schema**: Parameterized action template
  ```
  Fly(p, from, to)
    precond: At(p, from) ∧ Plane(p)
    effect: At(p, to) ∧ ¬At(p, from)
  ```

**Initial State**: Description of world at start
**Goal**: Description of desired final state
  - Partial state (only required facts)
  - Multiple goal states allowed

## Planning Domains

**Air cargo**: Fly planes, load/unload cargo
**Spare tire**: Flat tire, get tools, replace
**Blocks world**: Stack blocks, move single block
**Gripper**: Move objects with robot arm

## Complexity

- **PlanSAT**: Does a plan of length k exist? **PSPACE-complete**
- **Bounded PlanSAT**: Plan of length ≤ k? Also PSPACE-complete
- **Optimal Planning**: Find minimum-length plan? NP-hard

## Planning Algorithms

### Forward State-Space Search (Progression)
- Start from initial state
- Search forward toward goal
- At each state, try all applicable actions
- When goal reached, extract plan

**Advantages**: Intuitive, goal-driven
**Disadvantages**: Large branching factor, explores irrelevant states

### Backward State-Space Search (Regression)
- Start from goal (incomplete state)
- Search backward toward initial state
- For each goal state, find actions that produce it
- Relevant-states search: Only actions that achieve needed facts

**Advantages**: Smaller search space, more focused
**Disadvantages**: Complex state representation (partial states)

### Planning Graphs
**GRAPHPLAN algorithm**:
1. Build planning graph: States → Actions → States → ...
2. Track **mutex (mutual exclusion)** relations:
   - Actions conflict if effects contradict
   - Facts conflict if no non-conflicting path
3. Extract solution working backward:
   - Last level: goal facts
   - Earlier levels: actions supporting facts (respecting mutexes)

**Advantages**: Admissible heuristics, detects unsolvability early

### Planning as Satisfiability (SATPLAN)
- Convert planning problem to SAT formula
- Sat solver finds satisfying assignment
- Extract plan from assignment
- Competitive with specialized planners

## Planning Heuristics

**Ignore preconditions**: Remove preconditions (optimistic)
**Ignore delete lists**: Ignore negative effects (optimistic)
**State abstraction**: Remove some facts, solve abstracted problem
**Subgoal independence**: Assume goals achieved independently
**Planning graph level costs**: Use relaxed graph distances

## Real-World Planning Extensions

- **Scheduling**: Handle temporal/resource constraints
- **HTN Planning**: High-level actions, hierarchical refinement
- **Partial-order planning**: Order actions only when necessary
- **Conditional/sensorless planning**: Uncertainty in environment
- **Online replanning**: Adapt when world differs from model

## The Frame Problem

**Problem**: In action description, must specify what DOESN'T change
- Tedious: 1000 facts, 1 action changes 1 fact, must list 999 unchanged
- **Solution**: Successor-state axioms
  - Fluent is true after action iff:
    - Explicitly added by action, OR
    - Was true before and not deleted

## Related Concepts

- [Search](search.md) — Foundation for state-space search
- [Knowledge-Based-Agents](knowledge-based-agents.md) — Using KB for goal-directed behavior
- [Hierarchical-Planning](hierarchical-planning.md) — HTN for real-world complexity
- [Inference](inference.md) — Deriving what actions achieve

## References

Russell & Norvig (2010): Chapter 10 - Classical Planning
