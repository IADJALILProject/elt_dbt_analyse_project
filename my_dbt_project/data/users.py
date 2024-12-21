import psycopg2
from faker import Faker

# Connexion à PostgreSQL
conn = psycopg2.connect(
    dbname="sales_db",
    user="postgres",
    password="anis1999",  # Remplacez par votre mot de passe
    host="localhost",
    port=5432
)
cursor = conn.cursor()

# Génération de données avec Faker
fake = Faker()
num_rows = 100  # Nombre de lignes à insérer

for _ in range(num_rows):
    name = fake.name()
    email = fake.email()
    is_active = fake.boolean(chance_of_getting_true=75)  # 75% actif
    created_at = fake.date_time_this_year()

    query = """
    INSERT INTO public.users (name, email, is_active, created_at)
    VALUES (%s, %s, %s, %s);
    """
    cursor.execute(query, (name, email, is_active, created_at))

# Valider et fermer la connexion
conn.commit()
cursor.close()
conn.close()

print(f"{num_rows} lignes insérées avec succès !")
