---
title: Intelligent Agent
category: concepts
tags: [agents, architecture, perception, action]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 2"]
created: 2026-04-07
updated: 2026-04-07
---

# Intelligent Agent

An **intelligent agent** is a computational system that perceives its environment through [sensors](sensors.md) and acts upon that environment through [actuators](actuators.md). The core principle is [rationality](rationality.md) — an agent should choose actions that maximize the expected value of a [performance-measure](performance-measure.md).

## Agent Model: PEAS

![Agent-Environment Interaction](../images/agent-environment.svg)
*An intelligent agent interacts with its environment: receiving percepts (inputs) from sensors and sending actions (outputs) through actuators.*

Every intelligent agent operates within a task environment defined by **PEAS**:

- **Performance**: How well the agent achieves its goals (measured by [performance-measure](performance-measure.md))
- **Environment**: The world the agent operates in (characterized by [environment-properties](environment-properties.md))
- **Actuators**: Physical/computational mechanisms for action
- **Sensors**: Mechanisms for perceiving the environment

## Agent Function vs. Agent Program

- **Agent function**: Abstract mapping from percept sequences to actions
- **Agent program**: Concrete implementation of the agent function

## Environment Properties

Environments vary along several dimensions:

| Property | Meaning |
|----------|---------|
| Observable | Agent has full access to environment state (vs. partially observable) |
| Deterministic | Actions have deterministic effects (vs. stochastic) |
| Episodic | Each action is independent (vs. sequential) |
| Static | Environment doesn't change while agent deliberates (vs. dynamic) |
| Discrete | Finite, distinct states (vs. continuous) |
| Known | Agent knows the rules of the environment (vs. unknown) |
| Single-agent | Only one agent (vs. multiagent) |

## Agent Architectures

### Reflex Agents
- Simplest type: condition-action rules (stimulus → response)
- No memory, no planning
- Fast but brittle, no lookahead

### Model-Based Reflex Agents
- Maintains [internal-model](internal-model.md) of world state
- Can handle partially observable environments
- Still reactive, no goal planning

### Goal-Based Agents
- Has explicit goals to achieve
- Uses [search](search.md) and [planning](planning.md) to find action sequences
- More flexible than reflex agents

### Utility-Based Agents
- Maximizes [utility-function](utility-function.md) rather than binary goals
- Can handle trade-offs between competing goals
- Most sophisticated approach

### Learning Agents
- Improves performance through [machine-learning](machine-learning.md)
- Consists of: learning element, performance element, critic, problem generator
- Enables agent to adapt to new environments

## Related Concepts

- [Rationality](rationality.md) — What makes an agent "intelligent"?
- [Performance-Measure](performance-measure.md) — How to evaluate agent success
- [Search](search.md) — How agents find action sequences
- [Planning](planning.md) — High-level action sequencing
- [Learning](learning.md) — How agents improve over time

## References

- Russell & Norvig (2010): Chapter 2 - Intelligent Agents
- **Key insight**: The rational agent is the unifying framework for AI
