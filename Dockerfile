FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:0.7.13 /uv /uvx /bin/

SHELL ["/bin/bash", "-c"]

RUN apt update && apt clean && chmod +x /bin/uv /bin/uvx

# RUN apt update && apt install -y --no-install-recommends \
# git \
# make \
# curl \
# ca-certificates \
# && apt clean \
# && chmod +x /bin/uv /bin/uvx

ENV PATH="/bin:$PATH"

WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH"

RUN uv pip install --system pytest pytest-cov pyright
