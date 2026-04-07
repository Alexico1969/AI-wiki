---
title: Robotics
category: concepts
tags: [robotics, perception, control, learning, planning, localization]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 25"]
created: 2026-04-07
updated: 2026-04-07
---

# Robotics

**Robotics** is the integration of [perception](perception.md), [planning](planning.md), and [control](control.md) to enable physical systems to sense, reason about, and act in the real world. It's AI applied to embodied agents.

## Key Concepts

### Configuration Space
- **State**: Position, orientation, joint angles (kinematics)
- **Configuration space**: Space of all possible robot configurations
- **Free space**: Configurations without collision
- **Workspace**: Cartesian coordinates of robot end-effector

### Kinematics
- **Forward kinematics**: Configuration → end-effector position (straightforward)
- **Inverse kinematics**: End-effector position → configuration (non-unique, hard)
- **Degrees of freedom**: Independent directions of motion (6D for rigid body in 3D)

## Core Algorithms

### Localization & Mapping

**[Monte-Carlo-Localization](monte-carlo-localization.md) (MCL)**:
- Particle filter tracking robot position
- Prediction: Propagate particles via motion model P(X'|X, v, ω)
- Update: Weight by sensor likelihood (ray-casting)
- Resampling: Focus particles on likely states
- Handles global localization + multimodal uncertainty

**[Extended-Kalman-Filter](extended-kalman-filter.md) (EKF)**:
- Linearizes nonlinear models via Taylor expansion
- Tracks belief as Gaussian (mean + covariance)
- Works well with identifiable landmarks
- Scales quadratically — practical for ~100s of landmarks

**SLAM** (Simultaneous Localization and Mapping):
- Build map while localizing within it
- EKF-SLAM: Augment state with landmark locations
- Graph relaxation: For larger maps
- Critical for autonomous exploration

### Path Planning

**Cell Decomposition**:
- Divide free space into cells
- Regular grid: Simple but high-dimensional curse
- Exact decomposition: Irregular cells matching boundaries
- Hybrid A*: Continuous state per grid cell, smooth trajectories

**Skeletonization**:
- **Voronoi graph**: Maximize clearance to obstacles
- **Probabilistic Roadmap**: Sample-based, scales to high dimensions
- **RRT** (Rapidly-exploring Random Tree): Quickly explore high-D spaces

**Planning Under Uncertainty**:
- Compute policies (not single paths) for all states
- MDP value iteration for navigation
- Information-gathering actions to reduce uncertainty
- Robust fine-motion planning for assembly

### Control

**Classical Controllers**:
- **P (Proportional)**: a = K_P × error (causes oscillation)
- **PD (Proportional-Derivative)**: Add derivative term to dampen
- **PID (Proportional-Integral-Derivative)**: Add integral to eliminate steady-state error

**Potential Fields**:
- Attractive force toward goal
- Repulsive force away from obstacles
- Real-time, no explicit planning needed
- Risk: Local minima trap robot

**Reactive Control**:
- Augmented Finite State Machines (AFSMs)
- Direct sensor-to-action without explicit model
- Emergent behavior from simple rules
- Example: Hexapod walking with stuck detection

## Perception

### Sensor Types
- **Range**: Sonar, LIDAR, radar, structured light, stereo
- **Imaging**: Cameras (passive, rich but complex)
- **Proprioceptive**: Encoders, accelerometers, gyroscopes, GPS
- **Tactile**: Force/torque, contact

### Sensor Models
- Noise model: P(z|z*) — observed vs. expected reading
- Ray-casting: Compute expected sensor values
- Beam model: Accounts for correct readings, unexpected obstacles, failures, noise

### Perception Challenges
- Sensor noise: Requires probabilistic models
- Partial observability: Infer hidden state
- Data association: Match observations to landmarks
- Multimodal distributions: Symmetry creates ambiguity
- Dynamic environments: Moving obstacles, lighting changes

## Machine Learning in Robotics

### Adaptive Perception
- Robot collects labeled training data via complementary sensors
- Example: Autonomous car uses LIDAR to label terrain, trains vision classifier on color/texture
- Enables fast feedback loops and domain adaptation

### Low-Dimensional Embedding
- Map high-D sensor streams to lower-D spaces (unsupervised)
- Discover suitable internal representations while learning models

### Reinforcement Learning
- **Policy search**: Learn control policies for complex dynamics
- Example: Autonomous helicopter acrobatics from 4 minutes of human flight data
- Simulator + real-world deployment

### Perception Learning
- Terrain classification, object recognition, activity recognition
- SVM, mixture models, neural networks on sensor data
- Web-scale data enables large feature sets

## Software Architectures

| Type | Description | Strengths | Weaknesses |
|------|-------------|-----------|-----------|
| **Subsumption** | Layered reactive FSMs | Real-time, emergent | No planning, inflexible |
| **Three-layer** | Reactive + executive + deliberative | Combines reaction & planning | Complex integration |
| **Pipeline** | Parallel data flow: sensors → perception → control | Fast, robust, asynchronous | Uses stale sensor data |

## Application Domains

- **Manufacturing**: Assembly, painting, welding
- **Transportation**: Autonomous vehicles, warehouse robots, delivery drones
- **Healthcare**: Surgical robots (da Vinci), rehabilitation, prosthetics
- **Exploration**: Mars rovers, underwater mapping, drones
- **Services**: Vacuum cleaners (Roomba), lawn mowers, tour guides
- **Hazardous**: Nuclear cleanup, bomb disposal, mine clearing

## Integration with AI

Robotics integrates:
- [Search](search.md) & [Planning](planning.md) — Find action sequences
- [Probabilistic-Reasoning](probabilistic-reasoning.md) — Handle uncertainty
- [Machine-Learning](machine-learning.md) — Adapt to new environments
- [Control-Theory](control-theory.md) — Execute smooth, stable actions
- [Perception](perception.md) — Understand world state

## Related Concepts

- [Perception](perception.md) — Extracting information from sensors
- [Planning](planning.md) — Computing action sequences
- [Control-Theory](control-theory.md) — Executing smooth actions
- [Machine-Learning](machine-learning.md) — Learning from experience
- [Reinforcement-Learning](reinforcement-learning.md) — Learning control policies

## References

Russell & Norvig (2010): Chapter 25 - Robotics
