FROM python:3.11-slim

WORKDIR /app

# Cài PyTorch trước (nặng nhất, cache layer này)
RUN pip install torch==2.1.0 --index-url https://download.pytorch.org/whl/cpu

# Cài PyG
RUN pip install torch-geometric

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "-m", "data_pipeline.lastfm_tagger"]