from prefect_gcp import GcpCredentials 
from prefect_gcp.cloud_storage import GcsBucket    
from dotenv import load_dotenv
import os

# pull in credentials from .env file
load_dotenv()
                                                                      
gcp_credentials_block = GcpCredentials.load("zoom-gcp-creds-cloud")  
                                                                          
GcsBucket(bucket=os.getenv("GCS_BUCKET_NAME"),  # GCS bucket name,                                   
          gcp_credentials=gcp_credentials_block                
          ).save("zoom-gcs-cloud") 