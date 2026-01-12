@prd.json @progress.txt \
READ THE PRD AND PROGRESS FILE \
1. Find the highest-priority task and implement it. \
2. Run your tests and type checks if package.json is present \
3. Update the PRD with what was done. \
4. Append your progress to progress.txt. \
   - Task completed and PRD item reference \
   - Key decisions made and reasoning \
   - Files changed \
   - Any blockers or notes for next iteration \
     Keep entries concise. Sacrifice grammar for the sake of concision. This file helps future iterations skip exploration. \
5. Before committing, run ALL feedback loops: \
   1. TypeScript: npm run typecheck (must pass with no errors) \
   2. Tests: npm run test (must pass) \
   3. Lint: npm run lint (must pass) \
      Do NOT commit if any feedback loop fails. Fix issues first. \
6. Commit your changes. \
   ONLY WORK ON A SINGLE TASK. \
   Keep changes small and focused: \
   - One logical change per commit \
   - If a task feels too large, break it into subtasks \
   - Prefer multiple small commits over one large commit \
   - Run feedback loops after each change, not at the end \
     Quality over speed. Small steps compound into big progress. \
     If the PRD is complete, output <promise>COMPLETE</promise>. \
7. When choosing the next task, prioritize in this order: \
    1. Architectural decisions and core abstractions \
    2. Integration points between modules \
    3. Unknown unknowns and spike work \
    4. Standard features and implementation \
    5. Polish, cleanup, and quick wins \
Fail fast on risky work. Save easy wins for later.
