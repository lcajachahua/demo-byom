DATABASE DATALAB; --- Reemplace con el nombre de su BD

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

select * from new_churn;

SELECT * FROM TRNG_BYOM.PMMLPredict (
    ON new_churn AS InputTable
    ON (SELECT * FROM pmml_models WHERE model_id='churn_model') AS ModelTable DIMENSION
    USING
      Accumulate ('Phone')
) AS td;
