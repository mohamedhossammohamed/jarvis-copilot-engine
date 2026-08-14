# Core Module: Out-of-Band Deep Research Protocol (Quota & Reasoning Shield)

## Purpose
In complex software architecture, running in-IDE subagents for heavy research exhausts the coding agent's session tokens and quota. 

This module defines J.A.R.V.I.S.'s **Out-of-Band Research Synthesis Protocol**: gathering deep repository AST context, symbol signatures, call graphs, and architectural tension forks into an ultra-dense prompt for external reasoning models (e.g. Gemini 1.5 Pro / Deep Research, Claude Opus, or ChatGPT o3).

---

## 1. The Context Aggregation Sweep

When an architectural tension or algorithmic decision is identified:
1. **Silent Codebase Harvest:**
   - Extract relevant type signatures, interfaces, and function headers.
   - Trace callers and downstream consumers across the repository.
   - Note repository invariants (memory limits, latency budgets, licensing).
2. **Tension Isolation:**
   - Formulate the exact architectural forks (Option A vs Option B) and the mathematical/systemic trade-offs.

---

## 2. Universal Deep Research Prompt Template

J.A.R.V.I.S. compiles the context into this structured payload for the Lead Engineer:

```markdown
# MISSION: Principal Systems Architect & Deep Engineering Debrief

## 1. Workspace Context & Technical Environment
- **Target Stack:** {DETECTED_STACK_AND_CONSTRAINTS}
- **Architectural Rules:** {PROJECT_INVARIANTS}

## 2. Problem Statement & Acceptance Criteria
<SPECIFICATION>
{RAW_ISSUE_OR_TICKET_TEXT}
</SPECIFICATION>

## 3. Live AST Telemetry & Existing Patterns
```{language}
{EXTRACTED_CODE_SLICES_AND_TYPES}
```

## 4. Architectural Forks & Tension Telemetry
1. **Fork 1 (Algorithmic / Data Structure Decision):**
   - Option A: {OPTION_A}
   - Option B: {OPTION_B}
   - Tension: {TRADE_OFF_CONCERNS}

2. **Fork 2 (Edge Case & Failure Mode Invariants):**
   - Question: {HOW_TO_ELIMINATE_FAILURE_CLASS}

## 5. Required Deep Research Deliverables
1. Definitive technical decision on the forks with mathematical/asymptotic justification.
2. Concrete, production-grade algorithm / pseudocode with complexity bounds.
3. Systemic invariants to permanently eliminate the defect class across the entire repository.
4. Minimalist diff strategy to achieve the result with zero speculative bloat.
```

---

## 3. Ingestion & Plan Synthesis

When the Lead Engineer pastes the external debrief back into the workspace:
1. J.A.R.V.I.S. verifies the proposed architecture against local repository invariants and type contracts.
2. Formulates the finalized, minimal implementation plan without requiring further prompt gymnastics.
