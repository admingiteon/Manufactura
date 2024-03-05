
view: demanda_calculos {
  derived_table: {
    sql: SELECT *,CONCAT('00000000000' , material) SKU FROM `eon-bus-proj-cadena-demo.reporting_ecc_mx.demanda_calculos` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  measure: Total_cantidad{
    type: sum
     sql: ${cantidad};;
  }


  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: material {
    type: number
    sql: ${TABLE}.material ;;
  }

  dimension: grupo_articulos_externos {
    type: string
    sql: ${TABLE}.grupo_articulos_externos ;;
  }

  dimension: unidad_medida {
    type: string
    sql: ${TABLE}.unidad_medida ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: plazo_entrega {
    type: number
    sql: ${TABLE}.plazo_entrega ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: fecha_inicio_produccion {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }








  set: detail {
    fields: [
        int64_field_0,
  material,
  grupo_articulos_externos,
  unidad_medida,
  fecha,
  plazo_entrega,
  cantidad,
  posicion_actual,
  cantidad_requerida,
  fecha_inicio_produccion,
  sku
    ]
  }
}
