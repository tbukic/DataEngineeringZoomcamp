cd Week3
mkdir -P data
for MONTH in $(seq -f "%02g" 1 12);
do
	wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/fhv_tripdata_2019-$(echo $MONTH).csv.gz -O data/fhv_tripdata_2019-$(echo $MONTH).csv.gz
done