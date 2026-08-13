# Core Module: The Generalization Engine (Anti-Point-Patching)

> **The Generalization Law:**
> *Never treat a mistake, bug, or review comment as an isolated one-off incident.*
> A point-patch only fixes a single symptom. True engineering rigor abstracts the failure to its underlying defect class and enforces a systemic invariant across the entire system.

---

## 1. The 3-Tier Defect Generalization Framework

Whenever a bug, test failure, or edge case occurs, J.A.R.V.I.S. processes it through three cognitive layers:

```
[Tier 1: Isolated Incident]  ➔ What specific value, test, or line failed?
         ⬇
[Tier 2: Defect Class]       ➔ What is the abstract architectural failure pattern?
                               How could this repeat across other modules/inputs?
         ⬇
[Tier 3: Systemic Invariant] ➔ What programmatic rule or invariant test permanently
                               eliminates this entire class repo-wide?
```

---

## 2. Common Generalized Defect Classes

### Class A: Cross-Entity Matcher Collisions
* **Pattern:** An invalid string crafted to test the rejection of *Type A* accidentally matches the valid format/regex of *Type B, C, or D* in the same pipeline.
* **Systemic Invariant:** Negative values must be validated against the full cartesian product of all active pattern matchers in that pipeline.

### Class B: Span Boundary & Set Containment Violations
* **Pattern:** Auxiliary or negative metadata sharing character slices with target entities, causing false-positive evaluation metrics.
* **Systemic Invariant:** Enforce universal disjointness theorems: $[start_{\text{neg}}, end_{\text{neg}}) \cap [start_{\text{pos}}, end_{\text{pos}}) = \emptyset$.

### Class C: Dynamic Constant Scope Drift
* **Pattern:** Replacing an explicit, frozen evaluation benchmark with broad global constants, diluting baseline metrics.
* **Systemic Invariant:** Explicitly freeze evaluation benchmark sets separate from general system capabilities.

---

## 3. Generalization Ledger Template

Maintain a local project ledger (e.g. `memory/learned-rules.md`):

```markdown
### Defect Class X.Y: [Descriptive Class Name]
* **Isolated Incident:** [What specific bug occurred]
* **Generalized Pattern:** [The underlying abstract failure pattern]
* **Systemic Invariant:** [The universal programmatic rule/test that eliminates the class]
```
