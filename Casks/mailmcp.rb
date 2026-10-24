cask "mailmcp" do
  version "1.5.0"
  sha256 "d6824d6a130bd11658c9db91bf92990ef18c95913be2989e3ad5279387aa2a6c"

  url "https://github.com/whitesticker/mailmcp/releases/download/v#{version}/MailMCP-#{version}.zip"
  name "MailMCP"
  desc "Local MCP server so agents can process your mail"
  homepage "https://github.com/whitesticker/mailmcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "MailMCP.app"
  binary "#{appdir}/MailMCP.app/Contents/MacOS/mailmcp-mcp"

  caveats <<~EOS
    MailMCP is ad-hoc signed. If macOS blocks the first launch:
      xattr -dr com.apple.quarantine #{appdir}/MailMCP.app
    Keep MailMCP open (or in the menu bar) while agents run.
  EOS
end
