from fastapi import FastAPI
from motor.motor_asyncio import AsyncIOMotorClient
import sqlalchemy
import os

app = FastAPI()

# Clients
mongo_client = AsyncIOMotorClient(os.getenv("MONGO_URL"))
mongo_db = mongo_client.blog_db
engine = sqlalchemy.create_engine(os.getenv("MYSQL_URL"))

@app.get("/posts")
async def get_posts():
    cursor = mongo_db.posts.find({}, {"_id": 0})
    return await cursor.to_list(length=100)

@app.get("/users")
def get_users():
    with engine.connect() as conn:
        result = conn.execute(sqlalchemy.text("SELECT * FROM utilisateurs"))
        return [dict(row._mapping) for row in result]