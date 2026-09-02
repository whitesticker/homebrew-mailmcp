cask "mailmcp" do
  version "1.0.0"
  sha256 "2291d1d65990501ec2b5cad4f552c2b9e41545ebf870cddd8c190a0e90248d5a"

  url "https://github.com/whitesticker/mailmcp/releases/download/v#{version}/MailMCP-#{version}.zip"
  name "MailMCP"
  desc "Local MCP server so agents can process your mail"
  homepage "https://github.com/whitesticker/mailmcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "MailMCP.app"
  binary "#{appdir}/MailMCP.app/Contents/MacOS/mailmcp-mcp"

  caveats <<~EOS
    MailMCP is ad-hoc signed. If macOS blocks the first launch:
      xattr -dr com.apple.quarantine #{appdir}/MailMCP.app
    Then open MailMCP, unlock the vault, and use Add to an agent.
  EOS
end
