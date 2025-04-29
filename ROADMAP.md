# Оглавление

1. Base
   1. Backend service
   2. Local DeepSeek Node
   3. Local ComfyUI Node
   4. Run in docker-compose
2. MWP
   1. Telegram bot
   2. DeepSeek worker
   3. ComfyUI worker
   4. RabbitMQ
3. Base comers
   1. Users storage
   2. Logging (Loki)
   3. Monitoring (Prometheus)
   4. Exceptions catch (Sentry)
   5. Storing images (MinIO)
   6. Backups
4. Comers
   1. Admin panel 
   2. Payments
   3. Setup users plans and types
   4. Add black lists
   5. Add models selecting
5. Ahuel stage
   1. Self hosted gitlab, CI/CD pipelines
   2. Distributed ML services, Ques
   3. Load balancing
   4. Run in pipline `TG bot -> DeepSeek -> ComfyUI -> TG bot`

# Roadmap

## Base

1. **Backend service** - сервис с 2 ручками, для **DeepSeek** и **ComfyUI**. В будущем будет отвечать за связь с RabbitMQ 
2. Запуск **DeepSeek** в **Docker**, попытаться получить доступ по **api**
3. Запуск **ComfyUI** в **Docker**, попытаться получить доступ по **api**
4. Запуск всех 3 сервисов в **docker-compose**, тест ручек

## MWP

### 1. Telegram бот 

Бот с 2 кнопками, выбирающими куда направится запрос - в **DeepSeek** или **ComfyUI**.
Отправленный промпт сразу закидывается в **Backend service**, в соответствующие ручки. 
В результате должен быть получен ответ соответствующего формата (текст/изображение), 
либо информация об ошибке в **Inline** респонсе на промпт 

### 2. DeepSeek worker

Получает промпт/параметры для запуска, связывается с поднятым сервисом **DeepSeek**, следит за таймаутами выполнения
Следит за доступностью **DeepSeek**, перезагрузка - если недоступен

### 3. ComfyUI worker

Получает промпт/параметры для запуска, связывается с поднятым сервисом **ComfyUI**, следит за таймаутами выполнения
Следит за доступностью  **ComfyUI**, перезагрузка - если недоступен


### 4. RabbitMQ

Связывает **Backend service** с  **DeepSeek worker** и **ComfyUI worker**


