---
title: Meta Llama 4 (Open-Weight)
category: frontier
tags: [llama, meta, open-source, moe, efficiency, multimodal]
sources: ["Meta AI Research", "Llama Community"]
created: 2026-04-08
updated: 2026-04-08
---

# Meta Llama 4 (Open-Weight)

Meta's Llama 4 represents the **open-source AI frontier** as of 2026 — offering competitive capabilities with proprietary models while remaining **freely available** for download, fine-tuning, and on-premises deployment.

---

## Overview

**Release**: Q1 2026 (March 2026)  
**Status**: Active (open-source)  
**Philosophy**: Democratizing frontier AI through open-weight models  
**Architecture**: Mixture-of-Experts (MoE) with early-fusion multimodal  
**License**: Open (non-commercial friendly)  
**Deployment**: Self-hosted, no API required  

---

## Core Innovation: Mixture-of-Experts (MoE)

### What is MoE?

Traditional models activate **all parameters** for every token:
- 405B parameter model = 405B multiplications per token
- Massive computational cost
- Not practical for consumer hardware

**MoE approach**: Use **gating network** to activate only relevant experts:
- 405B total parameters
- **Only 17B active** per forward pass
- 20x reduction in compute per token
- Same intelligence with 1/20th the hardware

### How It Works

```
Input token
   ↓
[Gating Network]
   ↓
Select top-K experts (e.g., 2-4 of 128)
   ↓
Process through selected experts only
   ↓
Route output
```

**Result**: Run 405B model on single H100 GPU (same hardware as training small models)

---

## Two Variants: Scout vs Maverick

### Llama 4 Scout (Budget/Standard)

- **Total Parameters**: 109B
- **Active Parameters**: 17B per forward
- **Context Window**: 400K tokens (~300K words)
- **Experts**: 16 experts (simpler gating)
- **Speed**: Fast inference
- **Memory**: ~40GB GPU memory
- **Cost**: Free (open-source)
- **Deployment**: Single H100 or better

**Use Scout when**:
- You have decent GPU hardware
- 400K context is sufficient
- Cost optimization is key
- Fine-tuning for specific domain
- On-premises/private deployment

### Llama 4 Maverick (Maximum)

- **Total Parameters**: 400B
- **Active Parameters**: 17B per forward
- **Context Window**: 10M tokens (~7.5M words)
- **Experts**: 128 experts (complex gating)
- **Speed**: Reasonable latency despite 10M context
- **Memory**: ~40GB GPU memory
- **Cost**: Free (open-source)
- **Deployment**: Single H100 GPU

**Key achievement**: First production model with 10M token context

**Use Maverick when**:
- Massive context needed (full repositories, long videos)
- You have H100+ GPU
- Processing large documents
- Maximum capability desired
- Enterprise with GPU infrastructure

---

## Architecture: Early-Fusion Multimodal

### Previous Approach (Bolted-On)
1. Train text model
2. Add vision encoder
3. Concatenate vision + text embeddings
4. Fine-tune

**Problem**: Vision treated as add-on, not integrated

### Llama 4 Early-Fusion
1. Start with interleaved text, image, video tokens
2. Train from inception on mixed modalities
3. Native understanding of relationships

**Advantage**: 
- ✅ Better spatial reasoning
- ✅ Deeper cross-modality understanding
- ✅ More efficient training
- ✅ Superior performance on multimodal tasks

---

## Technical Specifications

### Input Modalities

| Modality | Llama 4 Scout | Llama 4 Maverick | Notes |
|----------|---------------|------------------|-------|
| **Text** | ✅ Native | ✅ Native | Full language understanding |
| **Image** | ✅ Full | ✅ Full | Multiple images, spatial reasoning |
| **Video** | ✅ Yes | ✅ Yes | Can ingest video frames |
| **Audio** | ❌ No | ❌ No | Text-focused, not audio-native |

### Context Windows

| Model | Tokens | Approximate | Practical Use |
|-------|--------|-------------|--------------|
| **Scout** | 400K | 300K words | Large documents, small repos |
| **Maverick** | 10M | 7.5M words | Full source trees, long videos, entire books |

### Inference Speed

Scout and Maverick activate **same 17B parameters**, so speed is **identical**:
- ~1-2 tokens/second on H100
- Suitable for real-time applications
- Much faster than GPT-5.4 Thinking or Gemini Thinking

---

## Performance Benchmarks

### Intelligence Index

| Model | Score | Rank | Notes |
|-------|-------|------|-------|
| **Llama 4 Maverick** | 54.2 | #4 | Strong, but behind top 3 |
| **Llama 4 Scout** | 52.8 | #6 | Solid reasoning, still competitive |
| GPT-5.4 Standard | 56.8 | #2 | Proprietary advantage |
| Gemini 3.1 Pro | 57 | #1 | Intelligence leader |

### Code Performance

| Benchmark | Llama 4 | GPT-5.4 | Claude 4.6 |
|-----------|---------|---------|-----------|
| SWE-bench | 48% | 57% | 54% |
| HumanEval | 84% | 91% | 89% |
| Coding quality | Good | Excellent | Excellent |

**Note**: Llama 4 is competitive for general coding, trailing on complex engineering tasks.

---

## Why Open-Source Matters

### Advantages Over Proprietary

| Aspect | Llama 4 | GPT-5.4 | Claude 4.6 |
|--------|---------|---------|-----------|
| **Cost** | $0 | $2.50/M tokens | $3.00/M tokens |
| **Privacy** | ✅ On-prem | ❌ Cloud | ❌ Cloud |
| **Fine-tuning** | ✅ Yes | ❌ Limited | ❌ Limited |
| **Deployment** | ✅ Self-hosted | ❌ API only | ❌ API only |
| **Customization** | ✅ Full | ❌ None | ❌ None |

### Use Cases Enabled by Open-Source

1. **Privacy-critical applications**
   - Healthcare (HIPAA compliance)
   - Legal (attorney-client privilege)
   - Finance (confidential data)
   - Government (security clearance)

2. **Custom fine-tuning**
   - Domain-specific language models
   - Industry jargon and terminology
   - Custom knowledge injection
   - Behavioral adaptation

3. **On-premises deployment**
   - Air-gapped systems
   - No cloud access
   - Latency-critical applications
   - Full control over infrastructure

4. **Cost-sensitive operations**
   - High-volume inference
   - Prototyping and experimentation
   - Real-time applications
   - 24/7 always-on services

---

## Deployment Scenarios

### Single GPU (Developer)
```
Hardware: NVIDIA H100 (80GB)
Deployment: Llama 4 Scout or Maverick
Cost: GPU only, no API fees
Use: Experimentation, prototyping
```

### On-Premises (Enterprise)
```
Hardware: 8x H100 GPUs (distributed)
Deployment: Llama 4 Maverick with sharding
Cost: Infrastructure only
Use: Production systems, proprietary workflows
```

### Hybrid (Cost-Optimized)
```
Strategy: Llama 4 Scout for 90% of queries
          Llama 4 Maverick for complex 10%
Result: 95% of capability at 30% of cost
```

---

## Comparisons

### vs GPT-5.4 Standard
| Aspect | Llama 4 | GPT-5.4 |
|--------|---------|---------|
| Intelligence | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Context | 400K-10M | 128K |
| Cost | $0 | $2.50/M |
| Privacy | ✅ | ❌ |
| Agentic | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Best for** | On-prem, privacy | Automation, coding |

### vs Claude 4.6 Sonnet
| Aspect | Llama 4 | Claude |
|--------|---------|--------|
| Reasoning | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Safety | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Cost | $0 | $3.00/M |
| Fine-tuning | ✅ | ❌ |
| **Best for** | Custom, open-source | Production safety |

### vs Gemini 3.1 Pro
| Aspect | Llama 4 | Gemini |
|--------|---------|--------|
| Context | 10M | 1M |
| Multimodal | ✅ | ✅⭐⭐⭐⭐⭐ |
| Intelligence | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Cost | $0 | $3.50/M |
| **Best for** | Open, cost-free | Reasoning, multimodal |

---

## Getting Started with Llama 4

### Installation (Scout)
```bash
# HuggingFace download
huggingface-cli download meta-llama/Llama-4-Scout --resume-download

# ~45GB download
# Requires HF API token + license acceptance
```

### Inference (vLLM)
```python
from vllm import LLM, SamplingParams

llm = LLM(model="meta-llama/Llama-4-Scout", 
          tensor_parallel_size=1)

prompt = "Write a poem about open-source AI"
output = llm.generate(prompt)
print(output[0].outputs[0].text)
```

### Fine-tuning
```bash
# LoRA fine-tuning (memory efficient)
python fine_tune.py \
  --model meta-llama/Llama-4-Scout \
  --lora_rank 16 \
  --batch_size 32 \
  --epochs 3
```

---

## Performance Characteristics

### Speed (Tokens/Second)

| Hardware | Scout | Maverick | Notes |
|----------|-------|----------|-------|
| Single H100 | 1-2 tok/s | 1-2 tok/s | Same active params |
| 8x H100 | 8-16 tok/s | 8-16 tok/s | Linear scaling |

### Memory Usage

| Model | 80GB H100 | Quantized (4-bit) |
|-------|-----------|------------------|
| **Scout** | ✅ Fits easily | ✅ ~15GB |
| **Maverick** | ✅ Fits with room | ✅ ~40GB |

---

## When to Choose Llama 4

### ✅ Use Llama 4 When:
- Cost is primary concern (free vs API fees)
- Privacy/on-premises required
- Custom fine-tuning needed
- GPU infrastructure available
- 400K+ context useful
- Want open-source guarantees

### ❌ Don't Use Llama 4 When:
- Need #1 intelligence ranking (use Gemini)
- Desktop automation required (use GPT-5.4)
- Maximum safety critical (use Claude)
- No GPU hardware available
- Want commercial support
- Need guaranteed uptime/SLA

---

## The Open-Source Revolution

Llama 4 represents a **fundamental shift** in 2026:

- **Proprietary dominance broken**: Open models competitive with APIs
- **Access democratized**: Anyone with GPU can run frontier-class AI
- **Cost equation changed**: $0 vs millions in API fees
- **Custom capabilities**: Fine-tune for your domain
- **Privacy achievable**: Keep data on-premises

**This changes the game** for:
- Startups (no API costs)
- Enterprises (data control)
- Researchers (reproducibility)
- Developing nations (free access)

---

## Summary Table

| Aspect | Scout | Maverick |
|--------|-------|----------|
| **Parameters** | 109B | 400B |
| **Active** | 17B | 17B |
| **Context** | 400K | 10M |
| **Speed** | 1-2 tok/s | 1-2 tok/s |
| **Memory** | ~40GB | ~40GB |
| **Cost** | Free | Free |
| **Best for** | Standard tasks | Massive context |

---

## Last Updated
April 8, 2026

## Related
- [Model Comparison](model-comparison.md)
- [Release Timeline](timeline.md)
- [GPT-5.4](gpt-5-4.md)
- [Gemini 3.1 Pro](gemini-3-1.md)
