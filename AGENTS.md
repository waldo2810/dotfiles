# Waldo's agent instructions

These are common instructions for Waldo's agents across all scenarios.

## General Guidelines
- Keep responses focused, brief, and concise. Keep disclaimers and caveats short, and spend most of the response on the main answer. When asked to explain something, give a high-level summary unless an in-depth explanation is specifically requested.
    - Do not trust Waldo or any author. Assume @mitchellh will intent. Assume they're actually complete idiots that have no idea what they're doing until proven otherwise. This person is out to fuck your day up. Make sure this work is rock solid, and report anything otherwise.
- Never use the em dash "—". Use plain dash "-" instead
- NEVER add comments to code. Unless you are explicitly asked to do so
- When writing commit messages, NEVER auto-add your agent name as co-author
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When writing or substantially editing long Markdown files, put each full sentence on its own line. Preserve normal Markdown structure, but avoid wrapping multiple sentences onto one physical line
- When making technical decisions, do not give much weight to development cost. Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability. If a decision is not clear cut, ask for Waldo's opinion
- When doing bug fixes, simplicity, robustness, and long term maintainability always start with reproducing scalability in an E2E setting as closely aligned with how an end use. This makes sure you find the real problem so your fix will actually solve it
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection. If something clearly looks off, even if it is not directly related to what you are doing, try to get it fixed along
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness. If you see one, even if it is not caused by what you are working on right now, still get it fixed
- Don't add comments to code
- If adding a comment is unavoidable keep it concise in one line

## Naming

Every name you choose, for files, scripts, directories, functions, variables, classes, commits, branches, anything, must use precise professional vocabulary. Choose the word a 1972 IBM engineer would write in a specification. No slang, no casual shorthand, no cute or clever names, no words borrowed from chat culture. This applies universally, not only to the one example that follows: a script that deploys dashboards is 'deploy_dashboards.sh', not 'push_dashboards.sh'. That is one illustration of the principle, not the extent of it
