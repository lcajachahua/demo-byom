DATABASE demo_user; --- Reemplace con el nombre de su BD

--- CONSTRUIMOS LA TABLA DONDE SE ALMACENAN LOS MODELOS

DROP TABLE pmml_models;

CREATE SET TABLE pmml_models (
  model_id VARCHAR (30),
  model BLOB
)
PRIMARY INDEX (model_id);


--- CARGAMOS EL MODELO

INSERT INTO pmml_models VALUES ('churn_model', ?);

select * from pmml_models;


--- REVISAMOS LA TABLA DE SCORING Y EJECUTAMOS PMMLPredict

--- select top 10 * from new_churn;

SELECT * FROM mldb.PMMLPredict (
    ON new_churn AS InputTable
    ON (SELECT * FROM pmml_models WHERE model_id='churn_model') AS ModelTable DIMENSION
    USING
      Accumulate ('Phone')
      ModelOutputFields ('probability(0)', 'probability(1)') 
) AS td;
