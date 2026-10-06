# Tự detect OS
ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
else
    DETECTED_OS := $(shell uname -s)
endif

.PHONY: dev stop pipeline train logs

# Chạy dev environment (backend + frontend + db)
dev:
	docker compose up --build

# Chạy chỉ backend + db (khi frontend dev ngoài container)
dev-backend:
	docker compose up backend db --build

# Chạy pipeline gán nhãn Last.fm
label:
	docker compose --profile pipeline run ai-pipeline \
	python data_pipeline/lastfm_tagger.py

# Trích xuất audio features
extract:
	docker compose --profile pipeline run ai-pipeline \
	python data_pipeline/audio_extractor.py

# Xây đồ thị
build-graph:
	docker compose --profile pipeline run ai-pipeline \
	python graph/build_graph.py

# Train GNN
train:
	docker compose --profile pipeline run ai-pipeline \
	python models/train.py

# Xem logs
logs:
	docker compose logs -f

# Dừng tất cả
stop:
	docker compose down

# Reset database (cẩn thận)
db-reset:
	docker compose down -v
	docker compose up db -d