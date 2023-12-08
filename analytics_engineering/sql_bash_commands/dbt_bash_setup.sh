# create virtual environment
python -m venv .venv

# activate virtual environment on mac
source .venv/bin/activate

## Installing dbt-bigquery will also install dbt-core and any other dependencies.
pip install dbt-bigquery 

## create dbt project
dbt init <dbt project name>

## choose database bigquery, snowflake, redshift, etc
## choose authentication method (oauth recommended)
## get gcp project id from google cloud platform
## choose dataset and enter all other options 

## check for issues with setup
cd <dbt project name>
dbt debug

##install the gcloud CLI
installation instructions -- https://cloud.google.com/sdk/docs/install

# login to profile
gloud init

## copy the link you are given to a new window to get the code for login, 
## and successfully connect you dbt to big query
## Cd to the folder that contains the project on your PC and type code . to open visual studio code.
code .

# run command again from your main dbt project to ensure that all checks passed
dbt debug

# physically create tables in staging layer, warehouse, and analytics_obt layer folders
## use dbt run command to create the tables in goobgle big query
dbt run

## create your date table as view and run it
dbt run --full-refresh

# update a particular table in a particular model
dbt run -m staging.stg_customer
dbt run -m warehouse.dim_customer



