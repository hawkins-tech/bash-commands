# bash-commands

A collection of useful bash command-line utilities that can be easily installed to your system.

## 📦 Installation

You can install all commands with a single command using curl:

```bash
curl -sSL https://raw.githubusercontent.com/hawkins-tech/bash-commands/main/install.sh | bash
```

Or clone and install manually:

```bash
git clone https://github.com/hawkins-tech/bash-commands.git
cd bash-commands
sudo cp bin/* /usr/local/bin/
sudo chmod +x /usr/local/bin/{killgrep,always,execs}
```

## 🛠️ Available Commands

### killgrep

Kill processes that fuzzy match a given name pattern.

**Usage:**
```bash
killgrep <name>
```

**Example:**
```bash
killgrep node        # Find and kill processes matching "node"
killgrep python      # Find and kill processes matching "python"
```

The command will show you matching processes and ask for confirmation before killing them.

### always

Keep trying to run a command with a short sleep between attempts until it succeeds.

**Usage:**
```bash
always <command> [args...]
```

**Example:**
```bash
always curl https://api.example.com/health     # Keep trying until the API is up
always ping -c 1 192.168.1.1                   # Keep pinging until host responds
```

Press `Ctrl+C` to stop the retry loop.

### execs

List all executable files in your PATH, organized by directory.

**Usage:**
```bash
execs
```

**Example output:**
```
Executable files in PATH:

# /usr/local/bin
kubectl
docker
node

# /usr/bin
bash
ls
grep
...
```

## 📝 Development

To add new commands:

1. Create a new bash script in the `bin/` directory
2. Make it executable: `chmod +x bin/yourcommand`
3. Add a shebang line: `#!/bin/bash`
4. Document it in this README

## 📄 License

MIT