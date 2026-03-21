# GEMINI.md

## Project Overview
**aiframeos** is a nascent project intended to explore the development of an AI-centric framework or operating system (AIOS). The goal is to create a "kernel" that manages Large Language Model (LLM) resources, agent scheduling, and tool integrations, similar to a traditional OS but optimized for AI agents.

### Core Concepts (To Be Implemented)
- **LLM Kernel:** A central manager for LLM requests, providing resource allocation and context management for multiple agents.
- **Agent Scheduling:** Implementing mechanisms to handle multi-agent task execution and priority.
- **Memory & Storage:** Structured systems for long-term and short-term agent memory.
- **Tool Access:** Standardized interfaces for agents to interact with the host system and external APIs.

## Building and Running
As the project is currently in its initial setup phase, no build or run commands are yet defined. 

### Initial Setup Recommendations
1.  **Project Structure:** Define the core directories (e.g., `src/kernel`, `src/agents`, `src/tools`).
2.  **Environment:** Set up a Python (using `pyproject.toml` or `requirements.txt`) or Node.js (using `package.json`) environment.
3.  **LLM Integration:** Choose an initial LLM backend (e.g., OpenAI API, local llama.cpp, or vLLM).

- **TODO:** Define build system and execution commands in this section once the foundation is laid.

## Development Conventions
To ensure a robust and maintainable AIOS, follow these conventions:
- **Modular Design:** Keep the kernel logic strictly separated from agent implementations and tool definitions.
- **Typed Interfaces:** Use strict typing (e.g., TypeScript or Python type hints) for all core interfaces to manage complex LLM data structures.
- **Async Execution:** Prioritize asynchronous patterns for LLM calls and tool interactions to ensure the "OS" remains responsive.
- **Comprehensive Logging:** Implement detailed logging of agent-kernel interactions for debugging and observability.
- **Testing Strategy:** 
    - **Unit Tests:** For individual kernel components and tools.
    - **Integration Tests:** For agent-kernel interaction flows.
    - **Benchmark Tests:** To measure latency and resource overhead of the AIOS kernel.

## Architectural Principles (AI Architect Skills)
This project adheres to high-level architectural standards inspired by the `antigravity-awesome-skills` library:

### Core Competencies
- **System Design & Patterns:** Utilize C4 models and Architecture Decision Records (ADRs) to document and visualize the system. Implement Domain-Driven Design (DDD) for core kernel domains.
- **LLM Application Patterns:** Mastery of advanced patterns such as RAG (Retrieval-Augmented Generation), LangGraph for complex agentic workflows, and persistent context management.
- **API & Integration:** Prioritize robust API design principles and seamless integration with external tools and services through the Model Context Protocol (MCP) or similar standards.

### Responsibilities
- **Scalable Orchestration:** Design the kernel to handle multi-agent orchestration with a focus on observability and performance optimization.
- **Security & Compliance:** Conduct regular security audits of LLM interactions and tool access to ensure safe agentic operations.
- **Infrastructure Automation:** Automate the deployment and scaling of AIOS components across cloud-native environments (K8s, Serverless, etc.).

## Getting Started
1. Initialize the workspace with a preferred build tool.
2. Draft the initial kernel architecture and define the first `Agent` and `Tool` interfaces.
3. Create a basic proof-of-concept (PoC) showing an agent executing a simple task through the kernel.
4. Update this file as the project matures.
