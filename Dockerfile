# syntax=docker/dockerfile:1
FROM python:3.10-slim-buster

# 声明构建参数
ARG BASE_URL
ARG SESSION_ID
ARG SQL_name
ARG SQL_user
ARG SQL_password
ARG SQL_IP
ARG SQL_dk
ARG COOKIE1
ARG COOKIE2
# 将构建参数转换为环境变量，以便运行时使用
ENV BASE_URL=${BASE_URL} \
    SESSION_ID=${SESSION_ID} \
    SQL_name=${SQL_name} \
    SQL_user=${SQL_user} \
    SQL_password=${SQL_password} \
    SQL_IP=${SQL_IP} \
    SQL_dk=${SQL_dk} \
    COOKIE1=${COOKIE1} \
    COOKIE2=${COOKIE2}

WORKDIR /app

COPY requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt --no-cache-dir

COPY . .

EXPOSE 8000
CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]
