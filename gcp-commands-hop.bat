REM Commands used on Windows 10 to establish a GCP environment for Apache Hop to Run

REM Follow the prompts to configure and connect the Google Cloud SDK to the Google Cloud Platform
gcloud init

REM Show existing project names in GCP
gcloud projects list

REM Create a project called hop-dataflow-demo in GCP
gcloud projects create hop-dataflow-demo

REM Select and set the hop-dataflow-demo project as active
 gcloud config set core/project hop-dataflow-demo
 
 REM 
 REM Go to the web console to assign a billing account to the hop-dataflow-demo project.
 REM

REM Create a storage bucket for containing the input data and running Dataflow.
 gsutil mb gs://apachehopdemo

REM Create a service account to access resources and APIs for Apache Hop to use when orchestrating workflows.
gcloud iam service-accounts create hopsvc --description="Apache Hop Service Account" --display-name="Apache Hop Service"

REM At this point you will have to go to the GCP Web Console - IAM - Service Accounts and go create a key in JSON format for the account.

REM
REM  Apache Hop - Beam Sample Project steps
REM 
REM  - We need to copy the input files for the Beam sample project to the Google bucket we created earlier gs://apachehopdemo
REM  - Trickery Warning: Google storage does not support folders for files, but fakes it by putting the folder name and slash in the filename

REM 
cd C:\Users\usbra\src\gcp-hop-dataflow\hop\config\projects\samples\beam\input
gsutil cp ./* gs://apachehopdemo/input/