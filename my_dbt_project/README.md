# ELT DBT Analyse Project

## Introduction
Ce projet utilise dbt (Data Build Tool) pour construire un pipeline de données ELT (Extract, Load, Transform). Il vise à transformer des données brutes provenant de différentes sources en modèles analytiques prêts pour la consommation par les équipes métier.

Les principaux objectifs du projet :
- Transformer les données brutes en modèles exploitables.
- Créer des marts analytiques pour des analyses métier spécifiques.
- Maintenir un pipeline modulaire, reproductible et facile à tester.

## Architecture

Le projet suit une architecture standard dbt avec les composants suivants :

- **Sources** :
  - `users` : Table contenant les informations sur les utilisateurs.
  - `orders` : Table contenant les informations sur les commandes.

- **Staging Models** :
  - Préparation des données brutes pour les transformations.

- **Marts Models** :
  - Modèles finaux pour les analyses métier, incluant :
    - `user_order_summary` : Résumé des commandes par utilisateur.
    - `sales_by_month` : Agrégats des ventes par mois.
    - `user_segmentation` : Segmentation des utilisateurs selon les métriques RFM (Recency, Frequency, Monetary).
    - `order_status_summary` : Résumé des commandes par statut.

## Technologies

- **dbt** : Pour la transformation des données.
- **PostgreSQL** : Entrepôt de données cible.
- **Faker** : Génération de données factices pour les tables `users` et `orders`.

## Structure du projet

```
my_dbt_project/
├── models/
│   ├── marts/
│   │   ├── user_order_summary.sql
│   │   ├── sales_by_month.sql
│   │   ├── user_segmentation.sql
│   │   ├── order_status_summary.sql
│   ├── staging/
│   │   ├── stg_users.sql
│   │   ├── stg_orders.sql
│   ├── schema.yml
├── README.md
```

## Installation

### Prérequis
- Python 3.7+
- PostgreSQL
- dbt 1.x

### Étapes d'installation
1. Clonez ce dépôt :
   ```bash
   git clone git@github.com:IADJALILProject/elt_dbt_analyse_project.git
   cd elt_dbt_analyse_project
   ```

2. Installez dbt :
   ```bash
   pip install dbt-postgres
   ```

3. Configurez le fichier `profiles.yml` pour PostgreSQL :
   ```yaml
   my_dbt_project:
     target: dev
     outputs:
       dev:
         type: postgres
         host: localhost
         user: postgres
         password: your_password
         dbname: sales_db
         schema: public
   ```

4. Testez la configuration :
   ```bash
   dbt debug
   ```

5. Exécutez les modèles dbt :
   ```bash
   dbt run
   ```

6. Exécutez les tests dbt :
   ```bash
   dbt test
   ```

## Utilisation

### Transformation des données
- Exécutez `dbt run` pour transformer les données brutes en modèles analytiques.

### Documentation
- Générez la documentation des modèles avec :
  ```bash
  dbt docs generate
  dbt docs serve
  ```
  Accédez à la documentation dans votre navigateur à l'adresse : `http://localhost:8080`.

### Tests
- Vérifiez la qualité des données avec :
  ```bash
  dbt test
  ```

## Contributions
Les contributions sont les bienvenues ! Pour contribuer :
1. Forkez ce dépôt.
2. Créez une branche pour votre fonctionnalité : `git checkout -b feature/your-feature`.
3. Faites vos modifications et poussez-les : `git push origin feature/your-feature`.
4. Ouvrez une pull request.

## Licence
Ce projet est sous licence MIT. Consultez le fichier `LICENSE` pour plus de détails.

## Contact
Pour toute question ou suggestion, contactez-moi à salahbeydjalil@gmail.com.

