---
title: Game Playing & Adversarial Search
category: concepts
tags: [games, adversarial-search, minimax, alpha-beta]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 5"]
created: 2026-04-07
updated: 2026-04-07
---

# Game Playing & Adversarial Search

Game playing represents a class of problems where an [[intelligent-agent]] must make decisions in the presence of an **adversary** — another agent trying to minimize the first agent's success.

## Game Formulation

A game requires:
- **Players**: Usually two (MAX and MIN)
- **Initial state**: Starting board configuration
- **Actions/Moves**: Legal moves from each state
- **Terminal states**: End-of-game configurations
- **Utility function**: Score for each terminal state
- **Turn-taking**: Players alternate moves

## Game Tree Search

- **Game tree**: Tree of all possible move sequences
- **Terminal nodes**: Leaf nodes with known utility values
- **Ply**: One move by one player

## [[Minimax]] Algorithm

The foundational adversarial search algorithm:

```
MINIMAX(state):
  if TERMINAL-TEST(state):
    return UTILITY(state)
  if MAX's turn:
    return max( MINIMAX(child) for each child )
  else:  # MIN's turn
    return min( MINIMAX(child) for each child )
```

**Properties**:
- Complete: Finds optimal move (assuming perfect play)
- Optimal: Assumes both players play optimally
- Time: $O(b^d)$ where $b$ = branching factor, $d$ = depth
- Space: $O(bd)$ for depth-first implementation

## [[Alpha-Beta-Pruning]]

Critical optimization for minimax:
- **Pruning**: Eliminate branches that can't affect decision
- **Alpha**: Best value MAX can guarantee so far
- **Beta**: Best value MIN can guarantee so far
- **Prune** when alpha >= beta

**Result**: Reduces time from $O(b^d)$ to $O(b^{d/2})$ with good move ordering

### Move Ordering
- Better move ordering → more effective pruning
- Use transposition tables to cache evaluated positions
- Killer moves: Moves that worked well in sibling nodes

## Imperfect Real-Time Decisions

Since full game trees are too large, real systems need:

### Evaluation Functions
- Heuristic estimate of position value without reaching terminal states
- Domain-specific features: material, piece position, etc.
- Must be relatively fast to compute

### Cutoff Tests
- Stop search at fixed depth (horizon effect problem)
- Quiescence search: Extend search on "active" positions
- Singular extensions: Extend for unique best move

### Horizon Effect
- AI can't see beyond search horizon
- May make moves that look good locally but fail long-term
- Addressed via quiescence search and forward pruning

## Stochastic Games

Games with randomness (chance events):
- **Expectiminimax**: Extend minimax to include chance nodes
- **Expectation**: Average value over possible chance outcomes
- **Monte Carlo**: Sample random outcomes rather than enumerate

## Partially Observable Games

Games where full state isn't visible:
- Card games, Kriegspiel (blind chess)
- [[Belief states]]: Maintain distribution over possible states
- Different from fully observable games

## Historical Examples

- **Deep Blue** (1997): Defeated Kasparov at chess using minimax + pruning + evaluation
- **Chinook** (1989): Checkers, "weakly solved" the game
- **TD-Gammon** (1995): Backgammon using [[temporal-difference-learning]]
- **MOGO/AlphaGo** (2016): Go using [[Monte-Carlo-Tree-Search]] + [[neural-networks]]

## Related Concepts

- [[Search]] — Foundation for game tree exploration
- [[Rational-Agent]] — Optimal strategy assumption
- [[Monte-Carlo-Tree-Search]] — Modern game AI
- [[Temporal-Difference-Learning]] — Learning game evaluation functions

## References

Russell & Norvig (2010): Chapter 5 - Adversarial Search
