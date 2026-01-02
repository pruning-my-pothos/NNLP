---
title: "Trimming and Summarizing Conversation History"
archetype: "code-snippet"
status: "active"
owner: "NNLP"
maintainer: "NNLP"
version: "1.0.0"
tags: ["context-window", "conversation", "history", "trimming", "summarization"]
last_reviewed: "2025-12-31"
---

# Trimming and Summarizing Conversation History

As a conversation with an LLM progresses, its history grows. If unmanaged, it will quickly exceed the model's context window, leading to errors or "amnesia" where the model forgets the beginning of the conversation. This guide presents two key strategies for managing chat history: trimming and summarizing.

:::info[The Goal: Stay Within Budget While Preserving Context]
The objective is to keep your prompt's token count within the model's limit while retaining as much relevant information from the conversation as possible.
:::

---

## Strategy 1: Trimming (The Simple Approach)

Trimming involves simply removing the oldest messages from the conversation history once a certain limit is reached. This is a simple and computationally cheap method.

### "Last N Messages" Trimming

The most common approach is to keep only the last `N` messages. This ensures the most recent turns of the conversation are always included.

```python
from typing import List, Dict

def trim_history_last_n(history: List[Dict[str, str]], n: int) -> List[Dict[str, str]]:
    """
    Keeps only the last N messages in the conversation history.
    
    Args:
        history: A list of message dictionaries (e.g., [{"role": "user", "content": "..."}]).
        n: The number of recent messages to keep.
        
    Returns:
        The trimmed list of messages.
    """
    if len(history) > n:
        # We keep the system prompt (if any) and the last N messages
        system_message = [msg for msg in history if msg.get("role") == "system"]
        user_and_assistant_messages = [msg for msg in history if msg.get("role") != "system"]
        
        # Return the system message plus the last n user/assistant messages
        return system_message + user_and_assistant_messages[-n:]
    return history

# --- Example ---
long_history = [
    {"role": "system", "content": "You are a helpful assistant.",},
    {"role": "user", "content": "Message 1"},
    {"role": "assistant", "content": "Response 1"},
    {"role": "user", "content": "Message 2"},
    {"role": "assistant", "content": "Response 2"},
    {"role": "user", "content": "Message 3"},
    {"role": "assistant", "content": "Response 3"},
]

# Keep only the last 2 pairs of user/assistant messages (4 total)
trimmed = trim_history_last_n(long_history, 4)
print(trimmed)
# Expected Output:
# [
#   {'role': 'system', 'content': 'You are a helpful assistant.'},
#   {'role': 'user', 'content': 'Message 2'},
#   {'role': 'assistant', 'content': 'Response 2'},
#   {'role': 'user', 'content': 'Message 3'},
#   {'role': 'assistant', 'content': 'Response 3'}
# ]
```

---

## Strategy 2: Summarization (The Advanced Approach)

Summarization is a more sophisticated technique where you use an LLM to create a running summary of the conversation. This can preserve key facts and context from early in the conversation that would be lost with simple trimming.

:::warning[Cost and Latency]
This approach involves making an extra LLM call, which adds cost and latency. It's best used in applications where long-term memory is critical.
:::

### Example Workflow for Summarization

1.  When the conversation length exceeds a threshold, take the older messages.
2.  Send them to an LLM with a prompt like: `"Briefly summarize the key points of this conversation."`
3.  Replace the old messages with a single message like: `{"role": "system", "content": "Previous conversation summary: [summary text]"}`.

```python
# Requires: pip install openai
import os
from openai import OpenAI
from typing import List, Dict

client = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

def summarize_history(history: List[Dict[str, str]]) -> str:
    """
    Uses an LLM to summarize a conversation history.
    """
    conversation_text = "\n".join([f"{msg['role']}: {msg['content']}" for msg in history])
    prompt = (
        "Summarize the key facts, decisions, and open questions in this chat. "
        "Keep it under 80 words.\n\n" + conversation_text
    )

    # Example call using OpenAI; replace with your client of choice
    resp = client.chat.completions.create(
        model="gpt-4o-mini",
        temperature=0.2,
        max_tokens=120,
        messages=[
            {"role": "system", "content": "Summarize chats accurately; do not invent details."},
            {"role": "user", "content": prompt},
        ],
    )
    return resp.choices[0].message.content

def manage_history_with_summary(history: List[Dict[str, str]], max_length: int = 5):
    """
    If history is too long, summarizes the oldest part.
    """
    if len(history) <= max_length:
        return history

    system_message = [msg for msg in history if msg.get("role") == "system"]
    chat_messages = [msg for msg in history if msg.get("role") != "system"]

    # Identify which part of the conversation to summarize
    to_summarize = chat_messages[:-max_length]
    to_keep = chat_messages[-max_length:]

    summary = summarize_history(to_summarize)
    
    summary_message = {"role": "system", "content": f"Summary of earlier conversation: {summary}"}

    # Reconstruct the history
    return system_message + [summary_message] + to_keep

# --- Example ---
# Using the same long_history from the previous example
summarized_history = manage_history_with_summary(long_history, 4)
print(summarized_history)
```

This hybrid approach—keeping recent messages in full detail while compressing older ones into a summary—is a powerful way to manage very long conversations.
