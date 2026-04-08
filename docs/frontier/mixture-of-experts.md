---
title: Mixture-of-Experts (MoE) Architecture
category: frontier
tags: [moe, efficiency, routing, sparse, llama-4]
sources: ["Meta AI Research", "LLM Architecture Research"]
created: 2026-04-08
updated: 2026-04-08
---

# Mixture-of-Experts (MoE) Architecture

Mixture-of-Experts represents the **efficiency breakthrough** of 2026, enabling models to achieve frontier performance while reducing compute requirements by 20x. Llama 4 is built on this architecture.

---

## The Core Problem MoE Solves

### Traditional Dense Models
```
Input token → Process through ALL parameters → Output
```

- 405B parameter model = 405B multiplications per token
- Requires massive GPUs (8x H100 minimum)
- Extremely expensive to run
- All parameters activate for every token (wasteful)

**Problem**: Need frontier-class performance with manageable hardware

### MoE Solution
```
Input token → Gating Network → Select 2-4 relevant experts
              ↓         ↓
         Expert 1   Expert 3
              ↓         ↓
             Combine outputs
              ↓
           Output token
```

- Only relevant experts activate (~17B of 400B)
- 20x reduction in compute per token
- Same parameter count (frontier class)
- Runs on single H100 GPU

---

## How MoE Works

### The Gating Network

**Purpose**: Route tokens to appropriate experts

```
Input embedding
    ↓
[Dense Layer] → [Softmax]
    ↓
Probabilities for each expert
    ↓
Select top-K experts (e.g., K=2 or K=4)
```

**Example routing decision:**
```
Token: "neural"
    ↓
Gating scores:
  Expert 0 (language): 0.8 ← HIGH
  Expert 1 (math): 0.1
  Expert 2 (code): 0.05
  Expert 3 (vision): 0.05
    ↓
Route to: Expert 0 (language)
```

### Expert Specialization

MoE naturally specializes experts:

| Expert | Specialization | Handles |
|--------|----------------|---------|
| **0** | General language | Common text, prose |
| **1** | Mathematical | Equations, symbolic reasoning |
| **2** | Code | Programming languages, syntax |
| **3** | Vision | Spatial descriptions, images |
| **4** | Logic | Boolean operations, constraints |
| ... | ... | ... |

**Key insight**: Experts learn domains automatically through training

### Load Balancing

**Challenge**: Some experts get overused, others unused

**Solution**: Load balancing loss during training
- Penalizes uneven token routing
- Encourages even expert usage
- Prevents collapse to single expert
- Improves training efficiency

---

## Llama 4 Architecture Details

### Scout Configuration

```
Total Parameters: 109B
Architecture: 16 experts
Active per token: 2 experts
Active capacity: 17B parameters per forward pass

Scaling: 109B ÷ 16 experts = 6.8B per expert
Sparse activation: (2 ÷ 16) = 12.5% of experts active
```

**Result**: 109B model runs as ~17B dense model

### Maverick Configuration

```
Total Parameters: 400B
Architecture: 128 experts
Active per token: 2 experts
Active capacity: 17B parameters per forward pass

Scaling: 400B ÷ 128 experts = 3.1B per expert
Sparse activation: (2 ÷ 128) = 1.6% of experts active
```

**Result**: 400B model also runs as ~17B dense model (same hardware!)

---

## Performance Characteristics

### Compute Efficiency

| Metric | Dense | MoE Scout | MoE Maverick |
|--------|-------|-----------|-------------|
| **Parameters** | 109B | 109B | 400B |
| **Active params** | 109B | 17B | 17B |
| **Efficiency** | 1x | 6.4x | 23.5x |
| **GPU memory** | 45GB | 40GB | 40GB |
| **Tokens/sec (H100)** | 0.15 | 1-2 | 1-2 |

**Key insight**: Same active computation (17B), so same speed

### Context Window Tradeoff

| Model | Parameters | Context | Efficiency | Use Case |
|-------|-----------|---------|-----------|----------|
| **Scout** | 109B | 400K | Good | Standard tasks |
| **Maverick** | 400B | 10M | Excellent | Long context |

**Paradox**: Bigger Maverick is more efficient (more experts for same active capacity)

---

## Benchmarks

### Intelligence Comparison

| Model | Architecture | Score | Rank |
|-------|--------------|-------|------|
| **Llama 4 Scout** | MoE (16 experts) | 52.8 | #6 |
| **Llama 4 Maverick** | MoE (128 experts) | 54.2 | #4 |
| **Dense equiv.** | 109B dense | ~50 | #8 |

**Finding**: MoE achieves better performance than dense models of equivalent size

### Cost-Performance

| Model | Cost | Performance | Ratio |
|-------|------|-------------|-------|
| **MoE Maverick** | $0 (free) | #4 intelligence | Best |
| **GPT-5.4 Standard** | $2.50/M | #2 intelligence | Good |
| **Dense 400B** | ~$50K/month inference | #4 intelligence | Poor |

**Insight**: MoE fundamentally changes cost-performance equation

---

## Advantages of MoE

### 1. Efficiency
- ✅ 20x compute reduction
- ✅ Runs on single GPU
- ✅ Lower energy consumption
- ✅ Faster inference speed

### 2. Scalability
- ✅ Can add more experts without increasing compute
- ✅ Maverick (400B) = Scout (109B) latency
- ✅ Enables frontier capabilities on modest hardware

### 3. Specialization
- ✅ Experts learn domains automatically
- ✅ Better task-specific performance
- ✅ Natural modularity
- ✅ Potential for transfer learning

### 4. Cost
- ✅ Llama 4 is free (open-source)
- ✅ Massive cost savings vs API models
- ✅ On-premises deployment (no cloud fees)
- ✅ High-volume inference becomes viable

---

## Disadvantages of MoE

### 1. Complexity
- ❌ Gating network adds parameters
- ❌ Load balancing loss complicates training
- ❌ Harder to debug than dense models
- ❌ Requires careful hyperparameter tuning

### 2. Training
- ❌ More difficult to train (expert imbalance)
- ❌ Longer training time
- ❌ Requires more data for stabilization
- ❌ Needs sophisticated load balancing

### 3. Fine-tuning
- ❌ LoRA/adapter methods less effective
- ❌ Full fine-tuning expensive
- ❌ Expert specialization may resist adaptation
- ❌ Risk of expert collapse during fine-tune

### 4. Inference Variability
- ❌ Latency varies by token (different expert routing)
- ❌ Load balancing can cause stalls
- ❌ Not ideal for real-time applications
- ❌ Prediction: some tokens slower

---

## MoE vs Dense: When to Use Each

### Use MoE When:
- ✅ Cost is critical (Llama 4 is free)
- ✅ On-premises deployment required
- ✅ High-volume inference
- ✅ Long context important (Scout/Maverick differ)
- ✅ GPU hardware available
- ✅ Privacy sensitive (on-device)

**Best scenario**: Startup with $0 API budget, 1 GPU

### Use Dense When:
- ✅ Simplicity over efficiency
- ✅ Fine-tuning critical
- ✅ Real-time strict latency required
- ✅ Few, sporadic queries
- ✅ Don't have GPU hardware
- ✅ Want managed service (APIs)

**Best scenario**: Enterprise relying on GPT-5.4 API

---

## Architecture Comparison

### Dense Model
```
Input → [Layer 1] → [Layer 2] → ... → [Layer N] → Output
        109B params  109B params     109B params
        (always active)
```

### MoE Model
```
Input → [Layer 1] → [Gate] → [2 of 16 experts] → [Layer 2]
        109B params    ↓      route to relevant
                        ↓
                    Expert 0: 6.8B ← ACTIVE
                    Expert 3: 6.8B ← ACTIVE
                    Expert 7: 6.8B (inactive)
                    Expert 12: 6.8B (inactive)
```

**Result**: Same layer size, but sparse activation

---

## Load Balancing

### The Problem

```
Early training:
  Expert 0: 50% of tokens ← OVERUSED
  Expert 1: 1% of tokens ← UNUSED
  Expert 2: 1% of tokens ← UNUSED
  ...
```

**Result**: Model collapses to using one expert (defeats purpose)

### The Solution: Load Balancing Loss

```python
# During training, add auxiliary loss:
auxiliary_loss = (expert_usage_rate - target_rate)²

# Forces:
#   All experts used equally
#   No collapse to single expert
#   Even compute distribution
```

**Effect**:
```
After load balancing:
  Expert 0: 6.5% of tokens
  Expert 1: 6.2% of tokens
  Expert 2: 6.7% of tokens
  ... (all ~6.25%)
```

---

## Fine-Tuning MoE

### Challenge
MoE experts are interdependent. Fine-tuning breaks specialization.

### Solution 1: LoRA on Selected Experts
```python
# Fine-tune only "active" experts for your domain
lora_modules = ["expert_0", "expert_3"]  # Task-relevant
# Freeze other experts
```

**Pro**: Cheaper, faster  
**Con**: Limited adaptation

### Solution 2: Full Fine-Tune
```python
# Fine-tune all parameters
# Requires: More data, more compute, careful monitoring
```

**Pro**: Full adaptation  
**Con**: Expensive, risk of expert collapse

### Solution 3: Expert Surgery
```python
# Replace or add experts for new domain
# Most elegant but requires expert-level ML knowledge
```

---

## The Future of MoE

### 2026 Q2-Q3 Predictions
- Conditional computation (only activate experts when needed)
- Hybrid dense-MoE (dense layers + MoE layers)
- Domain-specific expert banks (swap experts for tasks)
- Streaming experts (experts as specialized services)

### Longer-term (2027+)
- Mixture-of-Mixtures (MoE of MoE)
- Dynamic expert allocation (create experts on-demand)
- Cross-model expert sharing
- Specialized expert markets (buy/sell trained experts)

---

## Comparison Table

| Aspect | Dense | MoE | Winner |
|--------|-------|-----|--------|
| **Speed** | Fast | Fast | Tie |
| **Cost** | High | Free (Llama 4) | MoE |
| **Complexity** | Simple | Complex | Dense |
| **Efficiency** | 1x | 20x | MoE |
| **Fine-tune** | Easy | Hard | Dense |
| **Specialization** | No | Yes | MoE |
| **On-premises** | Expensive | Free | MoE |

---

## Summary

MoE is the **efficiency breakthrough** that makes frontier AI accessible:

- **Same performance** (Llama 4 Scout competitive with proprietary models)
- **20x efficiency** (17B active vs 109B or 400B total)
- **Free deployment** (open-source, no API costs)
- **Private** (on-premises, full data control)

**Impact**: Democratizes frontier AI for organizations with GPU hardware.

---

## Last Updated
April 8, 2026

## Related
- [Thinking Models](thinking-models.md)
- [Multimodal Fusion](multimodal-fusion.md)
- [Llama 4 (Open-Weight)](llama-4.md)
- [Model Comparison](model-comparison.md)
