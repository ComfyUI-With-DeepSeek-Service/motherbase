#!/bin/sh
# clear ready flag
rm -f /tmp/ollama_ready

ollama serve &

# Ждем запуска Ollama сервера
echo "Starting Ollama..."
until curl -s http://localhost:11434; do
  sleep 1
done

# Перечисляем модели для установки
MODELS="deepseek-r1:1.5b"

# Качаем модели, если еще не скачали
for MODEL in $MODELS; do
  if ! ollama list | grep -q "$MODEL"; then
    echo "⚡️ Pulling model: $MODEL"
    ollama pull "$MODEL"
  else
    echo "⛳️ Model '$MODEL' already present."
  fi
done

# set container as ready
touch /tmp/ollama_ready

while true; do
  sleep 86400  # Sleep for a long time (1 day)
done
