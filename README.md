# Docker Compose - Stack Hybrid MongoDB + MySQL

## Démarrage

```powershell
docker compose up -d --build
```

## Commandes utiles

### Gestion de la stack

```powershell
# Démarrer la stack
docker compose up -d

# Démarrer et reconstruire les images
docker compose up -d --build

# Arrêter la stack
docker compose down

# Arrêter et supprimer les volumes
docker compose down -v

# Voir l'état des services
docker compose ps

# Afficher les logs de tous les services
docker compose logs

# Afficher les logs en temps réel
docker compose logs -f

# Logs d'un service spécifique
docker compose logs -f api
docker compose logs -f db_mongo
docker compose logs -f db_mysql
```

### Test des routes API

```powershell
curl http://localhost:8000/posts
curl http://localhost:8000/users
```

### Accès aux interfaces web

```powershell
# mongo-express (admin: pass)
http://localhost:8081

# Adminer (MySQL)
http://localhost:8080
```

## Arborescence

```
TpDocker2/
├── docker-compose.yml         # Orchestration principale
├── .env                        # Variables d'environnement (secrets)
├── .env.example               # Template .env pour documentation
├── .gitignore                 # Git ignore .env
│
├── api/                       # Service API FastAPI
│   ├── Dockerfile             # Image non-root (appuser, uid 999)
│   ├── main.py                # Routes hybrides /posts et /users
│   └── requirements.txt        # Dépendances Python
│
├── mongo/                     # Service MongoDB
│   ├── Dockerfile             # Image custom Mongo (mongodb user, uid 1000)
│   └── init-db.js             # Script d'initialisation (5 articles de test)
│
├── admin_mongo/               # Service mongo-express (admin MongoDB web)
│   └── Dockerfile             # Wrapper mongo-express non-root (node user, uid 1000)
│
└── mysql/                     # Service MySQL
    ├── init-db.sql            # Script initialisation
    ├── my.cnf                 # Config MySQL
```

## Screenshots

![Services Healthy](Sreen%20services%20Healthy.png)

![Posts](Screen%20Posts.png)

![Users](Screen%20Users.png)

![mongo-express](Screen%20Mongo%20express.png)

![Adminer](Screen%20Adminer.png)
