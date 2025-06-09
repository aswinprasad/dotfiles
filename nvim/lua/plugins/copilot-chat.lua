return {
  "CopilotC-Nvim/CopilotChat.nvim",
  enabled = true,
  opts = {
    model = "claude-3.7-sonnet-thought",
    mappings = {
      reset = {
        normal = "<C-r>",
        insert = "<C-r>",
      },
    },
    prompts = {
      Commit = {
        prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.",
        context = "git:unstaged",
      },
      PRDescription = {
        prompt = "Generate a concise PR description for these changes. Include: 1) A title with format '[JIRA-XXX] type(scope): description' title can be outside the markdown, 2) A '## Overview' section using bullet points if necessary, mentioning the relevant JIRA ticket separately at the start using '**Ticket**:', 3) '## Screenshots' section with placeholder text. Be direct and minimal. Use markdown format.",
        context = "git:staged",
        description = "Generate PR description with JIRA ticket #",
      },
    },
  },
}
