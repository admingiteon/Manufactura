#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: val_vw_ordenes_compra {
  derived_table: {
    sql: SELECT * FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_ordenes_compra` where sociedad in ('AMSA','DMTE','IARE','PGLO','PISA')  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: num_doc_compras {
    type: string
    sql: ${TABLE}.num_doc_compras ;;
  }


  measure: Total_ordenes {
    type: count_distinct
    sql: ${TABLE}.num_doc_compras ;;
  }





  measure: Total_proveedores {
    type: count_distinct
    sql: ${TABLE}.num_cuenta_proveedor ;;
  }

  measure: Total_materiales {
    type: count_distinct
    sql: ${TABLE}.num_material ;;
  }

  measure: Total_cant_entrada_mercancias {
    type: sum
    sql: ${TABLE}.cant_entrada_mercancias ;;
  }


  measure: Total_cant_reparto {
    type: sum
    sql: ${TABLE}.cant_reparto ;;
  }


  measure: Diferencia_cant {
    type: number
    sql: ${Total_cant_reparto}-${Total_cant_entrada_mercancias} ;;
  }

















  dimension: sociedad {
    type: string
    sql: ${TABLE}.sociedad ;;
  }

  dimension: clase_pedido {
    type: string
    sql: ${TABLE}.clase_pedido ;;
  }

  dimension: fecha_creacion_registro {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_creacion_registro ;;
  }

  dimension: num_cuenta_proveedor {
    type: string
    sql: ${TABLE}.num_cuenta_proveedor ;;
  }

  dimension: num_pos_doc_compras {
    type: string
    sql: ${TABLE}.num_pos_doc_compras ;;
  }

  dimension: num_material {
    type: string
    sql: ${TABLE}.num_material ;;
  }

  dimension: texto_breve {
    type: string
    sql: ${TABLE}.texto_breve ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: grupo_articulos {
    type: string
    sql: ${TABLE}.grupo_articulos ;;
  }

  dimension: plazo_entrega_previsto {
    type: number
    sql: ${TABLE}.plazo_entrega_previsto ;;
  }

  dimension: unidad_medida_pedido {
    type: string
    sql: ${TABLE}.unidad_medida_pedido ;;
  }

  dimension: unidad_medida_base {
    type: string
    sql: ${TABLE}.unidad_medida_base ;;
  }

  dimension: contador_repartos {
    type: string
    sql: ${TABLE}.contador_repartos ;;
  }

  dimension: fecha_entrega_pos {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_entrega_pos ;;
  }


  dimension_group: fecha_creacion_orden {
    label: "Fecha Orden"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name ,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_entrega_pos ;;
  }


  dimension_group: fecha_entrega {
    label: "Fecha Entrega"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name ,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_entrega_pos ;;
  }

  dimension: cant_reparto {
    type: number
    sql: ${TABLE}.cant_reparto ;;
  }

  dimension: cant_entrada_mercancias {
    type: number
    sql: ${TABLE}.cant_entrada_mercancias ;;
  }

  set: detail {
    fields: [
      num_doc_compras,
      sociedad,
      clase_pedido,
      fecha_creacion_registro,
      num_cuenta_proveedor,
      num_pos_doc_compras,
      num_material,
      texto_breve,
      centro,
      grupo_articulos,
      plazo_entrega_previsto,
      unidad_medida_pedido,
      unidad_medida_base,
      contador_repartos,
      fecha_entrega_pos,
      cant_reparto,
      cant_entrada_mercancias
    ]
  }
}
