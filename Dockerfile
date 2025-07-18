FROM rabbitmq:4-management

# Download and install the delayed message exchange plugin
# Using v4.1.0 which is compatible with RabbitMQ 4.0.x
ADD https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v4.1.0/rabbitmq_delayed_message_exchange-4.1.0.ez /plugins/

# Enable the plugin during build
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

# Expose the standard RabbitMQ ports
# 5672 - AMQP port
# 15672 - Management UI port
EXPOSE 5672 15672