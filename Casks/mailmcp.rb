cask "mailmcp" do
  version "1.1.0"
  sha256 "cdad0f1d84346c62c3790b78508f60123e2e3293cb9aee077f0c84f6f7385cb5"

  url "https://github.com/whitesticker/mailmcp/releases/download/v#{version}/MailMCP-#{version}.zip"
  name "MailMCP"
  desc "Local MCP server so agents can process your mail"
  homepage "https://github.com/whitesticker/mailmcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MailMCP.app"
  binary "#{appdir}/MailMCP.app/Contents/MacOS/mailmcp-mcp"

  caveats <<~EOS
    MailMCP is ad-hoc signed. If macOS blocks the first launch:
      xattr -dr com.apple.quarantine #{appdir}/MailMCP.app
    Then open MailMCP, unlock the vault, and use Add to an agent.
  EOS
end
