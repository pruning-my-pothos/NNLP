---
title: "Quick Evaluation of Retrieval Quality"
archetype: "code-snippet"
status: "active"
owner: "NNLP"
maintainer: "NNLP"
version: "1.0.0"
tags: ["rag", "evaluation", "retrieval", "metrics"]
last_reviewed: "2025-12-31"
---

# Quick Evaluation of Retrieval Quality

In a Retrieval-Augmented Generation (RAG) system, the quality of the retrieved documents directly impacts the LLM's ability to provide accurate and grounded answers. Before diving into complex evaluation frameworks, it's essential to have quick, practical methods to assess if your retrieval component is working as intended.

:::info[The Goal: Relevant Context]
The objective is to ensure your retriever consistently provides the most relevant document chunks to the LLM for a given query, minimizing the chances of hallucination or incorrect answers due to poor context.
:::

---

## The Problem: "Garbage In, Garbage Out"

If your retriever consistently pulls irrelevant or insufficient information, even the best LLM will struggle to provide a good answer. Early and frequent evaluation of retrieval quality is paramount.

---

## 1. Manual Inspection (Top-K Review)

Keep it simple: run a tiny in-memory example and eyeball the ranked chunks.

```python
# pip install scikit-learn
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

docs = [
    ("doc1", "The sky is blue because molecules scatter sunlight."),
    ("doc2", "Plants make food through photosynthesis using sunlight."),
    ("doc3", "HTTP GET retrieves data; POST sends data to the server.")
]

corpus = [text for _, text in docs]
ids = [doc_id for doc_id, _ in docs]

vectorizer = TfidfVectorizer()
doc_vecs = vectorizer.fit_transform(corpus)

def top_k(query: str, k: int = 2):
    q_vec = vectorizer.transform([query])
    scores = cosine_similarity(q_vec, doc_vecs).flatten()
    order = np.argsort(-scores)[:k]
    return [(ids[i], corpus[i], scores[i]) for i in order]

for q in ["why is the sky blue", "how do plants make food", "what is http get"]:
    print(f"\nQuery: {q}")
    for rank, (doc_id, text, score) in enumerate(top_k(q, k=2), start=1):
        print(f"  {rank}. {doc_id} (score={score:.2f}) -> {text[:80]}...")
```

:::tip[What to Look For During Inspection]
-   **Direct Answerability**: Does the chunk directly help answer the query?
-   **Completeness**: Is the chunk complete enough on its own?
-   **Irrelevance**: Does the chunk contain a lot of unrelated information?
-   **Redundancy**: Are multiple chunks saying the same thing (consider [Deduplication](./../06-context-hygiene/dedupe-and-near-duplicate-scan.md))?
:::

---

## 2. Simple Hit-Rate Check

For a predefined set of (query, expected_relevant_document_ID) pairs, you can calculate a simple "hit rate" to see how often your system retrieves at least one of the truly relevant documents within the top `K` results.

### How to Do It
1.  Create a small "ground truth" dataset: a list of queries, and for each query, the ID(s) of the document(s) that are *authoritatively relevant*.
2.  Run your retrieval system for each query.
3.  Check if any of the expected relevant document IDs are present in the retrieved top `K` results.

### Python Example: Hit Rate Calculation (in-memory)

```python
from typing import List, Tuple

test_set: List[Tuple[str, List[str]]] = [
    ("why is the sky blue", ["doc1"]),
    ("how do plants make food", ["doc2"]),
    ("http methods", ["doc3"]),
]

def hit_rate(test_set, k=2):
    hits = 0
    for q, expected in test_set:
        retrieved_ids = [doc_id for doc_id, _, _ in top_k(q, k)]
        if any(e in retrieved_ids for e in expected):
            hits += 1
    rate = hits / len(test_set)
    print(f"Hit rate @{k}: {rate:.2f} ({hits}/{len(test_set)})")
    return rate

if __name__ == "__main__":
    hit_rate(test_set, k=2)
```

---

:::warning[Limitations of Quick Evaluation]
These methods are great for quick sanity checks but do not replace thorough evaluation.
-   **Subjectivity**: Manual inspection is subjective and not scalable.
-   **Incompleteness**: Hit rate only tells you if *any* relevant document was found, not if *all* were, or if irrelevant ones were also highly ranked.

For production, consider using automated evaluation metrics for RAG (e.g., Precision, Recall, NDCG, Context Relevancy, Faithfulness).
:::
