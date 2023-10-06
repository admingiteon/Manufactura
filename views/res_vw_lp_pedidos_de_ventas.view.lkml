
view: res_vw_lp_pedidos_de_ventas {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.quality_data.vw_lp_pedidos_de_ventas`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: doc_ventas {
    type: string
    sql: ${TABLE}.doc_ventas ;;
  }

  dimension: fecha_creacion_registro {
    type: date
    datatype: date
    sql: ${TABLE}.fechaCreacion_registro ;;
  }

  dimension_group: Fecha_creacion {
    type: time

    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: cast(${TABLE}.fechaCreacion_registro AS TIMESTAMP) ;;
    convert_tz: no
  }



  dimension: clase_doc_ventas {
    type: string
    sql: ${TABLE}.clase_doc_ventas ;;
  }

  dimension: org_ventas {
    type: string
    sql: ${TABLE}.org_ventas ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.canal_distribucion ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.sector ;;
  }

  dimension: solicitante {
    type: string
    sql: ${TABLE}.solicitante ;;
  }

  dimension: valor_neto_pedido {
    type: number
    sql: ${TABLE}.valor_neto_pedido ;;
  }

  dimension: moneda_vbak {
    type: string
    sql: ${TABLE}.moneda_vbak ;;
  }

  dimension: sociedad_facturadora {
    type: string
    sql: ${TABLE}.sociedad_facturadora ;;
  }

  dimension: fecha_entrega {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_entrega ;;
  }

  dimension: posicion {
    type: string
    sql: ${TABLE}.posicion ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: grupo_articulos {
    type: string
    sql: ${TABLE}.grupo_articulos ;;
  }

  dimension: texto_breve {
    type: string
    sql: ${TABLE}.texto_breve ;;
  }

  dimension: cantidad_pedido {
    type: number
    sql: ${TABLE}.cantidad_pedido ;;
  }

  dimension: cantidad_confirmada {
    type: number
    sql: ${TABLE}.cantidad_confirmada ;;
  }

  dimension: valor_posicion {
    type: number
    sql: ${TABLE}.valor_posicion ;;
  }

  dimension: moneda_vbap {
    type: string
    sql: ${TABLE}.moneda_vbap ;;
  }

  dimension: precio {
    type: number
    sql: ${TABLE}.precio ;;
  }

  dimension: tipo_cambio {
    type: number
    sql: ${TABLE}.tipo_cambio ;;
  }

  dimension: motivo_rechazo {
    type: string
    sql: ${TABLE}.motivo_rechazo ;;
  }

  dimension: estatus_entrega {
    type: string
    sql: ${TABLE}.estatus_entrega ;;
  }

  dimension: estatus_facturas_base_entregas {
    type: string
    sql: ${TABLE}.estatus_facturas_base_entregas ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: cliente_destinatario {
    type: string
    sql: ${TABLE}.cliente_destinatario ;;
  }

  set: detail {
    fields: [
        doc_ventas,
  fecha_creacion_registro,
  clase_doc_ventas,
  org_ventas,
  canal_distribucion,
  sector,
  solicitante,
  valor_neto_pedido,
  moneda_vbak,
  sociedad_facturadora,
  fecha_entrega,
  posicion,
  material,
  grupo_articulos,
  texto_breve,
  cantidad_pedido,
  cantidad_confirmada,
  valor_posicion,
  moneda_vbap,
  precio,
  tipo_cambio,
  motivo_rechazo,
  estatus_entrega,
  estatus_facturas_base_entregas,
  centro,
  cliente_destinatario
    ]
  }
}
