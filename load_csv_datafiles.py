# Libraries & dependencies
import pandas as pd
from sqlalchemy import create_engine

# MySQL connection string
conn_string = 'mysql+pymysql://MYUSERID:MYPASSWORD@localhost/painting_gallery'

# Create the engine to connect to MySQL
db = create_engine(conn_string)

# Files to load into MySQL
files = ['artist', 'canvas_size', 'image_link', 'museum_hours', 'museum', 'product_size', 'subject', 'work']

# Loop through each CSV file, read it into a DataFrame, and write to MySQL
for file in files:
    # Load CSV data
    df = pd.read_csv(f'dataset/{file}.csv')
    
    # Load data into MySQL, replace existing table if it exists
    df.to_sql(file, con=db, if_exists='replace', index=False)