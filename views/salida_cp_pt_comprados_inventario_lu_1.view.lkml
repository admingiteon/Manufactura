
view: salida_cp_pt_comprados_inventario_lu_1 {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.modelo_de_calculo.CP_PT_Comprados_Inventario_LU_1  where cantidad_a_comprar!=0  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_cantidad_a_comprar {
    label: "Cantidad a comprar"
    type: sum
     sql: ${TABLE}.cantidad_a_comprar ;;

  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: centro_fabricacion {
    type: string
    sql: ${TABLE}.centro_fabricacion ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: inventario_objetivo_proporcional {
    type: number
    sql: ${TABLE}.Inventario_Objetivo_Proporcional ;;
  }

  dimension: tipo_producto {
    type: string
    sql: ${TABLE}.tipo_producto ;;
  }

  dimension: cantidad_a_comprar {
    type: number
    sql: ${TABLE}.cantidad_a_comprar ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }

  dimension: tamano_lote_fabricacion {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion ;;
  }

  dimension_group: fecha_orden_de_compra {
    type: time
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }

  set: detail {
    fields: [
        fecha_time,
  id,
  cliente,
  centro,
  centro_fabricacion,
  material,
  cantidad,
  posicion_actual,
  inventario_objetivo_proporcional,
  tipo_producto,
  cantidad_a_comprar,
  stock_seguridad,
  tamano_lote_fabricacion,
  fecha_orden_de_compra_time
    ]
  }
}
