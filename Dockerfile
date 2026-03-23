FROM python:3.14-slim

WORKDIR /app

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency files first for layer caching
COPY pyproject.toml uv.lock ./

# Install dependencies into system Python (no venv)
ENV UV_SYSTEM_PYTHON=1
RUN uv sync --frozen --no-dev

# Copy application code
COPY main.py ./
COPY static/ ./static/
COPY templates/ ./templates/

EXPOSE 8000

CMD ["air", "run"]
