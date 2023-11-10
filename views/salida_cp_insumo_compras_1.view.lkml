
view: salida_cp_insumo_compras_1 {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.modelo_de_calculo.CP_Insumo_Compras_1` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: componente {
    type: string
    sql: ${TABLE}.Componente ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }

  dimension: Material {
    type: string
    sql: SUBSTR(${TABLE}.id,1,18) ;;
  }



  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension_group: fecha_orden_de_compra {
    type: time
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  set: detail {
    fields: [
        componente,
  id,
  fecha_inicio_produccion_time,
  fecha_orden_de_compra_time,
  tipo,
  cantidad_requerida
    ]
  }
}
