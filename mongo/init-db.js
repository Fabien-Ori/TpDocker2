db = db.getSiblingDB('blog_db');
db.createCollection('posts');
db.posts.insertMany([
    { title: "Post 1", content: "Contenu 1" },
    { title: "Post 2", content: "Contenu 2" },
    { title: "Post 3", content: "Contenu 3" },
    { title: "Post 4", content: "Contenu 4" },
    { title: "Post 5", content: "Contenu 5" }
]);