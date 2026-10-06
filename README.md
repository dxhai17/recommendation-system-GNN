# MoodMap — Music Emotion Knowledge Graph

Hệ khuyến nghị âm nhạc tiếng Việt dựa trên cảm xúc.

## Yêu cầu
- Python 3.10+
- Node.js 18+
- Docker & Docker Compose
- Tài khoản Supabase (free tier)

## Setup lần đầu
1. Clone repo
2. `cp .env.example .env` và điền các giá trị
3. `make install`
4. `make dev`

## Cấu trúc dự án
- `ai/`       — pipeline dữ liệu, GNN model, embeddings
- `backend/`  — FastAPI server, business logic
- `frontend/` — Next.js app
- `data/`     — không commit lên git (xem .gitignore)

## Phân công
- Đỗ Xuân Hải: AI pipeline, GNN model
- Đặng Lê Khánh Hòa: Backend, Frontend, Database