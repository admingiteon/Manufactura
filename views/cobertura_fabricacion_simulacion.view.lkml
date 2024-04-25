view: cobertura_fabricacion_simulacion {
derived_table: {
  sql: SELECT
    lp_pt_inv_lu_1.material,
    nombre_material.articulodescribe as descripcion_producto,
    lp_pt_inv_lu_1.fecha,
    IF(lp_pt_inv_lu_1.cantidad_requerida IS NOT NULL, lp_pt_inv_lu_1.cantidad_requerida, 0) AS cantidad_requerida,
    IF(lp_pt_fab_fin.producible IS NOT NULL, lp_pt_fab_fin.producible, 0) AS cobertura_fab
FROM
    `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Inventario_LU_1` AS lp_pt_inv_lu_1
LEFT JOIN
    `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Fabricacion_Final` AS lp_pt_fab_fin
ON
     (
                    Concat  (
                            lp_pt_inv_lu_1.material,
                            lp_pt_inv_lu_1.fecha

    )
    =
    Concat  (
    lp_pt_fab_fin.material,
    lp_pt_fab_fin.fecha
    )
    )
    LEFT JOIN
    (
    SELECT distinct(sku),articulodescribe FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_trazabilidad_nv`
    ) as nombre_material
    ON
    nombre_material.sku=lp_pt_inv_lu_1.material
    ;;
}

dimension: material {
  type: string
  sql: SUBSTR(${TABLE}.material,12,50) ;;
}

dimension: descripcion_producto {
  type: string
  sql: ${TABLE}.descripcion_producto ;;
}

dimension_group: fecha {
  type: time
  timeframes: [raw, time, date, week, month, quarter, year]
  sql: ${TABLE}.fecha ;;
}

measure: cantidad_requerida {
  label: "Requerimiento de Fabricación"
  type: sum
  sql: COALESCE(${TABLE}.cantidad_requerida, 0);;
}

measure: cobertura_fab{
  label: "Fabricación Final"
  type: sum
  sql: COALESCE(${TABLE}.cobertura_fab, 0) ;;
}

measure: problemas_fabricacion {
  type: yesno
  sql: ${cantidad_requerida} > ${cobertura_fab} ;;
}

measure: porcentaje_cobertura_fabricacion {
  type: number
  sql: CASE
        WHEN ${cantidad_requerida} = 0 OR
             ${cobertura_fab} IS NULL THEN 0
        ELSE ${cobertura_fab} / ${cantidad_requerida}
       END ;;
  value_format_name: "percent_0"

  html:
    {% if porcentaje_cobertura_fabricacion._value > 1 %}
    <p style="color:black; background-color: #90D26D;">{{ porcentaje_cobertura_fabricacion._rendered_value  }}</p>

    {% elsif porcentaje_cobertura_fabricacion._value < 0.2 and cantidad_requerida._value !=0  %}
    <p style="color: black; background-color: #FE0000;">{{ porcentaje_cobertura_fabricacion._rendered_value  }}</p>

    {% elsif cantidad_requerida._value ==0  %}
    <p style="color: black;">{{ porcentaje_cobertura_fabricacion._rendered_value  }}</p>

    {% else %}
    <p style="color: black; background-color: #FFD23F">{{ porcentaje_cobertura_fabricacion._rendered_value  }} </p>
    {% endif %}
    ;;
}

measure: count {
  type: count
}

}
