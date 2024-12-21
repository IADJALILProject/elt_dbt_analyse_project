import psycopg2
from faker import Faker
import random

# Connexion à PostgreSQL
def connect_to_db():
    try:
        conn = psycopg2.connect(
            dbname="sales_db",        # Nom de votre base de données
            user="postgres",          # Nom d'utilisateur PostgreSQL
            password="anis1999", # Votre mot de passe PostgreSQL
            host="localhost",         # Hôte PostgreSQL (par défaut localhost)
            port="5432"               # Port PostgreSQL (par défaut 5432)
        )
        return conn
    except Exception as e:
        print(f"Erreur de connexion à la base de données : {e}")
        exit()

# Générer des données fictives pour les commandes
def generate_fake_orders(num_orders=100, user_ids=None):
    fake = Faker()
    orders = []
    statuses = ["Pending", "Completed", "Cancelled", "Shipped"]  # Statuts possibles
    if not user_ids:
        user_ids = list(range(1, 101))  # Par défaut, 100 utilisateurs (id 1 à 100)
    
    for _ in range(num_orders):
        user_id = random.choice(user_ids)  # Associer une commande à un utilisateur existant
        order_amount = round(random.uniform(20.0, 500.0), 2)  # Montant aléatoire entre 20 et 500
        order_date = fake.date_time_this_year()  # Date de commande cette année
        status = random.choice(statuses)  # Statut aléatoire
        orders.append((user_id, order_amount, order_date, status))
    return orders

# Insérer les données dans PostgreSQL
def insert_orders_into_db(orders):
    conn = connect_to_db()
    cursor = conn.cursor()
    try:
        insert_query = """
        INSERT INTO public.orders (user_id, order_amount, order_date, status)
        VALUES (%s, %s, %s, %s);
        """
        cursor.executemany(insert_query, orders)
        conn.commit()
        print(f"{len(orders)} lignes insérées dans public.orders.")
    except Exception as e:
        print(f"Erreur lors de l'insertion : {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

# Générer et insérer des commandes
if __name__ == "__main__":
    num_orders = 100  # Nombre de commandes à générer
    # Liste des IDs utilisateur disponibles (doit correspondre aux IDs dans public.users)
    user_ids = list(range(1, 101))  # Exemple : 100 utilisateurs (id 1 à 100)
    orders = generate_fake_orders(num_orders, user_ids)
    insert_orders_into_db(orders)
