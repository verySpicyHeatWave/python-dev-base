FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:0.7.13 /uv /bin/uv
COPY --from=ghcr.io/astral-sh/uv:0.7.13 /uvx /bin/uvx

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y --no-install-recommends \
git \
make \
ca-certificates \
&& apt clean \
&& chmod +x /bin/uv /bin/uvx

ENV PATH="/bin:$PATH"

WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH"

RUN /bin/uv pip install pytest pytest-cov pyright
