# Paths & Env Vars (quick reference)

## Check current directory and PATH
```bash
pwd
echo $PATH
```

## Export an env var for this shell
```bash
export OPENAI_API_KEY="your-key"
echo $OPENAI_API_KEY
```

## Use a .env file (keep secrets out of code)
Create `.env`:
```bash
OPENAI_API_KEY=your-key
VECTOR_DB_URL=http://localhost:6333
```
Load into shell (one-off):
```bash
set -a; source .env; set +a
```

## VSCode integrated terminal
- Open terminal: `View -> Terminal`.
- If using a venv, activate it before running commands.
