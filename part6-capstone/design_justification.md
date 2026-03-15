## Storage Systems

The architecture uses multiple specialized storage systems to support the four main goals of the hospital network: predictive analytics, natural language querying, reporting, and real-time monitoring.
The core operational system is a relational database (PostgreSQL) which stores live hospital data such as patient records, admissions, treatments, and billing transactions. This database serves as the OLTP system and is optimized for frequent reads and writes required in day-to-day hospital operations. Doctors, nurses, and administrative systems interact directly with this database.
For analytical reporting such as monthly management reports, the system uses a data warehouse (Snowflake). Data from the operational database is periodically extracted through a data pipeline and transformed before being loaded into the warehouse. The warehouse is optimized for large analytical queries and allows hospital administrators to analyze metrics like bed occupancy, treatment costs, and departmental performance without affecting operational workloads.
For predictive analytics, historical patient records are stored in a data lake or warehouse layer which feeds into an ML pipeline. Machine learning models trained on this historical data can predict patient readmission risk based on past treatment patterns, demographics, and medical conditions.
To support natural language queries by doctors, medical documents and patient history records are converted into embeddings and stored in a vector database such as Qdrant or Supabase Vector. When a doctor asks a question in natural language, the query is converted into a vector embedding and compared against stored embeddings to retrieve the most relevant patient records.
Finally, ICU monitoring devices generate continuous streams of vital data such as heart rate, oxygen saturation, and blood pressure. These streams are processed through Kafka and visualized using Grafana while being stored in a time-series database like InfluxDB. This enables real-time monitoring and alerting for critical patient conditions.


## OLTP vs OLAP Boundary

The OLTP system in this architecture is the hospital operational database where patient interactions occur in real time. This includes patient admissions, medical record updates, treatment logs, and billing transactions. These operations require fast inserts, updates, and transactional consistency.
The OLAP system begins after data is extracted from the operational database through the data pipeline. Once the data enters the data warehouse, it becomes part of the analytical layer. The warehouse is optimized for large aggregations, trend analysis, and reporting tasks used by hospital management.
Separating OLTP and OLAP workloads ensures that analytical queries do not slow down the transactional systems used by hospital staff. This separation improves reliability and performance for both operational and analytical tasks.

## Trade-offs

One significant trade-off in this architecture is increased system complexity. Using multiple systems such as relational databases, data warehouses, vector databases, streaming platforms, and machine learning pipelines introduces additional infrastructure and operational overhead.
However, each system is optimized for a different type of workload. For example, relational databases handle transactions efficiently, data warehouses support large-scale analytics, vector databases enable semantic search, and time-series databases are optimized for continuous monitoring data.
To mitigate this complexity, the hospital can use managed cloud services and centralized orchestration tools. Managed database services reduce infrastructure management effort, while workflow orchestration tools ensure reliable data movement between systems. This approach balances performance, scalability, and maintainability while meeting the hospital's diverse data requirements.

