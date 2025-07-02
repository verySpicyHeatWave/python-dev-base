FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:0.7.13 /uv /uvx /bin/

RUN apt update && apt install -y --no-install-recommends \
git \
make \
ca-certificates \
&& apt clean

WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH"

RUN uv pip install pytest pytest-cov pyright
