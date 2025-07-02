FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:0.7.13 /uv /uvx /bin/

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y --no-install-recommends \
git \
make \
ca-certificates \
&& apt clean

WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH"

RUN uv add --dev pytest \
    && uv add --dev pytest-cov \ 
    && uv add --dev pyright
