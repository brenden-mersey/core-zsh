# VS Code Setup

## Active Theme

- Color theme: `Theme Darker` (from the `tal7aouy.theme` extension)

## User Settings (`settings.json`)

```json
{
  "workbench.sideBar.location": "right",
  "workbench.colorTheme": "Theme Darker",
  "editor.minimap.enabled": false,
  "security.workspace.trust.untrustedFiles": "open",
  "editor.hover.delay": 3000,
  "intelephense.stubs": [
    "apache",
    "bcmath",
    "bz2",
    "calendar",
    "com_dotnet",
    "Core",
    "ctype",
    "curl",
    "date",
    "dba",
    "dom",
    "enchant",
    "exif",
    "FFI",
    "fileinfo",
    "filter",
    "fpm",
    "ftp",
    "gd",
    "gettext",
    "gmp",
    "hash",
    "iconv",
    "imap",
    "intl",
    "json",
    "ldap",
    "libxml",
    "mbstring",
    "meta",
    "mysqli",
    "oci8",
    "odbc",
    "openssl",
    "pcntl",
    "pcre",
    "PDO",
    "pdo_ibm",
    "pdo_mysql",
    "pdo_pgsql",
    "pdo_sqlite",
    "pgsql",
    "Phar",
    "posix",
    "pspell",
    "random",
    "readline",
    "Reflection",
    "session",
    "shmop",
    "SimpleXML",
    "snmp",
    "soap",
    "sockets",
    "sodium",
    "SPL",
    "sqlite3",
    "standard",
    "superglobals",
    "sysvmsg",
    "sysvsem",
    "sysvshm",
    "tidy",
    "tokenizer",
    "xml",
    "xmlreader",
    "xmlrpc",
    "xmlwriter",
    "xsl",
    "Zend OPcache",
    "zip",
    "zlib",
    "wordpress"
  ],
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "git.openRepositoryInParentFolders": "never",
  "yaml.schemas": {
    "file:///Users/thedeathstar/.vscode/extensions/atlassian.atlascode-3.2.2/resources/schemas/pipelines-schema.json": "bitbucket-pipelines.yml"
  },
  "redhat.telemetry.enabled": true,
  "atlascode.bitbucket.enabled": true,
  "bitoAI.appearance.fontSize (Match with IDE Font)": false,
  "bitoAI.codeCompletion.enableAutoCompletion": true,
  "bitoAI.codeCompletion.enableCommentToCode": true,
  "editor.inlineSuggest.showToolbar": "always",
  "editor.fontVariations": false,
  "debug.javascript.resourceRequestOptions": {},
  "[html]": {
    "editor.formatOnSave": false,
    "editor.defaultFormatter": "vscode.html-language-features"
  },
  "html.format.indentInnerHtml": true,
  "html.format.extraLiners": "head,body,/html",
  "html.format.wrapAttributes": "aligned-multiple",
  "html.format.preserveNewLines": true,
  "html.format.unformatted": "wbr,code,pre,textarea,span",
  "html.format.contentUnformatted": "pre,code,textarea",
  "[php]": {
    "editor.defaultFormatter": "bmewburn.vscode-intelephense-client",
    "editor.tabSize": 2
  },
  "intelephense.format.braces": "k&r",
  "files.associations": {
    "*.js": "javascript"
  },
  "[javascript]": {
    "editor.maxTokenizationLineLength": 2500
  },
  "workbench.startupEditor": "none",
  "security.allowedUNCHosts": ["wsl.localhost"],
  "github.copilot.enable": {
    "*": false,
    "plaintext": false,
    "markdown": false,
    "scminput": false,
    "typescriptreact": true,
    "typescript": false
  },
  "github.copilot.nextEditSuggestions.enabled": false,
  "gitlens.views.commits.showBranchComparison": "branch",
  "explorer.confirmDelete": false,
  "gitlens.ai.model": "vscode",
  "gitlens.ai.vscode.model": "copilot:gpt-4.1",
  "explorer.confirmPasteNative": false,
  "claudeCode.preferredLocation": "panel",
  "terminal.integrated.inheritEnv": true,
  "terminal.integrated.defaultProfile.osx": "zsh",
  "claudeCode.useTerminal": true,
  "diffEditor.ignoreTrimWhitespace": false
}
```

> **Note:** the `yaml.schemas` entry points to `/Users/thedeathstar/.vscode/extensions/...`, a path that doesn't match this machine's username. It's a stale/inherited reference (won't resolve here either) and will need updating to the real `atlassian.atlascode` extension path once reinstalled on the new machine, or removed if unused.

## Installed Extensions

### Shopify / Liquid
- `sissel.shopify-liquid`
- `killalau.vscode-liquid-snippets`
- `neilding.language-liquid`
- `shopify.theme-check-vscode`
- `shopify.polaris-for-vscode`

### PHP / WordPress
- `bmewburn.vscode-intelephense-client`
- `xdebug.php-debug`
- `johnbillion.vscode-wordpress-hooks`
- `wordpresstoolbox.wordpress-toolbox`

### Python
- `ms-python.python`
- `ms-python.debugpy`
- `ms-python.vscode-pylance`
- `ms-python.vscode-python-envs`

### Web / Frontend
- `esbenp.prettier-vscode`
- `mrmlnc.vscode-scss`
- `mohd-akram.vscode-html-format`
- `dsznajder.es7-react-js-snippets`
- `rodrigovallades.es7-react-js-snippets` (appears to duplicate the one above, worth checking before reinstalling both)
- `graphql.vscode-graphql`
- `graphql.vscode-graphql-syntax`
- `redhat.vscode-yaml`

### Git / Project Management
- `eamodio.gitlens`
- `atlassian.atlascode`
- `github.vscode-github-actions`

### AI Tooling
- `anthropic.claude-code`
- `silasnevstad.gpthelper`

### Themes
- `akamud.vscode-theme-onedark`
- `christopherafbjur.vscode-theme-onedarker`
- `emroussel.atomize-atom-one-dark-theme`
- `github.github-vscode-theme`
- `zhuangtongfa.material-theme`
- `tal7aouy.theme` (provides the active "Theme Darker" theme)

### Misc
- `editorconfig.editorconfig`
- `grapecity.gc-excelviewer`
- `ms-vscode.powershell`

## Quick Reinstall (Extensions Only)

Run on this machine to export the exact list, then bring the file to the new machine:

```bash
code --list-extensions > extensions.txt
```

On the new machine:

```bash
cat extensions.txt | xargs -L 1 code --install-extension
```
