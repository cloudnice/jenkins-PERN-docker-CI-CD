# Jenkins Pipeline README

Bu Jenkins pipeline, Docker konteynerları kullanarak bir "To-Do" uygulamasının CI/CD süreçlerini otomatize eder. Aşağıda pipeline'ın genel adımları ve bu adımları takip ederken yapılan işlemler açıklanmıştır.

## Gereksinimler

- Jenkins CI/CD sunucusu
- Docker yüklü ve çalışır durumda
- DockerHub hesabı ve ilgili kimlik bilgileri
- Jenkins credential'lar: DOCKERHUB_TOKEN, POSTGRES_PASSWORD

## Jenkins Job Ayarları

1. Yeni bir Jenkins job'u oluşturun ve bu Jenkinsfile'ı pipeline script olarak ekleyin.

2. Jenkins job'unuzun yapılandırmasında, gerekli Jenkins parametrelerini ayarlayın:
   - `DOCKERHUB_USER`: DockerHub kullanıcı adınız
   - `APP_REPO_NAME`: Uygulama depo adı
   - `DB_VOLUME`: Docker volume adı
   - `NETWORK`: Docker network adı

3. Jenkins job'unuzu başlatın ve pipeline'ın başarıyla tamamlanmasını bekleyin.

## Pipeline Adımları

1. **Build App Docker Image:**
   - Uygulama Docker imajları oluşturulur.

2. **Push Image to DockerHub Repo:**
   - Oluşturulan Docker imajları DockerHub'a gönderilir.

3. **Create Volume:**
   - Docker volume oluşturulur.

4. **Create Network:**
   - Docker network oluşturulur.

5. **Deploy the Database:**
   - PostgreSQL konteynerı oluşturulur ve belirli bir ağa bağlanır.

6. **Wait for the Database Instance:**
   - PostgreSQL konteynerının hazır olması için beklenir.

7. **Deploy the Server:**
   - Node.js konteynerı oluşturulur ve belirli bir ağa bağlanır.

8. **Wait for the Server Instance:**
   - Node.js konteynerının hazır olması için beklenir.

9. **Deploy the Client:**
   - React konteynerı oluşturulur ve belirli bir ağa bağlanır.

10. **Destroy the Infrastructure:**
    - Onay alındıktan sonra, konteynerlar, ağlar ve volume'lar silinir.

## Hatalar ve Sorun Giderme

- Eğer hata alırsanız, Jenkins log'larını kontrol edin.
- Onay alındıktan sonra alınan herhangi bir hata durumunda, Docker kaynaklarının elle temizlenmesi gerekebilir.

## Temizleme ve Son Durum Kontrolü

Pipeline'ın her durumunda, `post` bloğu aşağıdaki adımları gerçekleştirir:

- **Always (Her Zaman):**
  - Tüm Docker konteynerları ve imajları, ağlar ve volume'lar silinir.
  
- **Success (Başarı):**
  - Pipeline başarıyla tamamlandığında yazılır.
  
- **Failure (Başarısızlık):**
  - Pipeline başarısız olduğunda yazılır ve hata durumunda temizleme işlemleri gerçekleştirilir.

---

