---
title: Search Algorithms
category: concepts
tags: [problem-solving, algorithms, uninformed-search, informed-search]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 3-4"]
created: 2026-04-07
updated: 2026-04-07
---

# Search Algorithms

**Search** is the process of finding a sequence of actions that achieves a goal in a given environment. It's fundamental to [intelligent-agent](intelligent-agent.md) problem-solving.

## Problem Formulation

Every search problem requires:
- **Initial state**: Where the agent starts
- **Actions/Operators**: Available moves in each state
- **Transition model**: Result of applying an action
- **Goal test**: Condition(ing that identifies goal states
- **Path cost**: Cost of each action (usually 1, but can vary)

## Search Space Concepts

- **State space**: The set of all possible states reachable from initial state
- **Search tree**: Tree representation of paths from initial state
- **Search graph**: State space represented as a graph (with cycles/revisits handled)

## Uninformed Search Strategies

Blind search with no domain knowledge. Characterized by:
- **Completeness**: Does it find a solution if one exists?
- **Optimality**: Does it find the minimum-cost solution?
- **Time complexity**: Grows with branch factor $b$ and depth $d$
- **Space complexity**: Memory required

### Key Uninformed Algorithms

| Algorithm | Complete? | Optimal? | Time | Space | Notes |
|-----------|-----------|----------|------|-------|-------|
| [BFS](bfs.md) | Yes | Yes (if cost=1) | $O(b^d)$ | $O(b^d)$ | Exponential memory |
| [DFS](dfs.md) | No | No | $O(b^m)$ | $O(bm)$ | m=max depth |
| [IDDFS](iddfs.md) | Yes | Yes | $O(b^d)$ | $O(bd)$ | Best uninformed |
| Uniform-cost | Yes | Yes | $O(b^{C*/\epsilon})$ | Exponential | Handles varying costs |

### [BFS](bfs.md) (Breadth-First Search)
- Expand shallowest nodes first
- Uses FIFO queue
- Complete and optimal for unit-cost problems
- Memory-intensive: stores all nodes at frontier

### [DFS](dfs.md) (Depth-First Search)
- Expand deepest nodes first  
- Uses LIFO stack
- Space-efficient but can get lost in infinite branches
- Not guaranteed to find optimal solution

### [IDDFS](iddfs.md) (Iterative Deepening Depth-First Search)
- Combines DFS space-efficiency with BFS completeness
- Repeats DFS with increasing depth limits
- Asymptotically same complexity as BFS, better memory
- Preferred uninformed strategy

## Informed (Heuristic) Search

Uses domain knowledge to guide search via **heuristic function** $h(n)$ = estimated cost to goal.

### [A*](a*.md) Search
- **Most important algorithm in AI**
- Evaluation function: $f(n) = g(n) + h(n)$
  - $g(n)$ = actual cost from start to $n$
  - $h(n)$ = heuristic estimate from $n$ to goal
- **Optimal** if heuristic is admissible
- **Most efficient** if heuristic is consistent
- Expands fewest nodes among optimal algorithms

### Admissibility & Consistency

- **Admissible**: $h(n) \leq h^*(n)$ for all $n$ (never overestimates)
- **Consistent**: $h(n) \leq c(n,a,n') + h(n')$ (triangle inequality)
- Consistency implies admissibility

### Heuristic Generation

Sources of good heuristics:
- **Relaxed problems**: Remove constraints
- **Pattern databases**: Precomputed optimal solutions to subproblems
- **Learning**: Machine learning from experience

## Local Search

For problems where path doesn't matter, only final solution:

- **Hill climbing**: Greedy, get stuck in local maxima
- **Simulated annealing**: Probabilistic, escape local optima
- **Genetic algorithms**: Population-based evolution
- **Beam search**: Keep k best nodes

## Beyond Classical Search

- **Nondeterministic environments**: [AND-OR-Search](and-or-search.md)
- **Partial observability**: Belief states, sensorless problems
- **Online search**: No model, learn environment online ([LRTA*](lrta*.md))

## Related Concepts

- [Problem-Solving](problem-solving.md) — Framework for using search
- [Planning](planning.md) — High-level search in action space
- [Game-Playing](game-playing.md) — Adversarial search ([Minimax](minimax.md), [Alpha-Beta-Pruning](alpha-beta-pruning.md))
- [Constraint-Satisfaction](constraint-satisfaction.md) — Specialized search for CSPs

## References

Russell & Norvig (2010): Chapters 3-4
