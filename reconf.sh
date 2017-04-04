#!/bin/bash
source custom.conf

echo 'Reconfigure Elasticsearch...'
sed -e "s/\\\$ELASTICSEARCH_IP/${ELASTICSEARCH_IP}/g;" \
    "tools/elasticsearch/es-svc.yaml.sed" > tools/elasticsearch/es-svc.yaml

echo 'Reconfigure MongoDB...'
sed -e "s/\\\$MONGODB_IP/${MONGODB_IP}/g;" \
    "tools/mongodb/mongo-service.yaml.sed" > tools/mongodb/mongo-service.yaml

echo 'Reconfigure RabbitMQ...'
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;" \
    "tools/rabbitmq/rabbitmq-service.yaml.sed" > tools/rabbitmq/rabbitmq-service.yaml

echo 'Reconfigure Curator...'
sed -e "s/\\\$ELASTICSEARCH_IP/${ELASTICSEARCH_IP}/g;"`
    `"s/\\\$MONGODB_IP/${MONGODB_IP}/g;"`
    `"s~\\\$UPLOADER_ADDR~${UPLOADER_ADDR}~g;"`
    `"s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;"`
    `"s/\\\$ADMIN_EMAIL/${ADMIN_EMAIL}/g;"`
    `"s/\\\$SMTP_SERVER/${SMTP_SERVER}/g;" \
    "curator/curator-rc.yaml.sed" > curator/curator-rc.yaml

echo 'Reconfigure Uploader...'
sed -e "s~\\\$CURATOR_ADDR~${CURATOR_ADDR}~g;"`
    `"s~\\\$UPLOADER_ADDR~${UPLOADER_ADDR}~g;" \
    "uploader/uploader-rc.yaml.sed" > uploader/uploader-rc.yaml

echo 'Reconfigure Extractors...'
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;" \
    "extractors/dm3-extractor.yaml.sed" > extractors/dm3-extractor.yaml
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;"`
    `"s~\\\$CURATOR_ADDR~${CURATOR_ADDR}~g;" \
    "extractors/sem-extractor.yaml.sed" > extractors/sem-extractor.yaml
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;" \
    "extractors/xray-extractor.yaml.sed" > extractors/xray-extractor.yaml
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;" \
    "extractors/xray-powder-extractor.yaml.sed" > extractors/xray-powder-extractor.yaml
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;" \
    "extractors/image-preview-extractor.yaml.sed" > extractors/image-preview-extractor.yaml
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;" \
    "extractors/afm-extractor.yaml.sed" > extractors/afm-extractor.yaml
sed -e "s/\\\$RABBITMQ_IP/${RABBITMQ_IP}/g;"`
    `"s~\\\$CURATOR_ADDR~${CURATOR_ADDR}~g;" \
    "extractors/zip-extractor.yaml.sed" > extractors/zip-extractor.yaml
