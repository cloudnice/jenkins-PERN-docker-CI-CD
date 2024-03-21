# Pod'un log dosyalarını görüntüleme

kubectl logs <pod_adı>

# Pod içinde interaktif bir kabuk başlatma

kubectl exec -it <pod_adı> -- /bin/sh

# Pod içinde çalışan süreçleri ve port durumunu kontrol etme

ps aux
netstat -tulpn

# Pod'un disk kullanımını kontrol etme

kubectl exec -it <pod_adı> -- df -h

# Pod'un ağ durumunu kontrol etme

kubectl exec -it <pod_adı> -- ping <hedef_adres>
kubectl exec -it <pod_adı> -- traceroute <hedef_adres>

# Pod içindeki çevresel değişkenleri görüntüleme

kubectl exec -it <pod_adı> -- env

# Pod içindeki bir konfigürasyon dosyasını görüntüleme

kubectl exec -it <pod_adı> -- cat /path/to/config-file

#Bu komut, tüm pod'ların manifestosunu YAML formatında listeler.
kubectl get pod -o yaml
kubectl edit pod server

kubectl config view komutunu çalıştırarak küme bilgilerinizi edinin.
