# ralph

Ralph is a methodology for AI driven development put forward by Geoffrey Huntley [^4]. It solves the long-running agent problem [^1]: context windows get noisy and overwhelmed, leading to degraded output and failure.

How? It runs your coding agent of choice in a loop. Each iteration gets a fresh context window, eliminating confusion and failure.

The catch: each iteration must know what progress has been made and what insights were gained. Otherwise the agent repeats mistakes. Ralph loads the living context from the previous iterations. Same prompt, but with living documents: a progress.txt ledger and prd.json task list that show how far along it is.

Implementation: Ralph is a bash script that loops over a prompt. The prompt references living documents (prd.json task list and progress.txt) that track activity and learnings.

## The Workflow

1. **Planning Phase**: Run your coding agent in Plan mode. Define requirements, expected behaviour, system constraints, architecture, and what the software solves. Bring the idea to life with a vision and plan [^3].

Opencode has experimental support for a Plan mode.

```
opencode run OPENCODE_EXPERIMENTAL_PLAN_MODE=1
```

2. **Generate PRD**: Use templates/prd.txt to produce a prd.json that captures the breakdown of your plan and serves as a living task tracker.
3. **Execute**: Run AFK-ralph.sh. Ralph works through the feature list in prd.json.

The scripts must be made executable:

```
chmod +x <PATH_TO_SCRIPT>
```

## The Stack

- **AI Coding Agent**: [OpenCode](https://opencode.ai/).
- **Model**: Claude Opus 4.5.

## The Assets

- **prd.json**: Scope definition and progress tracking. A living TODO list produced after planning.
- **progress.txt**: Summaries of model progress. Structured updates that orient the model for the next iteration.
- **AFK-ralph.sh**: This is Ralph. Runs your prompt in a loop.
- **HITL-ralph.sh**: Human In The Loop. Run this to gain confidence before committing to a full loop [^2].
- **/loops/**: Alternate prompts that can replace the main prompt [^2].
- **prompt.md**: Generic prompt with steps for an effective Ralph workflow.
- **AGENTS.md**: Although not necessarily related to Ralph, I thought it worthwhile to link to the AGENTS.md file I use [here](https://gist.github.com/slackermorris/8d26d593284712b1770194291bbc556f).

## Tips For An Effective Workflow

Matt Pocock's resource [^2] dives deeper into these tips. Here are the most important ones.

### 1. Define The Scope

Ralph needs to know what done looks like. Scope is captured in prd.json. Produce it through a plan mode session where you define requirements, constraints, and architecture. Once satisfied, commit your design as PRD items.

Each entry is a chunk. The steps in each chunk should be proposed by the agent, not prescribed by you. Give direction by describing the end state and what you want produced. Good software development means splitting work into manageable, discrete, incremental chunks. prd.json is a working checklist for how to achieve the plan with the right granularity. Each entry is a discrete piece of work: a feature, bug fix, test coverage, instrumentation, or performance work. The steps are the roadmap for how to achieve it.

```json
{
  "category": "functional",
  "description": "New chat button creates a fresh conversation",
  "steps": [
    "Click the 'New Chat' button",
    "Verify a new conversation is created",
    "Check that chat area shows welcome state"
  ],
  "passes": false
}
```

### 2. Use Feedback Loops

Ralph requires verification after each piece of work [^2] [^3]. This is in the prompt:

```txt
If there is a package.json, before committing, run ALL feedback loops: \
  1. TypeScript: npm run typecheck (must pass with no errors) \
  2. Tests: npm run test (must pass) \
  3. Lint: npm run lint (must pass) \
Do NOT commit if any feedback loop fails. Fix issues first. \
```

### 3. Take Small Steps

This ties to Define The Scope. Effective software development depends on problem decomposition. Smaller pieces mean more manageable slices, clearer work, and greater velocity of work completed. As Matt Pocock says, "smaller chunks, mean tighter feedback loops" [^2].

### 4. Prioritisation

Crucial for good software engineering. Tradeoffs should be front and center. Evaluate them and record decisions. Guide Ralph in how it tackles work. Prioritisation matters: why is some work more important than another? This says nothing of detecting dependencies or promoting risk. I want to make this part of the prompt more mature. Right now we just have a pecking order determined by work type.

```txt
When choosing the next task, prioritize in this order: \
  1. Architectural decisions and core abstractions \
  2. Integration points between modules \
  3. Unknown unknowns and spike work \
  4. Standard features and implementation \
  5. Polish, cleanup, and quick wins \
Fail fast on risky work. Save easy wins for later.
```

It categorizes work types well. But as a chronology it fails to consider why some work is picked over others. Tradeoffs: what else was considered? Did we compromise? Have we recorded this for posterity and visibility? Risks: what risks does the work pose? We want to surface risky work early to deal with unknown unknowns. Learnings inform and shape better solutions. Dependencies: is there a chronology to tasks? Is work blocking other work?

## Additional Resources

- [Ralph Wiggum: Autonomous Loops for Claude Code](https://paddo.dev/blog/ralph-wiggum-autonomous-loops/) explains that Claude Code has released a Ralph plugin. Community contributors have built on the pattern made implementations that solve the operational challenges: cost control, state recovery, monitoring. An example is [ralph-orchestrator](https://github.com/mikeyobrien/ralph-orchestrator).

- [Vercel offers a AI Toolkit SDK for TypeScript](https://ai-sdk.dev/). There is an example of it being used [here](https://x.com/ctatedev/status/2007579593960747316).

## Footnotes

[^1]: See [Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents).
[^2]: See [11 Tips For AI Coding With Ralph Wiggum](https://www.aihero.dev/tips-for-ai-coding-with-ralph-wiggum).
[^3]: See [Stop Chatting with AI. Start Loops (Ralph Driven Development)](https://lukeparker.dev/stop-chatting-with-ai-start-loops-ralph-driven-development).
[^4]: See [Ralph Wiggum as a "software engineer"](https://ghuntley.com/ralph/).
