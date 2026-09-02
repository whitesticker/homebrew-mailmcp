cask "mailmcp" do
  version "1.2.0"
  sha256 "5e6d3d6c8d16b8a23fbb8a8634a7260c6bb2cb81ea4a50cc4c397e4ef2c61330"

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
    Keep MailMCP open (or in the menu bar) while agents run.
  EOS
end
