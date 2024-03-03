# Docker Compose Kullanımı

Docker Compose ile tanımlanan servisleri başlatır. -d seçeneği, işlemleri arka planda (detached) çalıştırır.
```bash
docker-compose up -d
```
Docker Compose ile başlatılan servisleri durdurur ve ilişkili volumeleri (örneğin, veritabanı verileri) siler. -v seçeneği, volumeleri de siler.
```bash
docker-compose down -v
```
Docker Compose ile başlatılan servisleri duraklatır.
```bash
docker-compose pause
```
Duraklatılan servisleri devam ettirir.
```bash
docker-compose unpause
```
 Docker Compose ile başlatılan servisleri yeniden başlatır.
```bash
docker-compose restart
```
Servislerin loglarını görüntüler.
```bash
docker-compose logs
```
Belirli bir servisin loglarını görüntüler.
```bash
docker-compose logs <servis-adı>
```
Çalışan container'ları ve servisleri listeler.
```bash
docker-compose ps
```
 Bağlı olduğunuz ağları listeler.
```bash
docker network ls
```
 Belirli bir servisin Docker Compose konfigürasyon dosyasını görüntüler.
```bash
docker-compose config <servis-adı>
```
Dockerfile'ları kullanarak imajları yeniden derlemeyi sağlar. Bu, özellikle Dockerfile veya bağımlılıklarda değişiklik yapıldığında kullanışlıdır.
```bash
docker-compose up --build
```


