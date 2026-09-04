{ ... }:

{
  programs.claude-code = {
    enable = true;
    settings = {
      theme = "dark";
    };
    agents = {
      code-reviewer = ''
        ---
        name: code-reviewer
        description: Specialized code review
        tools: Read, Edit, rg
        ---

        You are a senior software engineer specializing in code reviews.
        Focus on code quality, security and maintainability.
      '';
    };
  };
}
