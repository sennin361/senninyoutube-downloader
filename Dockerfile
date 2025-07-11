FROM python:3.10-slim

# ffmpegをインストール
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /app

# 依存関係をコピーしてインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションのコードをコピー
COPY . .

# ポート設定
ENV PORT=10000
EXPOSE $PORT

# アプリ起動
CMD ["python", "app.py"]
