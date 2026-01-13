# ralph

These are all the necessary assets for an effective Ralph workflow.

FINISH TIPS FOR EFFECTIVE WORKFLOW
FINISH THE WORKFLOW
FINISH THE ASSETS

## What is Ralph?

Ralph is best described as a methodology of AI driven development. It attempts to tackle the long-running agent problem [^1], whereby an agents context window quickly becomes noisy and overwhelmed, which leads to degraded output and overall success of the agent.

How does it achieve this?

Simple. It runs the AI coding CLI and whatever prompt you provide it in a loop. Each iteration offers a new context window, thereby eliminating the potential for confusion and failure. Of course, it is a little more nuanced than this. For this technique to be successful the agent, with each iteration, must be made aware of what progress has been made against the overall objective and what insights have been gained during the process, such that it does not repeat mistakes and get caught in a bind. The power of Ralph is that each new iteration loads the living context of the iteration before it. It starts with the same prompt, but has living documents, a progress.txt and prd.json task list that contextualises how far along it is.

At an implementation level, Ralph is a bash script that loops over a prompt. The prompt references living documents, a prd.json task list and a progress.txt file which keeps a ledger of activity and anything interesting the agent discovers, or "learns", during the process.

## The Workflow

This is how I approach using Ralph.

1. **The Planning Phase**: Run your coding agent of choice in a Plan mode. Discuss your requirements, the expected behaviour, some constraints of your system design or architecture, the shape of the software, what it is solving as a product, here you are bringing to life an idea but you are bringing it to life with a vision, a plan [^3].
2. **Generate a Product Requirement Document (PRD)**: Use the prompt in templates/prd.txt to produce a prd.json that the coding agent can use as a living task tracker.
3. **Execute the \*-ralph.sh Script**: The real magic happens in the AFK-ralph.sh script. Execute it and watch Ralph work through the feature list in the prd.json.

## The Stack

- **AI Coding Agent**: [OpenCode](https://opencode.ai/).
- **Model**: Claude Opus 4.5.

## The Assets

- **prd.json**: This captures bot scope definition and progress tracking. It is a living TODO list. It is the artefact produced after the planning phase has been completed. The agent is instructed to read the plan.md and use the template/prd.txt to produce it.
- **progress.txt**: Captures summaries of the models progress. Entries are structured updates that are used by the model to orient properly orient itself for the next iteration and new context window.
- **AFK-ralph.sh**: This IS Ralph. Run your prompt in a loop.
- **HITL-ralph.sh**: Human In The Loop (HITL). This is a precautionary implementation helpful in gaining confidence in the technique before committing to a loop [^2].
- **/loops/**: These are alternate prompts. They can be executed in place of the main prompt [^2].
- **prompt.md**: A generic prompt that captures the steps necessary for an effective Ralph workflow.

## Tips For An Effective Workflow

Matt Pocock has an incredible resource that gives a deeper dive into the what and why for of recommended tips [^2]. I thought I would pick a few and elevate them as they seemed the most important to me.

### 1. Define The Scope

It is crucial that Ralph knows what "what done looks like". Scope is captured in the `prd.json`. The `prd.json` is produced through a plan mode session with the agent where you define your requirements, constraints, overall software architecture. Once you are satisfied that no stone has been left unturned, you commit your design as a series or PRD items.

Each entry is a chunk. Note, the steps captured in the chunk are not prescribed and instead should be proposed by the agent itself. Any direction from you should be in the form of describing an end state. At a high level, what do you want to be produced. This is an expression or is consistent with good software development practices of splitting the work up into manageable, discrete, incremental chunks that in their aggregate describe a problem decomposed. This is the intention of the `prd.json`, to essentially put together a working checklist for how a plan can be achieve with the right level of granularity. Each entry corresponds to a discrete piece of work, it could be a new feature, a bug fix, improved test coverage, or instrumentation, performance work, and the steps that comprise it are the roadmap for how the net task can be achieved.

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

For Ralph to be successful, it is essential to emphasise that verification steps be taken after each discrete piece of work is completed [^2] [^3]. This is reflected in the prompt:

```txt
If there is a package.json, before committing, run ALL feedback loops: \
  1. TypeScript: npm run typecheck (must pass with no errors) \
  2. Tests: npm run test (must pass) \
  3. Lint: npm run lint (must pass) \
Do NOT commit if any feedback loop fails. Fix issues first. \
```

### 3. Take Small Steps

This relates a lot to Define The Scope. Effective software development is tied to how well a problem can be decomposed. The smaller the composing pieces, the more manageable each slice is, the clearer the work that is delivered, the greater the velocity of work done. As Matt Pocock says, "smaller chunks, mean tighter feedback loops" [^2].

### 4. Prioritisation

Again, this is another crucial act or attitude or behaviour or fact of good software engineering. Tradeoffs should be front-and-center. They should be evaluated and have their endorsement or selection against recorded. So too is it important to guide Ralph in how it tackles the work-to-be-done. This is reflected in the prompt. Prioritisation is incredibly important: why is some work more important than another. This says nothing of detecting dependencies or promoting risk. Personally I would like to make this part of the prompt or configured behaviour a bit more mature because as it stands we just have a pecking order for how work should be tackled and it is determined by the type of work, the flavour of work.

```txt
When choosing the next task, prioritize in this order: \
  1. Architectural decisions and core abstractions \
  2. Integration points between modules \
  3. Unknown unknowns and spike work \
  4. Standard features and implementation \
  5. Polish, cleanup, and quick wins \
Fail fast on risky work. Save easy wins for later.
```

It does well to categorise the type of work expected. But as a chronology is fails to deeply consider the more consequential aspects of why some work is picked over other and why some work comes to be considered while other is not. Like, tradeoffs: what else was considered beyond the solution as it was proposed, did we have to make any compromises, have we recorded this anywhere for posterity and sharing the knowledge and creating visibility. And then risks, what are some risks that we think the work poses: this is the sort of work that we want to bring forward so we can deal with the unknown unknowns and the learnings can inform us and allow us to better shape up our solution with the understanding we have gained. And then dependencies. Is there a chronology to the tasks that need to be done. Is some work blocking other work?

## Footnotes

[^1]: See [Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents).
[^2]: See [11 Tips For AI Coding With Ralph Wiggum](https://www.aihero.dev/tips-for-ai-coding-with-ralph-wiggum).
[^3]: See [Stop Chatting with AI. Start Loops (Ralph Driven Development)](https://lukeparker.dev/stop-chatting-with-ai-start-loops-ralph-driven-development).
