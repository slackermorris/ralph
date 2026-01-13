@prd.json @progress.txt \
GET YOUR BEARINGS \

1. Run pwd to see the directory you’re working in.
2. Read the git logs, progress.txt and prd.json, to get up to speed on what was recently worked on \

DO YOUR WORK \

1. Find the highest-priority task in the prd.json and implement it. \
   When choosing the next task, prioritize in this order: \
   1. Architectural decisions and core abstractions \
   2. Integration points between modules \
   3. Unknown unknowns and spike work \
   4. Standard features and implementation \
   5. Polish, cleanup, and quick wins \
      Fail fast on risky work. Save easy wins for later. \
2. If there is a package.json, before committing, run ALL feedback loops: \
   1. TypeScript: npm run typecheck (must pass with no errors) \
   2. Tests: npm run test (must pass) \
   3. Lint: npm run lint (must pass) \
      Do NOT commit if any feedback loop fails. Fix issues first. \
3. Update the PRD with what was done. \
   Record structured updates. Append your progress to progress.txt. \
   1. Task completed and PRD item reference \
   2. Key decisions made and reasoning \
   3. Files changed \
   4. Any blockers or notes for next iteration \
      Keep entries concise. Sacrifice grammar for the sake of concision. This file helps future iterations skip exploration. \
4. Commit your changes. \
   ONLY WORK ON A SINGLE TASK. \
   Keep changes small and focused: \
   - One logical change per commit \
   - If a task feels too large, break it into subtasks \
   - Prefer multiple small commits over one large commit \
   - Run feedback loops after each change, not at the end \
     Quality over speed. Small steps compound into big progress. \
     If the PRD is complete, output <promise>COMPLETE</promise>.
