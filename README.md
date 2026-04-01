# Coalesce-BigQuery - Base Node Types

## Brief Summary
 
These Node Types transforms raw data into a Single Source of Truth, driving strategic value through four specialized architectural layers:
 
*   **Data Preparation & History (Work & Persistent Stage):**
    All data begins in the **Work** and **Persistent Stage** areas. Think of this as our quality control and storage hub. Here, raw data is cleaned and organized.
 
*   **Business Context & Events (Dimension):**
    To make sense of numbers, we need context. **Dimension** nodes provide the "who, what, where, and why" (e.g., Customer Details, Product Types, Store Locations). More importantly, we use these stages to keep a "historical memory" of the business, tracking how information—like a customer’s address or a product’s category—changes over time, ensuring we never lose sight of our past performance.
 
*   **Performance Metrics (Fact):**
    The **Fact** nodes are the heartbeat of our reporting. These store the quantitative "how much" of the business—such as total revenue, costs, and profit margins. By combining these facts with our Dimensions, leadership can see exactly how specific regions, products, or time periods are performing.
 
*   **Simplified Access (View):**
    Finally, **Views** act as a user-friendly window into this complex system. Instead of navigating technical tables, business users interact with Views that have been tailored for specific needs—providing secure, easy-to-read, and high-speed access to the exact data required for day-to-day decision-making.

---

## Nodetypes Config Matrix

| Category | Feature                         | Dim | Fact | View | Work | PStage |
|----------|----------------------------------|-----|------|----------|------|--------|
| Create   | Create As Table                  | ✅  | ✅   | ⬜       | ✅   | ✅     |
| Create   | Create As View                   | ✅  | ✅   | ⬜       | ✅   | ⬜     |
| Load     | MultiSource                      | ✅  | ✅   | ✅       | ✅   | ✅     |
| Load     | Business Key                     | ✅  | ✅   | ⬜       | ⬜   | ✅     |
| Load     | Last Modified Comparison         | ✅  | ✅   | ⬜       | ⬜   | ✅     |
| Load     | Change Tracking                  | ✅  | ⬜   | ⬜       | ⬜   | ✅     |
| Load     | Truncate Before                  | ✅  | ✅   | ✅       | ✅   | ✅     |
| Load     | Distinct                         | ✅  | ✅   | ✅       | ✅   | ✅     |
| Load     | Group By All                     | ✅  | ✅   | ✅       | ✅   | ✅     |
| Load     | Methods                          | MERGE | MERGE<br/>INSERT | ⬜ |INSERT | MERGE<br/>INSERT |
| Others   | Enable Tests                     | ✅  | ✅   | ⬜       | ✅   | ✅     |
| Others   | Pre-SQL                          | ✅  | ✅   | ⬜       | ✅   | ✅     |
| Others   | Post-SQL                         | ✅  | ✅   | ⬜       | ✅   | ✅     |

---

The Coalesce Base Node Types Package includes:

* [Work](#work)
* [Persistent Stage](#persistent-stage)
* [Dimension](#dimension)
* [Fact](#fact)
* [View](#view)
* [Code](#code)

---

## Work

The Coalesce work node is a versatile node that allows you to develop and deploy a Work table/view in Google BigQuery.

A Work node serves as an intermediary object and is commonly employed to store raw data before undergoing the crucial phases of transformation and loading into the main tables of the data warehouse.

This pivotal step ensures that the raw data is processed and structured effectively.

### Work Node Configuration

The Work node type has two configuration groups:

* [Node Properties](#work-node-properties)
* [Options](#work-options)

  <img width="450" height="211" alt="image" src="https://github.com/user-attachments/assets/2ec101d7-7d1d-48c8-b19b-5c7b54826fea" />

  #### Work Node Properties

| **Property** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the WORK will be created |
| **Node Type** | Name of template used to create node objects |
| **Deploy Enabled** | If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Work Options

You can create the node as:

* [Table](#work-options-table)
* [View](#work-options-view)

##### Work Options Table

<img width="430" height="749" alt="image" src="https://github.com/user-attachments/assets/b5985a19-de4e-406b-a0dd-d1c1e4c0b5c1" />


| **Property** | **Description** |
|---------|-------------|
| **Multi Source** |Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>-**False**: Single source node or multiple sources combined using a join |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be truncated before data load.<br/> **True**: Truncate table stage gets executed<br/>**False**: Table is appended with data load |
| **Enable tests** | Toggle: True/False<br/>Determines if column/node data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |
| **Pre-SQL** | SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Work Options View

<img width="452" height="530" alt="image" src="https://github.com/user-attachments/assets/1546f16c-e235-4f27-9929-0555fd4af6dc" />


| **Setting** | **Description** |
|---------|-------------|
| **Override Create SQL** | Toggle: True/False<br/>**True**: Customized Create SQL specified in the `Create SQL` space is executed. All other options are invisible except 'Enable Tests'<br/>**False**: Create view SQL based on options chosen are framed and executed |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Enable tests** | Toggle: True/False<br/>Determines if node/columns data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |

### Work Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

<img width="520" height="177" alt="image" src="https://github.com/user-attachments/assets/702bec15-97f7-4e92-83ce-6fd60668f977" />


> 📘 **Specify Group By Clauses**
>
> You should specify group by clause in this space if you are not opting for the group by all provided in OPTIONS config.

### Work Deployment

#### Work Initial Deployment

When deployed for the first time into an environment the Work node of materialization type table will execute the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Work Table** | This will execute a CREATE OR REPLACE statement and create a table in the target environment |
| **Create Work View** | This will execute a CREATE OR REPLACE statement and create a view in the target environment |

#### Work Redeployment

After the WORK node with materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the WORK Table or recreating the WORK table.

#### Altering the Work Tables

A few types of column or table changes will result in an ALTER statement to modify the Work Table in the target environment, whether these changes are made individually or all together:

* Changing table names
* Dropping existing columns
* Altering column data types
* Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Clone Table** | Creates an internal table |
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |
| **Swap Cloned Table** | Upon successful completion of all updates, the clone replaces the main table ensuring that no data is lost |
| **Delete Table** | Drops the internal table |

#### Metadata Update for the Work Tables

If any of the following change are detected, metadata update stage executes.

* Join clause
* Adding transformation
* Changes in configuration like adding distinct or group by

One of the following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Making metadata updates** | Refreshes metadata |

#### Recreating the Work Views

The subsequent deployment of Work node of materialization type view with changes in view definition, adding table description or renaming view results in deleting the existing view and recreating the view.

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete View** | Dropping existing view |
| **Create View** | Creates new view with updated definition |

### Work Undeployment

If a Work Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the WorkTable in the target environment will be dropped.

This is executed in below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete Table** | Drops the existing Work Table from target environment |

If a Work Node of materialization type view is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the WorkView in the target environment will be dropped.

The stage executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete View** | Drops the existing Work view from target environment |

---

## Persistent Stage 

The Coalesce Persistent Stage Nodes element, serving as an intermediary object, is frequently utilized to maintain data persistence across multiple execution cycles.

It plays a crucial role in tracking the historical changes of columns linked to business keys.

This functionality is particularly beneficial when the objective is to retain raw data for prolonged durations.

### Persistent Stage Node Configuration

The Persistent node type has two configuration groups:

* [Node Properties](#persistent-stage-node-properties)
* [Options](#persistent-stage-options)

  <img width="450" height="211" alt="image" src="https://github.com/user-attachments/assets/2ec101d7-7d1d-48c8-b19b-5c7b54826fea" />

#### Persistent Stage Node Properties

| **Property** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the PStage will be created |
| **Node Type** | Name of template used to create node objects |
| **Deploy Enabled** | If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Persistent Stage Options

| **Option** | **Description** |
|---------|-------------|
| **Create As** | Table is the only option at this time |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Business key** | Required column for both Type 1 and Type 2. |
| **Last Modified Comparison**<br/> | **Toggle**: True/False <br/>- **True**: Enables high-performance Change Data Capture (CDC) by comparing a specific source timestamp or numeric column to identify records that have changed since the last load. <br/>- **False**: Performs standard CDC by comparing data values across all designated Change Tracking columns to detect modifications. |
| **Treat NULL as Current Timestamp**(For TIMESTAMP Columns) | **Toggle**: True/False <br/>- **True**: Source records with a `NULL` value in the comparison column are assigned the current system timestamp. This ensures that records with missing modification metadata are treated as "new" and are updated in the target table. <br/>- **False**: `NULL` values are handled per standard SQL comparison rules, which may result in these records being ignored during incremental loads. |
| **Enable SCD Type 2** | Toggle: True/False <br/> **True**: Maintains historical versions of records using system start/end dates and version flags. |
| **Change tracking** | Required column for Type 2 |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be truncated before data load.<br/> **True**:Truncate table stage gets executed<br/>**False**: Table is appended with data load |
| **Enable tests** | Toggle: True/False<br/>Determines if node/columns data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |
| **Pre-SQL** | SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

### Persistent Stage Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

<img width="544" height="216" alt="image" src="https://github.com/user-attachments/assets/fa66147b-32cf-47e3-b9cc-5ef3c3f8613f" />

> 📘 **Specify Group By Clause**
>
> You should specify group by clause in this space if you are not opting for the group by all provided in OPTIONS config.

### Persistent Stage Deployment

#### Persistent Stage Initial Deployment

When deployed for the first time into an environment the Persistent node will execute the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Persistent Table** | This will execute a `CREATE OR REPLACE` statement and create a table in the target environment |

#### Persistent Stage Redeployment

After the Persistent node has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Persistent Table or recreating the Persistent table.

#### Altering the Persistent Tables

A few types of column or table changes will result in an ALTER statement to modify the Persistent Table in the target environment, whether these changes are made individually or all together:

* Changing table names
* Dropping existing columns
* Altering column data types
* Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Clone Table** | Creates an internal table |
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |
| **Swap Cloned Table** | Upon successful completion of all updates, the clone replaces the main table ensuring that no data is lost |
| **Delete Table** | Drops the internal table |

#### Metadata Update for the Persistent Tables

If any of the following change are detected, metadata update stage executes.

* Join clause
* Adding transformation
* Changes in configuration like adding distinct or group by

One of the following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Making metadata updates** | Refreshes metadata |

### Persistent Stage Undeployment

If a Persistent Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Persistent Table in the target environment will be dropped.

This is executed in below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete Table** | Drops table |
| **Drop View** | Drops view |

---

## Dimension

The Coalesce Dimension UDN is a versatile node that allows you to develop and deploy a Dimension table in Google BigQuery.

A dimension table or dimension entity is a table or entity in a star, snowflake, or starflake schema that stores details about the facts. Dimension tables describe the different aspects of a business process.

### Dimension Node Configuration

The Dimension node type has two configuration groups:

* [Node Properties](#dimension-node-properties)
* [Options](#dimension-options)

  <img width="450" height="211" alt="image" src="https://github.com/user-attachments/assets/2ec101d7-7d1d-48c8-b19b-5c7b54826fea" />

#### Dimension Node Properties

| **Property** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the Dimension will be created |
| **Node Type** | Name of template used to create node objects |
| **Deploy Enabled** | If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Dimension Options

##### Dimension Table Options

| **Options** | **Description** |
|---------|-------------|
| **Create As** | Table or View |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Business key** | Required column for both Type 1 and Type 2 Dimensions |
| **Last Modified Comparison**<br/> | **Toggle**: True/False <br/>- **True**: Enables high-performance Change Data Capture (CDC) by comparing a specific source timestamp or numeric column to identify records that have changed since the last load. <br/>- **False**: Performs standard CDC by comparing data values across all designated Change Tracking columns to detect modifications. |
| **Treat NULL as Current Timestamp**(For TIMESTAMP Columns) | **Toggle**: True/False <br/>- **True**: Source records with a `NULL` value in the comparison column are assigned the current system timestamp. This ensures that records with missing modification metadata are treated as "new" and are updated in the target table. <br/>- **False**: `NULL` values are handled per standard SQL comparison rules, which may result in these records being ignored during incremental loads. |
| **Enable SCD Type 2** | Toggle: True/False <br/> **True**: Maintains historical versions of records using system start/end dates and version flags. |
| **Change tracking** | Required column for Type 2 Dimension |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be truncated before data load.<br/> **True**:Truncate table stage gets executed<br/>**False**: Table is appended with data load |
| **Enable tests** | Toggle: True/False<br/>Determines if node/columns data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |
| **Pre-SQL** | SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Dimension View Options

<img width="438" height="642" alt="image" src="https://github.com/user-attachments/assets/ac688eeb-b91c-4334-bcb6-b2227188206d" />


| **Options** | **Description** |
|---------|-------------|
| **Override Create SQL** | Toggle: True/False<br/>**True**: Customized Create SQL specified in the `Create SQL` space is executed. All other options are invisible except 'Enable Tests'<br/>**False**: Create view SQL based on options chosen are framed and executed |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Business key** | Required column for both Type 1 and Type 2 Dimensions |
| **Enable tests** | Toggle: True/False<br/>Determines if node/columns data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |

### Dimension Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

<img width="493" height="187" alt="image" src="https://github.com/user-attachments/assets/7acec890-0e58-47ed-b03d-aa833a08f18a" />


> 📘 **Specify Group By Clause**
>
> You should specify group by clause in this space if you are not opting for the group by all provided in OPTIONS config.

### Dimension Deployment

#### Dimension Initial Deployment

When deployed for the first time into an environment the Dimension node of materialization type table will execute the Create Dimension Table stage.

| **Stage** | **Description** |
|-----------|----------------|
| **Create Dimension Table** | This will execute a `CREATE OR REPLACE` statement and create a table in the target environment |
| **Create Dimension View** | This will execute a `CREATE OR REPLACE` statement and create a view in the target environment |

#### Dimension Redeployment

After the Dimension node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Dimension Table or recreating the Dimension table.

#### Altering the Dimension Tables

A few types of column or table changes will result in an ALTER statement to modify the Work Table in the target environment, whether these changes are made individually or all together:

* Changing table names
* Dropping existing columns
* Altering column data types
* Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Clone Table** | Creates an internal table |
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |
| **Swap Cloned Table** | Upon successful completion of all updates, the clone replaces the main table ensuring that no data is lost |
| **Delete Table** | Drops the internal table |

#### Metadata Update for the Dimension Tables

If any of the following change are detected, metadata update stage executes.

* Join clause
* Adding transformation
* Changes in configuration like adding distinct or group by

One of the following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Making metadata updates** | Refreshes metadata |

#### Recreating the Dimension Views

Any of the following changes to views will result in deleting and recreating the Dimension view.

* View defintion
* Adding table description
* Renaming view results

### Dimension Undeployment

If a Dimension Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Dimension Table in the target environment will be dropped.

This is executed in below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete Table** | Target table in Google BigQuery is dropped |

If a Dimension Node of materialization type view is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Dimension View in the target environment will be dropped.

| **Stage** | **Description** |
|-----------|----------------|
| **Delete View** | Drops the existing Dimension view from target environment. |

---

## Fact

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Google BigQuery.

A fact table or a fact entity is a table or entity in a star or snowflake schema that stores measures that measure the business, such as sales, cost of goods, or profit. Fact tables and entities aggregate measures, or the numerical data of a business.

### Fact Node Configuration

The Fact node has two configuration groups:

* [Node Properties](#fact-node-properties)
* [Options](#fact-options)

<img width="434" height="205" alt="image" src="https://github.com/user-attachments/assets/3bf466b5-0eb6-43fe-8ba0-717330911a31" />

#### Fact Node Properties

| **Properties** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the Fact will be created |
| **Node Type** | Name of template used to create node objects |
| **Deploy Enabled** | If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Fact Options

| **Options** | **Description** |
|---------|-------------|
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Business key** | Required column for Fact table creation.<br/>**Note:** Geometry and Geography data type columns are not supported as business key columns. |
| **Last Modified Comparison**<br/> | **Toggle**: True/False <br/>- **True**: Enables high-performance Change Data Capture (CDC) by comparing a specific source timestamp or numeric column to identify records that have changed since the last load. <br/>- **False**: Performs standard CDC by comparing data values across all designated Change Tracking columns to detect modifications. |
| **Treat NULL as Current Timestamp**(For TIMESTAMP Columns) | **Toggle**: True/False <br/>- **True**: Source records with a `NULL` value in the comparison column are assigned the current system timestamp. This ensures that records with missing modification metadata are treated as "new" and are updated in the target table. <br/>- **False**: `NULL` values are handled per standard SQL comparison rules, which may result in these records being ignored during incremental loads. |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be truncated before data load.<br/> **True**:Truncate table stage gets executed<br/>**False**: Table is appended with data load |
| **Enable tests** | Toggle: True/False<br/>Determines if node/columns data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |
| **Pre-SQL** | SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

#### Fact View

<img width="345" height="529" alt="image" src="https://github.com/user-attachments/assets/0dc48ca3-9811-4dc2-8f4e-51cd43deb272" />

| **Setting** | **Description** |
|---------|-------------|
| **Override Create SQL** | Toggle: True/False<br/>**True**: Customized Create SQL specified in the `Create SQL` space is executed. All other options are invisible except 'Enable Tests'<br/>**False**: Create view SQL based on options chosen are framed and executed |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Enable tests** | Toggle: True/False<br/>Determines if node/columns data quality tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |

### Fact Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the UI.

<img width="515" height="163" alt="image" src="https://github.com/user-attachments/assets/d7dc7702-5b57-400f-a1d9-a654024d4f3f" />

> 📘 **Specify Group By Clause**
>
> You should specify group by clause in this space if you are not opting for the group by all provided in OPTIONS config.

### Fact Deployment

#### Fact Initial Deployment

When deployed for the first time into an environment the Fact node of materialization type table will execute the Create Fact Table stage.

| **Stage** | **Description** |
|-----------|----------------|
| **Create Fact Table** | This will execute a `CREATE OR REPLACE` statement and create a table in the target environment |
| **Create Fact View** | This will execute a `CREATE OR REPLACE` statement and create a view in the target environment |

#### Fact Redeployment

After the Fact node has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.


#### Altering the Fact Tables

A few types of column or table changes will result in an ALTER statement to modify the Work Table in the target environment, whether these changes are made individually or all together:

* Changing table names
* Dropping existing columns
* Altering column data types
* Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Clone Table** | Creates an internal table |
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |
| **Swap Cloned Table** | Upon successful completion of all updates, the clone replaces the main table ensuring that no data is lost |
| **Delete Table** | Drops the internal table |

#### Metadata Update for the Fact Tables

If any of the following change are detected, metadata update stage executes.

* Join clause
* Adding transformation
* Changes in configuration like adding distinct or group by

One of the following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Making metadata updates** | Refreshes metadata |

#### Recreating the Fact Views

The subsequent deployment of Work node of materialization type view with changes in view definition, adding table description or renaming view results in deleting the existing view and recreating the view.

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete View** | Removes existing view |
| **Create View** | Creates new view with updated definition |

### Fact Undeployment

If a Fact Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete Table** | Target table in Google BigQuery is dropped |

---

## View 

The Coalesce View UDN is a versatile node that allows you to develop and deploy a View in Google BigQuery.

A view allows the result of a query to be accessed as if it were a table. Views serve a variety of purposes, including combining, segregating, and protecting data.

### View Node Configuration

The View node type has two configuration groups:

* [Node Properties](#view-node-properties)
* [Options](#view-options)

<img width="473" height="203" alt="image" src="https://github.com/user-attachments/assets/fd2c7ee1-963b-4373-9a4a-610d4304454a" />


#### View Node Properties

| **Properties** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the View will be created |
| **Node Type** | Name of template used to create node objects |
| **Deploy Enabled** | If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### View Options

| **Options** | **Description** |
|---------|-------------|
| **Override Create SQL** | Toggle: True/False<br/>**True**: Customized Create SQL specified in the `Create SQL` space is executed. All other options are invisible<br/>**False**: Create view SQL based on options chosen are framed and executed |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- `UNION DISTINCT`: Combines sources with duplicate elimination<br/>- `UNION ALL`: Combines sources without duplicate elimination<br/>**False**: Single source node or multiple sources combined using a join |
| **Distinct** | Toggle: True/False<br/>**True**: Group By All is invisible. `DISTINCT` data is chosen for processing<br/>**False**: Group By All is visible |
| **Group By All** | Toggle: True/False<br/>**True**: DISTINCT is invisible. Data is grouped by all columns for processing<br/>**False**: DISTINCT is visible |

### View Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

> 📘 **Specify Group By Clauses**
>
> Best Practice is to specify group by clauses in this space if you are not opting for the group by all provided in OPTIONS config.

### View Deployment

#### View Initial Deployment

When deployed for the first time into an environment the View node will execute the Create View stage.

| **Stage** | **Description** |
|-----------|----------------|
| **Create View** | This will execute a CREATE OR REPLACE statement and create a View in the target environment |

#### View Redeployment

The subsequent deployment of View node with changes in view definition, adding table description, adding secure option or renaming view results in deleting the existing view and recreating the view.

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete View** | Removes existing view |
| **Create View** | Creates new view with updated definition |

#### View Undeployment

If a View Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the View in the target environment will be dropped.

This is executed in the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Delete View** | Removes the view from the environment |

## Code

### Work Code

* [Node definition](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Work-159/definition.yml)
* [Create Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Work-159/create.sql.j2)
* [Run Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Work-159/run.sql.j2)

### Persistent Stage Code

* [Node definition](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/PersistentStage-160/definition.yml)
* [Create Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/PersistentStage-160/create.sql.j2)
* [Run Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/PersistentStage-160/run.sql.j2)

### Dimension Code

* [Node definition](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Dimension-161/definition.yml)
* [Create Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Dimension-161/create.sql.j2)
* [Run Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Dimension-161/run.sql.j2)

### Fact Code

* [Node definition](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Fact-162/definition.yml)
* [Create Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Fact-162/create.sql.j2)
* [Run Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/Fact-162/run.sql.j2)


### View Code

* [Node definition](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/View-168/definition.yml)
* [Create Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/View-168/create.sql.j2)
* [Run Template](https://github.com/coalesceio/big-query-base-node-types/blob/main/nodeTypes/View-168/run.sql.j2)

[Macros](https://github.com/coalesceio/big-query-base-node-types/blob/main/macros/macro-1.yml)
