view: fabricacion_no_cubierta {
  derived_table: {
    sql:
SELECT * FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_manufactura_vw_cobertura_fabricacion`
;;
  }


  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: fecha {
    type: date

  }
}
