CREATE TABLE IF NOT EXISTS utilisateurs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO utilisateurs (nom, email)
SELECT 'Alice', 'alice@example.com'
WHERE NOT EXISTS (SELECT 1 FROM utilisateurs WHERE email = 'alice@example.com');

INSERT INTO utilisateurs (nom, email)
SELECT 'Bob', 'bob@example.com'
WHERE NOT EXISTS (SELECT 1 FROM utilisateurs WHERE email = 'bob@example.com');

INSERT INTO utilisateurs (nom, email)
SELECT 'Charlie', 'charlie@example.com'
WHERE NOT EXISTS (SELECT 1 FROM utilisateurs WHERE email = 'charlie@example.com');
