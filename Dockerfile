#stage1
FROM python:3.9 AS bigstage

WORKDIR /app

COPY . .

#stage2
FROM python:3.9-slim-bullseye

COPY --from=bigstage /app /app

RUN pip install flask

CMD ["python","app.py"]

