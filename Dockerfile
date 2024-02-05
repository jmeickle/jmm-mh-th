FROM python:3.10
WORKDIR /code

# set env vars to make pip/poetry behavior nicer + Docker-compatible
ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_CACHE_DIR='/var/cache/pypoetry' \
  POETRY_HOME='/opt/poetry' \
  POETRY_VERSION=1.7.1

# poetry install is cacheable
RUN python3 -m venv ${POETRY_HOME} \
    && ${POETRY_HOME}/bin/pip install poetry==${POETRY_VERSION} \
    && ${POETRY_HOME}/bin/poetry --version

# will only cause layer rebuild if deps change
COPY app/poetry.lock app/pyproject.toml /code/
RUN ${POETRY_HOME}/bin/poetry install \
    --no-interaction \
    --no-ansi

# then copy code over
COPY ./app /code/ 

# default to http serve
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]