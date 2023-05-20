# Stage 1: Build stage
FROM python:3.9-alpine AS builder
WORKDIR /app
# COPY   req.txt .
# RUN pip install --no-cache-dir -r req.txt
RUN pip install flask
#COPY app.py /app/app.py

# Stage 2: Production stage
FROM python:3.9-alpine
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY . .
EXPOSE 5001
CMD ["python", "app.py"]