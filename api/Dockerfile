FROM python:3.12-slim
WORKDIR /app
RUN groupadd -r apiuser && useradd -r -g apiuser apiuser
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chown -R apiuser:apiuser /app
USER apiuser
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
