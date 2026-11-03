FROM python:3.12-slim
WORKDIR /app
COPY square.py .
ENTRYPOINT ["python", "square.py"]
CMD ["4"]
