---
title: Constraint Satisfaction Problems
category: concepts
tags: [CSP, constraints, backtracking, inference]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 6"]
created: 2026-04-07
updated: 2026-04-07
---

# Constraint Satisfaction Problems (CSP)

A **Constraint Satisfaction Problem** is a problem formulated as finding values for a set of variables that satisfy a set of constraints. CSP is a specialized search formulation that's very effective for certain problem classes.

## CSP Formulation

Every CSP consists of:
- **Variables** $X = \{X_1, X_2, \ldots, X_n\}$
- **Domains** $D = \{D_1, D_2, \ldots, D_n\}$ (possible values for each variable)
- **Constraints** $C$: Relations restricting valid combinations

### Constraint Types

- **Unary**: Constraint on single variable
- **Binary**: Constraint between two variables  
- **Global**: Constraint involving multiple variables (e.g., Alldiff)
- **Soft/Preference**: Violations have costs (weighted CSP)

## Problem Representation

### Constraint Graph
- **Nodes**: Variables
- **Edges**: Pairs of variables that share a constraint
- Useful for analyzing problem structure

## Search Approaches

### Backtracking Search

Standard depth-first search with constraints:

```
BACKTRACK(assignment):
  if COMPLETE(assignment):
    return assignment
  var = SELECT-UNASSIGNED-VARIABLE()
  for value in ORDER-DOMAIN-VALUES(var):
    if is_consistent(var, value, assignment):
      assignment[var] = value
      result = BACKTRACK(assignment)
      if result != failure:
        return result
      delete assignment[var]
  return failure
```

### Heuristics for Backtracking

**Variable ordering**:
- **MRV** (Minimum Remaining Values): Choose variable with fewest legal values
- **Degree heuristic**: Choose variable with most constraints on remaining variables

**Value ordering**:
- **Least-constraining-value**: Choose value that leaves most options for neighbors

### Constraint Propagation / Inference

Reduce domains before/during search:

- **Node consistency**: Unary constraints satisfied for all values
- **Arc consistency**: $X_i$ is arc-consistent with $X_j$ if every value in $D_i$ has a compatible value in $D_j$
  - [[AC-3]] algorithm: Most common implementation
- **Path consistency**: Consistency for paths of 3 variables
- **K-consistency**: Generalization to k variables

### Backtracking + Constraint Propagation

- **Forward checking**: After assignment, remove inconsistent values from neighbors
- **MAC** (Maintaining Arc Consistency): Full AC-3 after each assignment
- Intelligent backtracking: Backjump to conflict source ([[conflict-directed-backjumping]])

## Local Search for CSPs

For large CSPs, complete search may be infeasible:

- **Min-conflicts**: Assign values that minimize constraint violations
- **Constraint weighting**: Increase weight of violated constraints
- Often works well in practice despite incompleteness

## Exploiting Problem Structure

CSP performance depends heavily on constraint graph structure:

- **Tree-structured**: Solvable in polynomial time (linear in $n$)
- **Cycle cutsets**: Remove vertices to eliminate cycles
- **Tree decomposition**: Decompose into tree of subproblems
- **Independent subproblems**: Solve separately and combine

## Applications

- **Map coloring**: Color regions with constraint that adjacent ≠ same color
- **Scheduling**: Assign time slots to tasks with temporal constraints
- **Sudoku**: Variables = cells, values = 1-9, constraints = row/column/box uniqueness
- **Configuration**: Component selection respecting compatibility
- **Cryptarithmetic**: Assign digits to letters in arithmetic equations

## Related Concepts

- [[Search]] — CSP as specialized search problem
- [[Inference]] — Constraint propagation
- [[Optimization]] — Weighted CSP/constraint relaxation
- [[Planning]] — Uses CSP-like constraint formulation

## References

Russell & Norvig (2010): Chapter 6 - Constraint Satisfaction Problems
