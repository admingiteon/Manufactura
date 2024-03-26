view: fabricacion_no_cubierta {
  derived_table: {
    sql:
SELECT t.fecha,t.material ,t.cantidad_requerida,b.cantidad_producible FROM
(select fecha, material,cantidad_requerida from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Inventario_LU_1`) as t

inner JOIN

(select fecha, material, cantidad_producible from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final`) as b

ON t.material=b.material and t.fecha=b.fecha
;;
  }


  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: fecha {
    type: date
    sql:  ${TABLE}.fecha;;

  }

  measure: cantidad_requerida{
    type: max
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: cobertura_fab{
    label: "cantidad_producible"
    type: max
    sql: CASE WHEN ${TABLE}.cantidad_producible IS NOT NULL THEN ${TABLE}.cantidad_producible ELSE 0 END ;;
  }



}
