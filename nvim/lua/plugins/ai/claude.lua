return {
	"coder/claudecode.nvim",
	-- loads on first use; until then Claude Code in another terminal can't find this nvim (use :ClaudeCode first)
	cmd = { "ClaudeCode", "ClaudeCodeFocus", "ClaudeCodeSelectModel", "ClaudeCodeAdd", "ClaudeCodeSend",
		"ClaudeCodeTreeAdd", "ClaudeCodeDiffAccept", "ClaudeCodeDiffDeny" },
	dependencies = { "folke/snacks.nvim" },
	config = true,
	opts = {
		terminal_cmd = "/opt/homebrew/bin/claude",
	},
}

